#define scrSpellCreate
/// scrSpellCreate(spell, level, unlocked, spriteIndex)

var spell, level, u, s;
spell    = SpellEnum.spellFlash;
level    = 0;
u        = true;
s        = sSpellFireball;

if (argument_count > 0) {spell     = argument[0];} 
if (argument_count > 1) {level     = argument[1];} 
if (argument_count > 2) {u         = argument[2];} 
if (argument_count > 3) {s         = argument[3];} 

spellLevel[spell,0]   = 0;    
spellLevel[spell,1]   = 0; 
ds_list_add(spellList, "");
ds_list_add(spellListAlpha, 0);
tempSpell = spell;
spellUnlocked[spell] = u; 
spellSprite[spell] = s;


#define scrSpellCreateDetails
/// scrSpellCreateDetails(spellNameLevel1, spellNameLevel2, spellNameLevel3, spellDetailsLevel1, spellDetailsLevel2, spellDetailsLevel3, spellImageIndexLevel1, spellImageIndexLevel2, spellImageIndexLevel3)

var n1, n2, n3, d1, d2, d3, i1, i2, i3;
n1 = "";
n2 = "";
n3 = "";
d1 = "";
d2 = "";
d3 = "";
i1 = 0;
i2 = 0;
i3 = 0;

if (argument_count > 0) {n1         = argument[0];} 
if (argument_count > 1) {n2         = argument[1];} 
if (argument_count > 2) {n3         = argument[2];} 
if (argument_count > 3) {d1         = argument[3];} 
if (argument_count > 4) {d2         = argument[4];} 
if (argument_count > 5) {d3         = argument[5];} 
if (argument_count > 6) {i1         = argument[6];} 
if (argument_count > 7) {i2         = argument[7];}
if (argument_count > 8) {i3         = argument[8];}

if (i2 == 0) {i2 = (i1 + 1);}
if (i3 == 0) {i3 = (i2 + 1);}


// verticle format: (text, details, imageIndex)
// level 1
spellDetails[tempSpell,0] = n1; 
spellDetails[tempSpell,1] = d1; 
spellDetails[tempSpell,2] = i1; 

// level 2
spellDetails[tempSpell,3] = n2;
spellDetails[tempSpell,4] = d2; 
spellDetails[tempSpell,5] = i2;

// level 3
spellDetails[tempSpell,6] = n3; 
spellDetails[tempSpell,7] = d3;
spellDetails[tempSpell,8] = i3; 


#define scrSpellCreatePointDetails
/// scrSpellCreatePointDetails(detail1Level0.. detail1Level3)

for (i = 0; i < 16; i++)
    {
    if (argument_count > i) {spellDetails[tempSpell, (9 + i)] = scrWordwrap(argument[i], 550, fntPixelSmall);} 
    }              

#define scrSpellCreatePointProperties
/// scrSpellCreatePointProperties(detail0...detail12)

for (i = 0; i < 16; i++)
    {
    if (argument_count > i) {spellProperties[tempSpell, (9 + i)] = argument[i];} 
    }

#define scrSpellCreateRequirements
/// scrSpellCreateRequirements(reqType, req0..req12)

enum spellReqEnum
{
 reqInt, reqSouls
}

if (argument[0] == spellReqEnum.reqInt)
{
for (i = 1; i < 16; i++)
    {
     if (argument_count > i) {spellReqInt[tempSpell, i] = argument[i];} 
    }             
}

if (argument[0] == spellReqEnum.reqSouls)
{
for (i = 1; i < 16; i++)
    {
     if (argument_count > i) {spellReqSouls[tempSpell, i] = argument[i];} 
    }             
}