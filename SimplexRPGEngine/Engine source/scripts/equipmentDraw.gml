#define equipmentDraw
/// equipmentDraw()

xx = x+288;
yy = y;

if (instance_number(oPlayer) > 0)
   {
    equipmentDrawSlots();
   }


#define equipmentDrawSlots
/// equipmentDrawSlots()


clr();
fnt(fntPixelHuge);
draw_sprite(sInventoryTitle,2,xx,yy);
scrCenterText();
draw_text(xx+124,yy+16,"Výstroj");
fnt(fntPixel);
alg();
fnt(fntText);
 
yy = yy + 36;

draw_sprite_stretched(sUnknownBestiary, 0, xx, yy, 256, 256);
draw_equ_infobox_id = -1;
draw_sprite(sEquipmentBase, 0, xx + 32, yy + 32);
draw_sprite_ext(sEquipmentBaseIcons, 0, xx + 32, yy + 32, 1, 1, 0, c_white, 0.5);

// Draw head slot --------------------------------------------------------------------------------------------------------------------------
if (oPlayer.equ_draw_head)
{
if (oInventory.equiped[1]) {draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[1,2]),xx+equ_axis_head_x,yy+equ_axis_head_y);}
else {draw_sprite(sEquipmentIcons,0,xx+equ_axis_head_x + 4,yy+equ_axis_head_y + 2);}

draw_sprite(equiped_image[1,0],equiped_image[1,1],xx+equ_axis_head_x+18,yy+equ_axis_head_y+14)


if (mouse_in(xx+equ_axis_head_x,xx+equ_axis_head_x+32,yy+equ_axis_head_y,yy+equ_axis_head_y+32))
   {
   draw_hover_block(xx+equ_axis_head_x+2,xx+equ_axis_head_x+34,yy+equ_axis_head_y-1,yy+equ_axis_head_y+32);
   draw_equ_infobox_id = 1;
   if (mouse_check_button_pressed(mb_left)) {if (oInventory.equiped[1]) {equipmentUnequip(1, false);}}
   }
   
if (oInventory.drag && oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "helma")
   { 
   if (!oInventory.equiped[1]) {draw_hover_block(xx+equ_axis_head_x+2,xx+equ_axis_head_x+34,yy+equ_axis_head_y-1,yy+equ_axis_head_y+32,c_lime);}
   equipmentHoldEquip(1,xx+equ_axis_head_x,xx+equ_axis_head_x+32,yy+equ_axis_head_y,yy+equ_axis_head_y+32);
   }    
}

// Draw left plate slot  -----------------------------------------------------------------------------------------------------
if (oPlayer.equ_draw_left_plate)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_left_plate_x,yy+equ_axis_left_plate_y);
if (oInventory.equiped[4]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[4,2]),xx+equ_axis_left_plate_x,yy+equ_axis_left_plate_y); }
else {draw_sprite(sEquipmentIcons,4,xx+equ_axis_left_plate_x,yy+equ_axis_left_plate_y);}
draw_sprite(equiped_image[4,0],equiped_image[4,1],xx+equ_axis_left_plate_x+16,yy+equ_axis_left_plate_y+16)

if (mouse_in(xx+equ_axis_left_plate_x,xx+equ_axis_left_plate_x+32,yy+equ_axis_left_plate_y,yy+equ_axis_left_plate_y+32))
   {
   draw_hover_block(xx+equ_axis_left_plate_x,xx+equ_axis_left_plate_x+32,yy+equ_axis_left_plate_y,yy+equ_axis_left_plate_y+32);
   draw_equ_infobox_id = 4;
   
      if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[4]) {equipmentUnequip(4, false);}
      }
   }
   
if (oInventory.drag && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "leftPlate" )
   { 
   if (!oInventory.equiped[4]) {draw_hover_block(xx+equ_axis_left_plate_x,xx+equ_axis_left_plate_x+32,yy+equ_axis_left_plate_y,yy+equ_axis_left_plate_y+32,c_lime,0.5);}
   equipmentHoldEquip(4,xx+equ_axis_left_plate_x,xx+equ_axis_left_plate_x+32,yy+equ_axis_left_plate_y,yy+equ_axis_left_plate_y+32);
   }
   
draw_sprite(sSlotOutline,0,xx+equ_axis_left_plate_x-2,yy+equ_axis_left_plate_y-2);  

}
// Draw right plate slot 
if (oPlayer.egu_draw_right_plate)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_right_plate_x,yy+equ_axis_right_plate_y);
if (oInventory.equiped[3]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[3,2]),xx+equ_axis_right_plate_x,yy+equ_axis_right_plate_y); }
else {draw_sprite(sEquipmentIcons,3,xx+equ_axis_right_plate_x,yy+equ_axis_right_plate_y);}
draw_sprite(equiped_image[3,0],equiped_image[3,1],xx+equ_axis_right_plate_x+16,yy+equ_axis_right_plate_y+16)

if (mouse_in(xx+equ_axis_right_plate_x,xx+equ_axis_right_plate_x+32,yy+equ_axis_right_plate_y,yy+equ_axis_right_plate_y+32))
   {
   draw_hover_block(xx+equ_axis_right_plate_x,xx+equ_axis_right_plate_x+32,yy+equ_axis_right_plate_y,yy+equ_axis_right_plate_y+32);
   draw_equ_infobox_id = 3;
   
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[3]) {equipmentUnequip(3, false);}
      }
   }

if (oInventory.drag && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "rightPlate" )
   { 
   if (!oInventory.equiped[3]) {draw_hover_block(xx+equ_axis_right_plate_x,xx+equ_axis_right_plate_x+32,yy+equ_axis_right_plate_y,yy+equ_axis_right_plate_y+32,c_lime,0.5);}
   equipmentHoldEquip(3,xx+equ_axis_right_plate_x,xx+equ_axis_right_plate_x+32,yy+equ_axis_right_plate_y,yy+equ_axis_right_plate_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_right_plate_x-2,yy+equ_axis_right_plate_y-2);  


}
// Draw body slot 
if (oPlayer.equ_draw_body)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_body_x,yy+equ_axis_body_y);
if (oInventory.equiped[2]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[2,2]),xx+equ_axis_body_x,yy+equ_axis_body_y); }
else {draw_sprite(sEquipmentIcons,2,xx+equ_axis_body_x,yy+equ_axis_body_y);}
draw_sprite(equiped_image[2,0],equiped_image[2,1],xx+equ_axis_body_x+16,yy+equ_axis_body_y+16)

