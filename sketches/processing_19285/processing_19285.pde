
size (640, 480);
smooth ();
background (255);


//NAVY BG
noStroke ();
fill (#27326C);     
ellipse (557, 80,
        1378.38, 810.61);
        
        
//WHITE PANEL (LEFT)
stroke (0);
fill (255);
// clockwise from bottom vertex
quad (-1, 410,
      -1, 276,
      154, -1,
      230, -1); 


//WHITE PANEL (RIGHT)
// clockwise from bottom right
quad (290, 205, 
      235, 150, 
      320, -1, 
      403, -1);
//bottom white rectangle
//clockwise from bottom right
quad (298, 225,
      198, 166,
      215, 136, 
      315, 194);
//overlapping white rectangle
//clockwise from bottom right
quad (318, 173,
      268, 144,
      282, 118,
      332.5, 148);
//lines inside ^ rectangle 
//left to right
line (283.5, 153,
      298, 127);
line (290, 157,
      305, 131);
line (311.75, 135.5,
      302.5, 152);
line (302.5, 152,
      323.5, 164);
      
      
//COLORED BLOCKS
noStroke ();

//BIG BOTTOM BLOCK, right side
//clockwise from top right
fill (#26465D); //dark steel
quad (272.25, -1,
      135.5, 244,
      135.5, 142,
      215, -1);
//top side
//clockwise from top right
fill (#6E8DA9); //light steel
quad (215, -1,
      135.5, 142,
      66, 105,
      124.5, -1);
///front side
//clockwise from top right
fill (0);
quad (136, 142,
      136, 244,
      66, 207,
      66, 105);
      
//BLK.WHT.RED BLOCK
//right side
fill (0);
quad (289, -11,
      289, 20,
      259, 77.5,
      259, 46.5);
//front side
fill (255);
quad (259, 46.5,
      259, 77.5,
      235.5, 65.5,
      235.5, 34.5);
//top side
fill (#C11718); //red
quad (289, -11,
      259, 46.5,
      235.5, 34.5,
      261, -11);
      
//STL.RED.BLK BLOCK
//right
fill (#4E6F8A); //med steel
quad (133, 70,
      133, 94,
      121.5, 115,
      121.5, 92);
//front
fill (#C11718); //red
quad (121.5, 92,
      121.5, 115,
      62, 84,
      62, 61);
//top
fill (0);
quad (133, 70,
      121.5, 92,
      62, 61,
      74, 39);

//STEEL BLOCK
//right
fill (#26465D); //dark steel
quad (113, 42,
      113, 60,
      102.5, 78.5,
      102.5, 64);     
//front
fill (#4E6F8A); //med steel
quad (102.5, 64,
      102.5, 78.5,
      65, 59,
      65, 45);      
//top
fill (#6E8DA9); //light steel
quad (113, 42,
      102.5, 64,
      65, 45,
      77, 23.5);
      
//FlAT RED/WHITE PLANE
fill (#C11718); //red
quad (36.67, 155,
      48.33, 136,
      152.33, 195,
      140, 215);
fill (255);
quad (36.67, 155,
      36.67, 161, 
      140, 220,
      140, 215);

//TOP BLOCK
//right
fill (255);
quad (88.5, 17,
      88.5, 29,
      80.5, 44.5,
      80.5, 31.5);
//front
fill (#4E6F8A); //med steel
quad (80.5, 31.5,
      80.5, 44.5,
      67.5, 38.5,
      67.5, 25); 
//top
fill (0);
quad (88.5, 17,
      80.5, 31.5,
      67.5, 25,
      75.5, 11);
      
      
// BOTTOM RED SHAPE (broken into quads) - left to right
fill (#C11718); //red
quad (190, 475,
      190, 486, 
      265, 486,
      265, 480);
quad (265, 468,
      265, 486,
      330, 486,
      331, 472);
quad (330, 443,
      328, 486,
      375, 486,
      377, 446);
quad (350, 432,
      349, 450,
      365, 450,
      366, 433);
quad (377, 434,
      374, 486,
      443, 486,
      443, 437);
quad (443, 458,
      443, 486,
      478, 486,
      478, 460);
quad (478, 438,
      477, 485,
      532, 486,
      535, 440);

