﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml;
using System.Xml.Linq;

namespace SimplexMainForm
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        IDictionary<string, int> dict = new Dictionary<string, int>();
        public List<AchievementClass> achList = new List<AchievementClass>();
        public List<GameObject> objects = new List<GameObject>();
        string pathCore = "";

        private void loadProjectToolStripMenuItem_Click(object sender, EventArgs e)
        {
            openFileDialog1.ShowDialog();
        }


        // Loads resource tree from GMS project
        void LoadTree(XElement root, TreeNode rootNode, string datafile, string datafileEnd, string type)
        {
            foreach (var e in root.Elements().Where(e => e.Attribute("name") != null))
            {
                var node = new TreeNode(e.Attribute("name").Value, 1, 1);
                rootNode.Nodes.Add(node);

                foreach (var k in e.Elements().Where(k => k.Value != null && k.Name == datafile))
                {
                    var node2 = new TreeNode(k.Value);
                    string n = Convert.ToString(node2);
                    n = n.Replace(datafileEnd, "");
                    n = n.Replace(@"TreeNode: ", "");
                    n = n.Replace(@"sprites\", "");
                    node2.Name = n;

                    if (type == "sprite")
                    {
                        string file = getFilePath(n, "sprite");
                        int pos = 0;
                        int i = 0;
                        foreach (char znak in file)
                        {
                            if (znak == '\\') { pos = i; }
                            i++;
                        }
                        string filePathCore = file.Substring(0, pos);

                        try
                        {
                            XmlReader xr = XmlReader.Create(file);
                            while (xr.Read())
                            {
                                if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                                {
                                    xr.Read();
                                    string imageFile = xr.Value;

                                    imageList1.Images.Add(FastImage(filePathCore + @"\" + imageFile));
                                    node2.ImageIndex = imageList1.Images.Count-1;
                                    node2.SelectedImageIndex = node2.ImageIndex;
                                    dict[n] = node2.ImageIndex;
                                    break;
                                }
                            }
                        }
                        catch { }
                    }
                    else if (type == "object")
                    {
                        try
                        {
                            GameObject go = new GameObject();
                            go.name = n;

                            string file = getFilePath(n, "object");
                            XmlReader reader = XmlReader.Create(file);

                            while (reader.Read())
                            {
                                if (reader.NodeType == XmlNodeType.Element && reader.Name == "object")
                                {
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "spriteName")
                                        {
                                            string spriteName = reader.ReadString();
                                            go.sprite = spriteName;

                                            int index = dict.FirstOrDefault(x => x.Key == spriteName).Value;


                                            node2.ImageIndex = index;
                                            node2.SelectedImageIndex = node2.ImageIndex;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "solid")
                                        {
                                            bool solid = false;
                                            string str = reader.ReadString();
                                            if (str == "-1") { solid = true; }
                                            go.solid = solid;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "visible")
                                        {
                                            bool solid = false;
                                            string str = reader.ReadString();
                                            if (str == "-1") { solid = true; }
                                            go.visible = solid;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "depth")
                                        {
                                            int str = int.Parse(reader.ReadString());
                                            go.depth = str;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "parentName")
                                        {
                                            string str = reader.ReadString();
                                            go.parent = str;
                                            break;
                                        }
                                    }
                                    while (reader.Read())
                                    {
                                        if (reader.NodeType == XmlNodeType.Element && reader.Name == "maskName")
                                        {
                                            string str = reader.ReadString();
                                            if (str == "<undefined>") { str = "<same as sprite>"; }
                                            go.mask = str;
                                            break;
                                        }
                                    }
                                }

                                if (!objects.Contains(go))
                                {
                                    objects.Add(go);
                                }
                            }
                           
                        }
                        catch { }
                    }

                    rootNode.Nodes[node.Index].Nodes.Add(node2);
                    rootNode.Nodes[node.Index].Nodes[node2.Index].Text = n;
                }

                LoadTree(e, node, datafile, datafileEnd, type);
            }

            foreach (GameObject go in objects)
            {
                foreach (GameObject temp in objects)
                {
                    if (temp.parent == go.name) { go.childrens.Add(temp.name); }
                }
            }
        }

        public Image FastImage(string path) { using (MemoryStream ms = new MemoryStream(File.ReadAllBytes(path))) return Image.FromStream(ms, false, false); }

        void tempLoad(XElement root, TreeNode rootNode, string datafile, string datafileEnd)
        {
            foreach (var k in root.Elements().Where(k => k.Value != null && k.Name == datafile))
            {
                var node2 = new TreeNode(k.Value);
                string n = Convert.ToString(node2);
                n = n.Replace(datafileEnd, "");
                n = n.Replace(@"TreeNode: ", "");
                rootNode.Nodes.Add(n);
            }
        }

        private void treeView1_DoubleClick(object sender, EventArgs e)
        {
            var menuItem = treeView1.SelectedNode;

            // Get root node
            TreeNode rootNode = treeView1.SelectedNode;
            while (rootNode.Parent != null)
            {
                rootNode = rootNode.Parent;
            }

            if (rootNode.ToString() == "TreeNode: Sprites")
            {
                // Open image in paint
                string file = getFilePath(menuItem.Name, "sprite");
                int pos = 0;
                int i = 0;
                foreach (char znak in file)
                {
                    if (znak == '\\') { pos = i; }
                    i++;
                }
                string filePathCore = file.Substring(0, pos);

                try
                {
                    XmlReader xr = XmlReader.Create(file);
                    while (xr.Read())
                    {
                        if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                        {
                            xr.Read();
                            string imageFile = xr.Value;

                            string final = filePathCore + @"\" + imageFile;
                            Process.Start(final);
                            break;
                        }
                    }
                }
                catch { }
            }
            else if (menuItem != null)
            {
                string name = menuItem.ToString();
                name = name.Replace("TreeNode: ", "");
                string file = getFilePath(name, "object");

                Object o = new Object(file, objects.Where(i => i.name == name).FirstOrDefault());
                o.Text = "Object - " + name;
                o.Show();
            }
        }

        void assignSprites()
        {
            int i = 0;
            foreach(TreeNode tn in treeView1.Nodes)
            {
                if (i == 0) { continue; }

                string name = tn.ToString();
                MessageBox.Show(name);
                name = name.Replace("TreeNode: ", "");
                string file = getFilePath(name, "sprite");
                XmlReader xr = XmlReader.Create(file);
                while(xr.Read())
                {
                    if (xr.NodeType == XmlNodeType.Element && xr.Name == "frame")
                    {
                        xr.Read();
                        string imageFile = xr.Value;
                        imageList1.Images.Add(Image.FromFile(imageFile));
                        tn.ImageIndex = imageList1.Images.Count;
                        MessageBox.Show("");
                        break;
                    }
                }

                i++;
            }
        }

        public string getFilePath(string name, string rName)
        {
            string output = "";
            string[] filePaths = null;

              filePaths = Directory.GetFiles(pathCore + rName + "s");

            for (int i = 0; i < filePaths.Length; i++)
            {
                if (filePaths[i].EndsWith(name + "." + rName +".gmx"))
                {
                    output = filePaths[i];
                    break;
                }
            }

            return output;
        }

        private void manageAchievementsToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Achievements aForm = new Achievements(this);
            aForm.Show();
        }

        private void openFileDialog1_FileOk(object sender, CancelEventArgs e)
        {
            TreeNode r = new TreeNode("Objects", 1, 1);
            TreeNode spr = new TreeNode("Sprites", 1, 1);
            pathCore = openFileDialog1.FileName;
            pathCore = pathCore.Substring(0, pathCore.LastIndexOf("Engine source\\") + 14);

            var xDoc = XDocument.Load(openFileDialog1.FileName);
            LoadTree(xDoc.Root.Element("sprites"), spr, "sprite", @"sprites\", "sprite");
            tempLoad(xDoc.Root.Element("sprites"), spr, "sprite", @"sprites\");
            //   assignSprites();
            treeView1.Nodes.Add(spr);

            LoadTree(xDoc.Root.Element("objects"), r, "object", @"objects\", "object");
            treeView1.Nodes.Add(r);

        }

        private void fileToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }
    }
}