if (mouse_in(xx+equ_axis_body_x,xx+equ_axis_body_x+32,yy+equ_axis_body_y,yy+equ_axis_body_y+32))
   {
   draw_hover_block(xx+equ_axis_body_x,xx+equ_axis_body_x+32,yy+equ_axis_body_y,yy+equ_axis_body_y+32);
   draw_equ_infobox_id = 2;
   
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[2]) {equipmentUnequip(2, false);}
      }
   }
   
if (oInventory.drag && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "armor" )
   { 
   if (!oInventory.equiped[2]) {draw_hover_block(xx+equ_axis_body_x,xx+equ_axis_body_x+32,yy+equ_axis_body_y,yy+equ_axis_body_y+32,c_lime,0.5);}
   equipmentHoldEquip(2,xx+equ_axis_body_x,xx+equ_axis_body_x+32,yy+equ_axis_body_y,yy+equ_axis_body_y+32);
   }
   
draw_sprite(sSlotOutline,0,xx+equ_axis_body_x-2,yy+equ_axis_body_y-2);  

}
// Draw right hand slot -------------------------------------------------------------------------------------------------------------------
if (oPlayer.equ_draw_right_hand)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_right_hand_x,yy+equ_axis_right_hand_y);
if (oInventory.equiped[0]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[0,2]),xx+equ_axis_right_hand_x,yy+equ_axis_right_hand_y); }
else {draw_sprite(sEquipmentIcons,0,xx+equ_axis_right_hand_x,yy+equ_axis_right_hand_y);}
draw_sprite(equiped_image[0,0],equiped_image[0,1],xx+equ_axis_right_hand_x+16,yy+equ_axis_right_hand_y+16)

if (mouse_in(xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32))
   {   
   draw_hover_block(xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32);
   draw_equ_infobox_id = 0;
   
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[0]) {equipmentUnequip(0, false);}
      } 
   }
      
if (oInventory.drag && oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "zbraň")
   { 
   if (oInventory.equiped[0] = 0) {draw_hover_block(xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32,c_lime,0.5);}
   equipmentHoldEquip(0,xx+equ_axis_right_hand_x,xx+equ_axis_right_hand_x+32,yy+equ_axis_right_hand_y,yy+equ_axis_right_hand_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_right_hand_x-2,yy+equ_axis_right_hand_y-2);  

if (oInventory.equiped_vlastnost[0, vlastnost_durability] > 0)
   {
    percent = ((oInventory.equiped_vlastnost[0, vlastnost_durability] / oInventory.equiped_vlastnost[0, vlastnost_max_durability]) * 100);       
    if (oInventory.equiped_vlastnost[0, vlastnost_durability] == 1) {draw_sprite(sRarityEffect, 15, xx+equ_axis_right_hand_x, yy+equ_axis_right_hand_y);}         
    else if (percent < 25) {draw_sprite(sRarityEffect, 14, xx+equ_axis_right_hand_x, yy+equ_axis_right_hand_y);}         
    else if (percent < 50) {draw_sprite(sRarityEffect, 13, xx+equ_axis_right_hand_x, yy+equ_axis_right_hand_y);}
   }

}
// Draw left hand slot 
if (oPlayer.equ_draw_left_hand)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_left_hand_x,yy+equ_axis_left_hand_y);
if (oInventory.equiped[5]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[5,2]),xx+equ_axis_left_hand_x,yy+equ_axis_left_hand_y); }
else {draw_sprite(sEquipmentIcons,5,xx+equ_axis_left_hand_x,yy+equ_axis_left_hand_y);}
draw_sprite(equiped_image[5,0],equiped_image[5,1],xx+equ_axis_left_hand_x+16,yy+equ_axis_left_hand_y+16);

if (equiped_image[5,0] != sFreeSlot)
   {
    alg();
    fnt(fntPixelSmall);
    clr(c_white, 0.5);
    draw_roundrect_ext(xx+equ_axis_left_hand_x+17-(string_width(string(oInventory.equiped_stats[5, inv_number]))/2),yy+equ_axis_left_hand_y+16,xx+equ_axis_left_hand_x+22+(string_width(string(oInventory.equiped_stats[5, inv_number]))/2),yy+equ_axis_left_hand_y+30,10,10,0);
    clr();
    draw_text_colour(xx+equ_axis_left_hand_x+22-(string_width(string(ret))/2),yy+equ_axis_left_hand_y+14,oInventory.equiped_stats[5, inv_number],c_dkgray,c_dkgray,c_dkgray,c_dkgray,1);
    draw_text_colour(xx+equ_axis_left_hand_x+21-(string_width(string(ret))/2),yy+equ_axis_left_hand_y+14,oInventory.equiped_stats[5, inv_number],c_black,c_black,c_black,c_black,1);
   }

if (mouse_in(xx+equ_axis_left_hand_x,xx+equ_axis_left_hand_x+32,yy+equ_axis_left_hand_y,yy+equ_axis_left_hand_y+32))
   {
   draw_hover_block(xx+equ_axis_left_hand_x,xx+equ_axis_left_hand_x+32,yy+equ_axis_left_hand_y,yy+equ_axis_left_hand_y+32);
   draw_equ_infobox_id = 5;
   
     if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[5]) {equipmentUnequip(5, false);}
      }  
   }

if (oInventory.drag && oInventory.slot[oInventory.h_c,inv_item_equip_slot] == "shield" )
   { 
   if (oInventory.equiped[5] == 0) {draw_hover_block(xx+equ_axis_left_hand_x,xx+equ_axis_left_hand_x+32,yy+equ_axis_left_hand_y,yy+equ_axis_left_hand_y+32,c_lime,0.5);}
   equipmentHoldEquip(5,xx+equ_axis_left_hand_x,xx+equ_axis_left_hand_x+32,yy+equ_axis_left_hand_y,yy+equ_axis_left_hand_y+32);
   }
   
draw_sprite(sSlotOutline,0,xx+equ_axis_left_hand_x-2,yy+equ_axis_left_hand_y-2);  
}

// Draw left ring1 slot 
if (oPlayer.equ_draw_left_ring1)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_left_ring1_x,yy+equ_axis_left_ring1_y);
if (oInventory.equiped[6]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[6,2], true),xx+equ_axis_left_ring1_x,yy+equ_axis_left_ring1_y); }
else {draw_sprite(sEquipmentIcons,6,xx+equ_axis_left_ring1_x,yy+equ_axis_left_ring1_y);}
draw_sprite(equiped_image[6,0],equiped_image[6,1],xx+equ_axis_left_ring1_x-8+16,yy+equ_axis_left_ring1_y-8+16)


if (mouse_in(xx+equ_axis_left_ring1_x,xx+equ_axis_left_ring1_x+16,yy+equ_axis_left_ring1_y,yy+equ_axis_left_ring1_y+16))
   {
   draw_hover_block(xx+equ_axis_left_ring1_x,xx+equ_axis_left_ring1_x+16,yy+equ_axis_left_ring1_y,yy+equ_axis_left_ring1_y+16);
   draw_equ_infobox_id = 6;
       
     if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[6]) {equipmentUnequip(6, false);}
      }    
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "ring" )
   { 
   if (oInventory.equiped[6] = 0) {draw_hover_block(xx+equ_axis_left_ring1_x,xx+equ_axis_left_ring1_x+16,yy+equ_axis_left_ring1_y,yy+equ_axis_left_ring1_y+16,c_lime,0.5);}
   equipmentHoldEquip(6,xx+equ_axis_left_ring1_x,xx+equ_axis_left_ring1_x+32,yy+equ_axis_left_ring1_y,yy+equ_axis_left_ring1_y+32);
   }
draw_sprite(sSlotTexture,7,xx+equ_axis_left_ring1_x-2,yy+equ_axis_left_ring1_y-2);  
}

// Draw left ring2 slot 
if (oPlayer.equ_draw_left_ring2)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_left_ring2_x,yy+equ_axis_left_ring2_y);
if (oInventory.equiped[7]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[7,2], true),xx+equ_axis_left_ring2_x,yy+equ_axis_left_ring2_y); }
else {draw_sprite(sEquipmentIcons,6,xx+equ_axis_left_ring2_x,yy+equ_axis_left_ring2_y);}
draw_sprite(equiped_image[7,0],equiped_image[7,1],xx+equ_axis_left_ring2_x-8+16,yy+equ_axis_left_ring2_y-8+16)

if (mouse_in(xx+equ_axis_left_ring2_x,xx+equ_axis_left_ring2_x+16,yy+equ_axis_left_ring2_y,yy+equ_axis_left_ring2_y+16))
   {
   draw_hover_block(xx+equ_axis_left_ring2_x,xx+equ_axis_left_ring2_x+16,yy+equ_axis_left_ring2_y,yy+equ_axis_left_ring2_y+16);
   draw_equ_infobox_id = 7;
   
     if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[7]) {equipmentUnequip(7, false);}
      }    
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "ring" )
   { 
   if (oInventory.equiped[7] = 0) {draw_hover_block(xx+equ_axis_left_ring2_x,xx+equ_axis_left_ring2_x+16,yy+equ_axis_left_ring2_y,yy+equ_axis_left_ring2_y+16,c_lime,0.5);}
   equipmentHoldEquip(7,xx+equ_axis_left_ring2_x,xx+equ_axis_left_ring2_x+32,yy+equ_axis_left_ring2_y,yy+equ_axis_left_ring2_y+32);
   }
   
draw_sprite(sSlotTexture,7,xx+equ_axis_left_ring2_x-2,yy+equ_axis_left_ring2_y-2);  
}

// Draw right ring1 slot 
if (oPlayer.equ_draw_right_ring1)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_right_ring1_x,yy+equ_axis_right_ring1_y);
if (oInventory.equiped[8]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[8,2], true),xx+equ_axis_right_ring1_x,yy+equ_axis_right_ring1_y); }
else {draw_sprite(sEquipmentIcons,6,xx+equ_axis_right_ring1_x,yy+equ_axis_right_ring1_y);}
draw_sprite(equiped_image[8,0],equiped_image[8,1],xx+equ_axis_right_ring1_x-8+16,yy+equ_axis_right_ring1_y-8+16)


if (mouse_in(xx+equ_axis_right_ring1_x,xx+equ_axis_right_ring1_x+16,yy+equ_axis_right_ring1_y,yy+equ_axis_right_ring1_y+16))
   {
   draw_hover_block(xx+equ_axis_right_ring1_x,xx+equ_axis_right_ring1_x+16,yy+equ_axis_right_ring1_y,yy+equ_axis_right_ring1_y+16);
   draw_equ_infobox_id = 8;
   
   
     if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[8]) {equipmentUnequip(8, false);}
      }    
   }
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "ring" )
   { 
   if (oInventory.equiped[8] = 0) {draw_hover_block(xx+equ_axis_right_ring1_x,xx+equ_axis_right_ring1_x+16,yy+equ_axis_right_ring1_y,yy+equ_axis_right_ring1_y+16,c_lime,0.5);}
   equipmentHoldEquip(8,xx+equ_axis_right_ring1_x,xx+equ_axis_right_ring1_x+32,yy+equ_axis_right_ring1_y,yy+equ_axis_right_ring1_y+32);
   }
draw_sprite(sSlotTexture,7,xx+equ_axis_right_ring1_x-2,yy+equ_axis_right_ring1_y-2);  
}

// Draw right ring2 slot 
if (oPlayer.equ_draw_right_ring2)
{
draw_sprite(sSlotTexture,2,xx+equ_axis_right_ring2_x,yy+equ_axis_right_ring2_y);
if (oInventory.equiped[9]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[9,2], true),xx+equ_axis_right_ring2_x,yy+equ_axis_right_ring2_y); }
else {draw_sprite(sEquipmentIcons,6,xx+equ_axis_right_ring2_x,yy+equ_axis_right_ring2_y);}
draw_sprite(equiped_image[9,0],equiped_image[9,1],xx+equ_axis_right_ring2_x-8+16,yy+equ_axis_right_ring2_y-8+16)


if (mouse_in(xx+equ_axis_right_ring2_x,xx+equ_axis_right_ring2_x+16,yy+equ_axis_right_ring2_y,yy+equ_axis_right_ring2_y+16))
   {
   draw_hover_block(xx+equ_axis_right_ring2_x,xx+equ_axis_right_ring2_x+16,yy+equ_axis_right_ring2_y,yy+equ_axis_right_ring2_y+16);
   draw_equ_infobox_id = 9;
   
     if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[9]) {equipmentUnequip(9, false);}
      }
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "ring" )
   { 
   if (oInventory.equiped[9] = 0) {draw_hover_block(xx+equ_axis_right_ring2_x,xx+equ_axis_right_ring2_x+16,yy+equ_axis_right_ring2_y,yy+equ_axis_right_ring2_y+16,c_lime,0.5);}
   equipmentHoldEquip(9,xx+equ_axis_right_ring2_x,xx+equ_axis_right_ring2_x+32,yy+equ_axis_right_ring2_y,yy+equ_axis_right_ring2_y+32);
   }
draw_sprite(sSlotTexture,7,xx+equ_axis_right_ring2_x-2,yy+equ_axis_right_ring2_y-2);  
}

// Draw crown slot 
if (oPlayer.equ_draw_crown)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_crown_x,yy+equ_axis_crown_y);
if (oInventory.equiped[10]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[10,2]),xx+equ_axis_crown_x,yy+equ_axis_crown_y); }
else {draw_sprite(sEquipmentIcons,7,xx+equ_axis_crown_x,yy+equ_axis_crown_y);}
draw_sprite(equiped_image[10,0],equiped_image[10,1],xx+equ_axis_crown_x+16,yy+equ_axis_crown_y+16)

if (mouse_in(xx+equ_axis_crown_x,xx+equ_axis_crown_x+32,yy+equ_axis_crown_y,yy+equ_axis_crown_y+32))
   {
   draw_hover_block(xx+equ_axis_crown_x,xx+equ_axis_crown_x+32,yy+equ_axis_crown_y,yy+equ_axis_crown_y+32);
   draw_equ_infobox_id = 10;
   
     if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[10]) {equipmentUnequip(10, false);}
      }
   }

if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "necklace" )
   { 
   if (oInventory.equiped[10] = 0) {draw_hover_block(xx+equ_axis_crown_x,xx+equ_axis_crown_x+32,yy+equ_axis_crown_y,yy+equ_axis_crown_y+32,c_lime,0.5);}
   equipmentHoldEquip(10,xx+equ_axis_crown_x,xx+equ_axis_crown_x+32,yy+equ_axis_crown_y,yy+equ_axis_crown_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_crown_x-2,yy+equ_axis_crown_y-2);  
}

// Draw trophy1 slot 
if (oPlayer.equ_draw_trophy1)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_trophy1_x,yy+equ_axis_trophy1_y);
if (oInventory.equiped[11]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[11,2]),xx+equ_axis_trophy1_x,yy+equ_axis_trophy1_y); }
else {draw_sprite(sEquipmentIcons,8,xx+equ_axis_trophy1_x,yy+equ_axis_trophy1_y);}
draw_sprite(equiped_image[11,0],equiped_image[11,1],xx+equ_axis_trophy1_x+16,yy+equ_axis_trophy1_y+16)


if (mouse_in(xx+equ_axis_trophy1_x,xx+equ_axis_trophy1_x+32,yy+equ_axis_trophy1_y,yy+equ_axis_trophy1_y+32))
   {
   draw_hover_block(xx+equ_axis_trophy1_x,xx+equ_axis_trophy1_x+32,yy+equ_axis_trophy1_y,yy+equ_axis_trophy1_y+32);
   draw_equ_infobox_id = 11;
   
       if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[11]) {equipmentUnequip(11, false);}
      }
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "card" )
   { 
   if (oInventory.equiped[11] = 0) {draw_hover_block(xx+equ_axis_trophy1_x,xx+equ_axis_trophy1_x+32,yy+equ_axis_trophy1_y,yy+equ_axis_trophy1_y+32,c_lime,0.5);}
   equipmentHoldEquip(11,xx+equ_axis_trophy1_x,xx+equ_axis_trophy1_x+32,yy+equ_axis_trophy1_y,yy+equ_axis_trophy1_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_trophy1_x-2,yy+equ_axis_trophy1_y-2);  
}

// Draw trophy2 slot 
if (oPlayer.equ_draw_trophy2)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_trophy2_x,yy+equ_axis_trophy2_y);
if (oInventory.equiped[12]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[12,2]),xx+equ_axis_trophy2_x,yy+equ_axis_trophy2_y); }
else {draw_sprite(sEquipmentIcons,9,xx+equ_axis_trophy2_x,yy+equ_axis_trophy2_y);}
draw_sprite(equiped_image[12,0],equiped_image[12,1],xx+equ_axis_trophy2_x+16,yy+equ_axis_trophy2_y+16)

if (mouse_in(xx+equ_axis_trophy2_x,xx+equ_axis_trophy2_x+32,yy+equ_axis_trophy2_y,yy+equ_axis_trophy2_y+32))
   {
   draw_hover_block(xx+equ_axis_trophy2_x,xx+equ_axis_trophy2_x+32,yy+equ_axis_trophy2_y,yy+equ_axis_trophy2_y+32);
   draw_equ_infobox_id = 12;
      
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[12]) {equipmentUnequip(12, false);}
      }
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "medal" )
   { 
   if (oInventory.equiped[12] = 0) {draw_hover_block(xx+equ_axis_trophy2_x,xx+equ_axis_trophy2_x+32,yy+equ_axis_trophy2_y,yy+equ_axis_trophy2_y+32,c_lime,0.5);}
   equipmentHoldEquip(12,xx+equ_axis_trophy2_x,xx+equ_axis_trophy2_x+32,yy+equ_axis_trophy2_y,yy+equ_axis_trophy2_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_trophy2_x-2,yy+equ_axis_trophy2_y-2);  
}

// Draw trophy3 slot 
if (oPlayer.equ_draw_trophy2)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_trophy3_x,yy+equ_axis_trophy3_y);
if (oInventory.equiped[13]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[13,2]),xx+equ_axis_trophy3_x,yy+equ_axis_trophy3_y); }
else {draw_sprite(sEquipmentIcons,10,xx+equ_axis_trophy3_x,yy+equ_axis_trophy3_y);}
draw_sprite(equiped_image[13,0],equiped_image[13,1],xx+equ_axis_trophy3_x+16,yy+equ_axis_trophy3_y+16)


if (mouse_in(xx+equ_axis_trophy3_x,xx+equ_axis_trophy3_x+32,yy+equ_axis_trophy3_y,yy+equ_axis_trophy3_y+32))
   {
   draw_hover_block(xx+equ_axis_trophy3_x,xx+equ_axis_trophy3_x+32,yy+equ_axis_trophy3_y,yy+equ_axis_trophy3_y+32);
   draw_equ_infobox_id = 13;   
      
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[13]) {equipmentUnequip(13, false);}
      }
   }
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "trophy" )
   { 
   if (oInventory.equiped[13] = 0) {draw_hover_block(xx+equ_axis_trophy3_x,xx+equ_axis_trophy3_x+32,yy+equ_axis_trophy3_y,yy+equ_axis_trophy3_y+32,c_lime,0.5);}
   equipmentHoldEquip(13,xx+equ_axis_trophy3_x,xx+equ_axis_trophy3_x+32,yy+equ_axis_trophy3_y,yy+equ_axis_trophy3_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_trophy3_x-2,yy+equ_axis_trophy3_y-2);  
}

// Draw special1 slot 
if (oPlayer.equ_draw_special1)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_special1_x,yy+equ_axis_special1_y);
if (oInventory.equiped[14]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[14,2]),xx+equ_axis_special1_x,yy+equ_axis_special1_y); }
else {draw_sprite(sEquipmentIcons,11,xx+equ_axis_special1_x,yy+equ_axis_special1_y);}
draw_sprite(equiped_image[14,0],equiped_image[14,1],xx+equ_axis_special1_x+16,yy+equ_axis_special1_y+16)


if (mouse_in(xx+equ_axis_special1_x,xx+equ_axis_special1_x+32,yy+equ_axis_special1_y,yy+equ_axis_special1_y+32))
   {
   draw_hover_block(xx+equ_axis_special1_x,xx+equ_axis_special1_x+32,yy+equ_axis_special1_y,yy+equ_axis_special1_y+32);
   draw_equ_infobox_id = 14;   
    
    if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[14]) {equipmentUnequip(14, false);}
      }
   }
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "crystallisator" )
   { 
   if (oInventory.equiped[14] = 0) {draw_hover_block(xx+equ_axis_special1_x,xx+equ_axis_special1_x+32,yy+equ_axis_special1_y,yy+equ_axis_special1_y+32,c_lime,0.5);}
   equipmentHoldEquip(14,xx+equ_axis_special1_x,xx+equ_axis_special1_x+32,yy+equ_axis_special1_y,yy+equ_axis_special1_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_special1_x-2,yy+equ_axis_special1_y-2);  
}

// Draw special2 slot 
if (oPlayer.equ_draw_special2)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_special2_x,yy+equ_axis_special2_y);
if (oInventory.equiped[15]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[15,2]),xx+equ_axis_special2_x,yy+equ_axis_special2_y); }
else {draw_sprite(sEquipmentIcons,12,xx+equ_axis_special2_x,yy+equ_axis_special2_y);}
draw_sprite(equiped_image[15,0],equiped_image[15,1],xx+equ_axis_special2_x+16,yy+equ_axis_special2_y+16)


if (mouse_in(xx+equ_axis_special2_x,xx+equ_axis_special2_x+32,yy+equ_axis_special2_y,yy+equ_axis_special2_y+32))
   {
   draw_hover_block(xx+equ_axis_special2_x,xx+equ_axis_special2_x+32,yy+equ_axis_special2_y,yy+equ_axis_special2_y+32);
   draw_equ_infobox_id = 15;
   
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[15]) {equipmentUnequip(15, false);}
      }
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "booster" )
   { 
   if (oInventory.equiped[15] = 0) {draw_hover_block(xx+equ_axis_special2_x,xx+equ_axis_special2_x+32,yy+equ_axis_special2_y,yy+equ_axis_special2_y+32,c_lime,0.5);}
   equipmentHoldEquip(15,xx+equ_axis_special2_x,xx+equ_axis_special2_x+32,yy+equ_axis_special2_y,yy+equ_axis_special2_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_special2_x-2,yy+equ_axis_special2_y-2);  
}

// Draw belt slot 
if (oPlayer.equ_draw_belt)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_belt_x,yy+equ_axis_belt_y);
if (oInventory.equiped[16]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[16,2]),xx+equ_axis_belt_x,yy+equ_axis_belt_y); }
else {draw_sprite(sEquipmentIcons,13,xx+equ_axis_belt_x,yy+equ_axis_belt_y);}
draw_sprite(equiped_image[16,0],equiped_image[16,1],xx+equ_axis_belt_x+16,yy+equ_axis_belt_y+16)

if (mouse_in(xx+equ_axis_belt_x,xx+equ_axis_belt_x+32,yy+equ_axis_belt_y,yy+equ_axis_belt_y+32))
   {
   draw_hover_block(xx+equ_axis_belt_x,xx+equ_axis_belt_x+32,yy+equ_axis_belt_y,yy+equ_axis_belt_y+32);
   draw_equ_infobox_id = 16;
       
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[16]) {equipmentUnequip(16, false);}
      }
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "belt" )
   { 
   if (oInventory.equiped[16] = 0) {draw_hover_block(xx+equ_axis_belt_x,xx+equ_axis_belt_x+32,yy+equ_axis_belt_y,yy+equ_axis_belt_y+32,c_lime,0.5);}
   equipmentHoldEquip(16,xx+equ_axis_belt_x,xx+equ_axis_belt_x+32,yy+equ_axis_belt_y,yy+equ_axis_belt_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_belt_x-2,yy+equ_axis_belt_y-2);  
}

// Draw left boot slot 
if (oPlayer.equ_draw_left_boot)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_left_boot_x,yy+equ_axis_left_boot_y);
if (oInventory.equiped[17]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[17,2]),xx+equ_axis_left_boot_x,yy+equ_axis_left_boot_y); }
else {draw_sprite(sEquipmentIcons,14,xx+equ_axis_left_boot_x,yy+equ_axis_left_boot_y);}
draw_sprite(equiped_image[17,0],equiped_image[17,1],xx+equ_axis_left_boot_x+16,yy+equ_axis_left_boot_y+16)


if (mouse_in(xx+equ_axis_left_boot_x,xx+equ_axis_left_boot_x+32,yy+equ_axis_left_boot_y,yy+equ_axis_left_boot_y+32))
   {
   draw_hover_block(xx+equ_axis_left_boot_x,xx+equ_axis_left_boot_x+32,yy+equ_axis_left_boot_y,yy+equ_axis_left_boot_y+32);
   draw_equ_infobox_id = 17;
            
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[17]) {equipmentUnequip(17, false);}
      }
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "leftBoot" )
   { 
   if (oInventory.equiped[17] = 0) {draw_hover_block(xx+equ_axis_left_boot_x,xx+equ_axis_left_boot_x+32,yy+equ_axis_left_boot_y,yy+equ_axis_left_boot_y+32,c_lime,0.5);}
   equipmentHoldEquip(17,xx+equ_axis_left_boot_x,xx+equ_axis_left_boot_x+32,yy+equ_axis_left_boot_y,yy+equ_axis_left_boot_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_left_boot_x-2,yy+equ_axis_left_boot_y-2);  
}

// Draw right boot slot 
if (oPlayer.equ_draw_left_boot)
{
draw_sprite(sSlotTexture,1,xx+equ_axis_right_boot_x,yy+equ_axis_right_boot_y);
if (oInventory.equiped[18]) { draw_sprite(sRarityEffect,itemRarityEffect(equiped_image[18,2]),xx+equ_axis_right_boot_x,yy+equ_axis_right_boot_y); }
else {draw_sprite(sEquipmentIcons,15,xx+equ_axis_right_boot_x,yy+equ_axis_right_boot_y);}
draw_sprite(equiped_image[18,0],equiped_image[18,1],xx+equ_axis_right_boot_x+16,yy+equ_axis_right_boot_y+16)


if (mouse_in(xx+equ_axis_right_boot_x,xx+equ_axis_right_boot_x+32,yy+equ_axis_right_boot_y,yy+equ_axis_right_boot_y+32))
   {
   draw_hover_block(xx+equ_axis_right_boot_x,xx+equ_axis_right_boot_x+32,yy+equ_axis_right_boot_y,yy+equ_axis_right_boot_y+32);
   draw_equ_infobox_id = 18;
   
   if (mouse_check_button_pressed(mb_left))
      {
       if (oInventory.equiped[18]) {equipmentUnequip(18, false);}
      }
   }
   
if (oInventory.drag = 1 && oInventory.slot[oInventory.h_c,inv_item_equip_slot] = "rightBoot" )
   { 
   if (oInventory.equiped[18] = 0) {draw_hover_block(xx+equ_axis_right_boot_x,xx+equ_axis_right_boot_x+32,yy+equ_axis_right_boot_y,yy+equ_axis_right_boot_y+32,c_lime,0.5);}
   equipmentHoldEquip(18,xx+equ_axis_right_boot_x,xx+equ_axis_right_boot_x+32,yy+equ_axis_right_boot_y,yy+equ_axis_right_boot_y+32);
   }
draw_sprite(sSlotOutline,0,xx+equ_axis_right_boot_x-2,yy+equ_axis_right_boot_y-2);  
}

// Draw equipment infobox
if (draw_equ_infobox)
   {
   if (mouse_check_button_released(mb_right)) {draw_equ_infobox = 0;}
   
   if (draw_equ_infobox_id == 0) {draw_equ_infobox_xx = xx+equ_axis_right_hand_x; draw_equ_infobox_yy = yy+equ_axis_right_hand_y;}
   else if (draw_equ_infobox_id == 1) {draw_equ_infobox_xx = xx+equ_axis_head_x; draw_equ_infobox_yy = yy+equ_axis_head_y;}
   else if (draw_equ_infobox_id == 2) {draw_equ_infobox_xx = xx+equ_axis_body_x; draw_equ_infobox_yy = yy+equ_axis_body_y;}
   else if (draw_equ_infobox_id == 3) {draw_equ_infobox_xx = xx+equ_axis_right_plate_x; draw_equ_infobox_yy = yy+equ_axis_right_plate_y;}
   else if (draw_equ_infobox_id == 4) {draw_equ_infobox_xx = xx+equ_axis_left_plate_x; draw_equ_infobox_yy = yy+equ_axis_left_plate_y;}
   else if (draw_equ_infobox_id == 5) {draw_equ_infobox_xx = xx+equ_axis_left_hand_x; draw_equ_infobox_yy = yy+equ_axis_left_hand_x;}
   else if (draw_equ_infobox_id == 6) {draw_equ_infobox_xx = xx+equ_axis_left_ring1_x; draw_equ_infobox_yy = yy+equ_axis_left_ring1_y;}
   else if (draw_equ_infobox_id == 7) {draw_equ_infobox_xx = xx+equ_axis_left_ring2_x; draw_equ_infobox_yy = yy+equ_axis_left_ring2_y;}
   else if (draw_equ_infobox_id == 8) {draw_equ_infobox_xx = xx+equ_axis_right_ring1_x; draw_equ_infobox_yy = yy+equ_axis_right_ring1_y;}
   else if (draw_equ_infobox_id == 9) {draw_equ_infobox_xx = xx+equ_axis_right_ring2_x; draw_equ_infobox_yy = yy+equ_axis_right_ring2_y;}
   else if (draw_equ_infobox_id == 10) {draw_equ_infobox_xx = xx+equ_axis_crown_x; draw_equ_infobox_yy = yy+equ_axis_crown_y;}
   else if (draw_equ_infobox_id == 11) {draw_equ_infobox_xx = xx+equ_axis_trophy1_x; draw_equ_infobox_yy = yy+equ_axis_trophy1_y;}
   else if (draw_equ_infobox_id == 12) {draw_equ_infobox_xx = xx+equ_axis_trophy2_x; draw_equ_infobox_yy = yy+equ_axis_trophy2_y;}
   else if (draw_equ_infobox_id == 13) {draw_equ_infobox_xx = xx+equ_axis_trophy3_x; draw_equ_infobox_yy = yy+equ_axis_trophy3_y;}
   else if (draw_equ_infobox_id == 14) {draw_equ_infobox_xx = xx+equ_axis_special1_x; draw_equ_infobox_yy = yy+equ_axis_special1_y;}
   else if (draw_equ_infobox_id == 15) {draw_equ_infobox_xx = xx+equ_axis_special2_x; draw_equ_infobox_yy = yy+equ_axis_special2_y;}
   else if (draw_equ_infobox_id == 16) {draw_equ_infobox_xx = xx+equ_axis_belt_x; draw_equ_infobox_yy = yy+equ_axis_belt_y;}
   else if (draw_equ_infobox_id == 17) {draw_equ_infobox_xx = xx+equ_axis_left_boot_x; draw_equ_infobox_yy = yy+equ_axis_left_boot_y;}
   else if (draw_equ_infobox_id == 18) {draw_equ_infobox_xx = xx+equ_axis_right_boot_x; draw_equ_infobox_yy = yy+equ_axis_right_boot_y;}


  
   }
yy = yy - 36;

#define equipmentDrawInfobox
/// equipmentDrawInfobox(x, y, id, yoffset, xoffset)

var width,height,idd,xx,yy;
width   = 256;
height  = 16;
xx      = argument0;
yy      = argument1;
idd     = argument2;
yoffset = 16;
xoffset = 16;

if (!oHUD.draw_equipment) {alpha = 0;}

if (oInventory.draw_equipment)
{
if (idd != -1 && oInventory.equiped[oInventory.draw_equ_infobox_id]) 
{
fnt(fntPixel);
h  = oInventory.equiped_stats[oInventory.draw_equ_infobox_id,inv_item_info_head];
hh = string_height(h);
fnt(fntPixelSmall);
q = oInventory.equiped_stats[oInventory.draw_equ_infobox_id,inv_item_info_text];
qq = string_height(q);
fnt(fntPixelTiny);
width = 288;
text = "";
text = equipmentDrawAbilities(idd,width,yoffset,xx,yy,xoffset);
height += (string_height(text) + hh + qq);
}

height = max(196, height - 16);
fnt(fntPixel);
 
clr(c_black, alpha);
if (height <= 196) {draw_sprite(sInfoboxTexture,0,x,oInventory.used_y+32);}
else {draw_sprite_stretched(sInfoboxTexture,0,oInventory.x,oInventory.used_y+32,288,height);}
fnt(fntPixel);

if (idd != -1 && oInventory.draw_equipment) 
    {
    if (oInventory.equiped[oInventory.draw_equ_infobox_id]) 
        {
         clr(oInventory.equiped_stats[oInventory.draw_equ_infobox_id, inv_item_info_color], alpha);
         alg("center");

         draw_text(x+128,oInventory.used_y+44,h);
         alg();
         
         if (oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_upgradeSloty] > 0) {equipmentDrawPearls(oInventory.draw_equ_infobox_id);}

         if (oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_cena] > 0)
            {
             fnt(fntPixelTiny);
             alg();
             priceStr = (string(oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_cena]) + "G");
             draw_text(x + (283 - string_width(priceStr)), oInventory.used_y + (max(196, height) + 5), priceStr);      
            }
            
         fnt(fntPixelExtraTiny);
         alg();
         if (oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_dataSocket1] == 1 && oInventory.equiped_stats[oInventory.draw_equ_infobox_id, inv_item_equip_slot] == "shield") {typeStr = "[Šíp]";}
         else
         {         
         if (oInventory.equiped_stats[oInventory.draw_equ_infobox_id, inv_item_equip_slot] != "") {typeStr = "[" + inventoryDrawEquipSlotToString(oInventory.equiped_stats[oInventory.draw_equ_infobox_id, inv_item_equip_slot]) + ",";}
         else if (oInventory.equiped_stats[oInventory.draw_equ_infobox_id, inv_item_materialType] != materialEnum.materialNone && oInventory.equiped_stats[oInventory.draw_equ_infobox_id, inv_item_materialType] != -1) {if (oInventory.equiped_stats[oInventory.draw_equ_infobox_id, inv_item_materialType] == materialEnum.materialFood) {typeStr = "[Jídlo]";} else {typeStr = "[Materiál]";}}
         else if (oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_canBeFastEquiped]) {typeStr = "[Spotřební]";}
         else {typeStr = "";}
         }
         clr(c_black, alpha);
         draw_text(x + 4, oInventory.used_y + (max(196, height) + 9), typeStr); 
         fnt(); 
         
         // Draw durability
         if (oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_durability] > 0)
          {
           alg();
           fnt(fntPixelExtraTiny);
           color = c_black;
           if (oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_durability] == 1) {color = c_red;}
           
           clr(color, alpha);
           draw_text(x + 8 + string_width(typeStr), oInventory.used_y + (max(196, height) + 9), "" + string(oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_durability]) + " / " + string(oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_max_durability]));
           clr(c_black, alpha);
           draw_text(x + 8 + string_width(typeStr) + string_width("" + string(oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_durability]) + " / " + string(oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_max_durability])), oInventory.used_y + (max(196, height) + 9), "]"); 
          
           // Draw durability state
           l = ((oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_durability] / oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_max_durability]) * 100);
           cd = c_red;           
           td = "";
           if (oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_durability] == 1) {td = " - Zničeno!";}
           else if (l < 25) {td = " - Na pokraji zničení!";}
           else if (l < 50) {td = " - Lehce poškozeno"; cd = c_orange;}
           clr(cd, alpha);
           draw_text(x + string_width("]") + 8 + string_width(typeStr) + string_width("" + string(oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_durability]) + " / " + string(oInventory.equiped_vlastnost[oInventory.draw_equ_infobox_id, vlastnost_max_durability])), oInventory.used_y + (max(196, height) + 9), td);
           clr(c_black, alpha);

          }

        
clr(c_black, alpha);
fnt(fntPixelSmall);
draw_text(x + 4, oInventory.used_y + 32 + hh, q);
fnt(fntPixelTiny);
draw_text_colored(x + 4, oInventory.used_y + qq + hh, text);

        }        
    }
}


#define equipmentDrawAbilities
/// equipmentDrawAbilities(id, width, yoffset, xx, yy, xoffset)

var t_text,idd,width,yoffset,xx,yy;
t_text   = "#";
idd      = argument0;
width    = argument1;
yoffset  = argument2;
xx       = argument3;
yy       = argument4;
xoffset  = argument5;

for(a = 0; a < celkem_vlastnosti; a++)
      {  
       if (oInventory.equiped_vlastnost[idd,a] != 0 || oInventory.equiped_vlastnost_static[idd,a] != 0)
          {
            switch(a)
                    {
                     case(vlastnost_poskozeni):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Poškození: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_stackSezehnuti):
                         {    
                           t_text += equipmentDrawStat(idd, a, "#Šance na sežehnutí: ", "%");                      
                           break;                                                                   
                         }    
                    case(vlastnost_bonusove_poskozeni_vuci_zviratum):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Poškození vůči zvířatům: ", "%"); 
                           break;                                                                   
                         }                                              
                     case(vlastnost_vampStamina):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Vysátá výdrž: ", "")
                           break;                                                                   
                         }                     
                     case(vlastnost_max_zivot):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Život: ", "")
                           break;                                                                   
                         }
                     case(vlastnost_stamina_cost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Stamina za úder: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_max_mana):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Mana: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_sila):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Síla: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_obratnost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Obratnost: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_kovarstvi):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Kovářství: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_tezarstvi):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Těžařství: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_odolnost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Odolnost: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_vytrvalost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Vytrvalost: ", "")
                           break;                                                                   
                         }
                     case(vlastnost_presnost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Přesnost: ", "")
                           break;                                                                   
                         }
                     case(vlastnost_rychlost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Rychlost: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_zrucnost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Zručnost: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_svadeni):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Svádění: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_zastrasovani):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Zastrašování: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_dustojnost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Důstojnost: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_vyrecnost):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Výřečnost: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_elegance):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Elegance: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_cest):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Čest: ", "")
                           break;                                                                   
                         }
                         
                    case(vlastnost_kapsarstvi):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Kapsářství: ", "")
                           break;                                                                   
                         }
                     case(vlastnost_paceni_zanmku):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Háčkování zámků: ", "")
                           break;                                                                   
                         }
                     case(vlastnost_vule):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Vůle: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_inteligence):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Inteligence: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_ritualy):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Rituály: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_tradicni_magie):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Tradiční magie: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_astralni_videni):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Astrální vidění: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_mece):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Meče: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_dyky):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Dýky: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_luky):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Lukostřelba: ", "")
                           break;                                                                   
                         }
                     case(vlastnost_kopi):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Kopí: ", "")
                           break;                                                                   
                         }
                     case(vlastnost_jednorucni):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Jednoruční zbraně: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_dvojrucni):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Dvojruční zbraně: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_stity):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Štíty: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vse):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Elementární ochrana: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_zeme):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Ochrana vůči zemi: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_ohen):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Ochrana vůči ohni: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_voda):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Ochrana vůči vodě: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_temnota):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Ochrana vůči temnotě: ", "")
                           break;                                                                   
                         }
                         
                     case(vlastnost_rezistence_svetlo):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Ochrana vůči světlu: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_rezistence_vitr):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Ochrana vůči vodě: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_zivot):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Obnoví zdraví: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_mana):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Obnoví manu: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_stamina):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Obnoví výdrž: ", "")
                           break;                                                                   
                         }
                         
                    case(vlastnost_max_stamina):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Výdrž: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_sance):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Šance na kritický úder: ", "%")
                           break;                                                                   
                         }
                    case(vlastnost_kriticka_nasobic):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Násobič kritického úderu: ", "%")
                           break;                                                                   
                         }
                    case(vlastnost_stit):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Obnoví štít: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_max_stit):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Štít: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Zvýší rychlost obnovy výdrže: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_tick_stamina_add):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Zvýší množství obnovené výdrže: ", "")
                           break;                                                                   
                         }
                    case(vlastnost_bonusoveZkusenosti):
                         {
                           t_text += equipmentDrawStat(idd, a, "#Bonusové zkušenosti: ", "%")
                           break;                                                                   
                         }
                    }               
          }      
      }

return t_text;

#define equipmentDrawPearls
/// equipmentDrawPearls(slot)

var s, i, ox, j;
s = 0;

if (argument_count > 0) {s = argument[0];}

i  = oInventory.equiped_vlastnost[s, vlastnost_upgradeSloty];
ox = (x + 288 - (i * 14));

clr(c_black, alpha);
for (j = 0; j < i; j++)
    {     
     if (oInventory.equiped_vlastnost[s, vlastnost_upgradeSprite1 + j] != 0)
        {
         draw_sprite_stretched(sTestItem, oInventory.equiped_vlastnost[s, vlastnost_upgradeSprite1 + j], ox + (j * 14) - 8, oInventory.used_y + 44 - 9, 20, 20);
        } 
     else
        {
         clr(c_black, 0.3);
         draw_circle(ox + (j * 14), oInventory.used_y + 44, 6, false);
         clr();
         draw_circle(ox + (j * 14), oInventory.used_y + 44, 6, true);
        }    
    }
#define equipmentDrawStat
/// equipmentDrawStat(slot, index, text, [suffix])

var T, i, t, s, p;
T = "";
i = vlastnost_vampStamina;
t = "";
s = 0;
p = "";

if (argument_count > 0) {s = argument[0];}
if (argument_count > 1) {i = argument[1];}
if (argument_count > 2) {t = argument[2];}
if (argument_count > 3) {p = argument[3];}

T += t;
if (oInventory.equiped_vlastnost[s, i] != 0) {T += string(oInventory.equiped_vlastnost[s, i]); if (oInventory.equiped_vlastnost_static[s, i] != 0) {T += " ";}}
if (oInventory.equiped_vlastnost_static[s, i] != 0) {T += scrColorText("+" + string(oInventory.equiped_vlastnost_static[s, i]), c_lime) + "";}                            
T += p;      

return T;