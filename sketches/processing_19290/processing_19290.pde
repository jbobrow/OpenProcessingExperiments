
//Body
size (640, 480);
background (21, 41, 110);
smooth ();

//Blue Area
fill (67, 92, 129);
noStroke ();
  //Blue Area Pt. 1
quad (514, 419, 329, 416, 0, 322, 0, 134);
  //Blue Area Pt. 2
quad (315, 412, 153, 414, 0, 331, 0, 123);


//White Squares
fill (255);
stroke (1);
  //White Stripe
quad (640, 288, 640, 444, 345, 285, 400, 156);
  //White Rec Top
 quad (323, 20, 312, 40, 244, 1, 270, -10);
  //White Square Hidden
quad (100, 10, 20, 170, -30, 120, 11, -10);
  //White Square on Blue
quad (193, 320, 178, 343, 156, 330, 168, 310);
  // White Rec Under Large Square
quad (253, 274, 217, 340, 102, 273, 140, 200);
  //White Small Rec
quad (300, 316, 280, 345, 170, 278, 185, 252);
  // White Thin Rec 
quad (280, 290, 273, 305, 155, 235, 161, 223);
  //White Large Square
quad (440, 130, 325, 322, 130, 205, 235, 13);
  //White Left Left Rec
quad (130, 0, 35, 181, 20, 150, 100, 0);
  //White Left Rec
quad (250, -1, 120, 237, 35, 181, 130, -1);
  // White Right Rec
quad (250, 65, 145, 253, 119, 238, 222, 50);
  //White Under Black left
quad (148, 300, 135, 322, -10, 240,  0, 210);
  


// White Area
fill (255);
noStroke();
quad (153, 414, 120, 500, -30, 424, 0, 331);

//Black Under Blue
fill (0);
noStroke ();
  //Black Rec under Light Blue Tri
quad (114, 250, 103, 273, 0, 218, 0, 150);
// Far Black Neighbor
quad (150, 114, 95, 210, 10, 215, 128, 114);

//Blue Squares
fill (67, 92, 129);
noStroke ();
  //Top Blue
quad (515, 329, 436, 331, 301, 252, 370, 250);
  // Left Blue
quad (128, 108, 70, 206, 45, 210, 105, 108);
  //Left Blue Neighbor
quad (135, 114, 75, 215, 70, 207, 130, 110);
  //Left Blue Neighbor Top
quad (150, 115, 135, 114,  130, 110, 145, 110);


//Deep Teal
fill (34, 69, 82);
noStroke ();
  //Edge
quad (501, 459, 590, 500, 380, 480, 348, 455);
 

//Red Area
fill (195, 0, 14);
noStroke ();
  //Top Red
quad (515, 329, 482, 399, 403, 400, 436, 331);
  //Left Red
quad (128, 108, 107, 108, 46, 67, 70, 67);
  //Red Edge
quad ( 315, 412, 292, 480, 120, 480, 153, 414);
  //Far Red
triangle (594, 480, 544, 454, 524, 480);
  //Top Block
quad (466, 310, 460, 319, 434, 307, 438, 297 );



//Black Area
fill (0);
noStroke ();
  // Top Black
quad (436, 331, 403, 400, 265, 320, 301, 252);
  //Left Black
quad (107, 108, 49, 205, -10, 165, 46, 67);
  // Black edge of Blue
quad (514, 419, 501, 459, 316, 457, 329, 416);
 //Black Mid Edge
quad (234, 403, 224, 419, 142, 377, 152, 361);
  //Far Black
quad (670, 490, 594, 480, 544, 454, 595, 448);
  //Bottom Left Black
quad (103, 455, 39, 457, -20, 433, 58, 430);
  //Black Left Side
triangle (26, 315, 0, 360, 0, 311);
  //Black Left Side Above
triangle (18, 260, 0, 293, 0, 260);
   // Thin black Neighbor vert
quad (132, 110, 74, 207, 70, 206, 128, 108);
  // Thin black Neighbor top
quad (145, 110, 132, 110, 128, 108, 140, 108);
  //Top Block
quad (468, 297, 490, 311, 466, 310, 438, 297);


//Teal Under Black
fill (34, 69, 82);
noStroke ();
  //Red Block
quad (344, 363, 341, 378, 300, 362, 310, 342 );

//Black Over Teal
fill (0);
noStroke ();
  //Tiny Block
quad (293, 348, 323, 363, 310, 365, 284, 350);
  //Tiny Black on Edge
quad (0, 260, 0, 240, 19, 250, 17, 255);

  

//Light Blue Area
fill (158, 166, 175);
noStroke ();
  //Light Blue Edge of Blue
quad (329, 416, 309, 480, 292, 480, 315, 411);
  //Light Blue Bottom Edge
quad (305, 436, 390, 480, 359, 480, 271, 436);
  //Light Blue Left
 triangle (136, 210, 113, 250, 25, 202);
  // Tiny Block
 quad (312, 364, 310, 375, 280, 360, 284, 350);
  //left Black Top
triangle(26, 315,  0, 311, 0, 300);
  

//Blue Squares 2nd Layer
fill (67, 92, 129);
noStroke ();
  //Bottom Edge
triangle (359, 480, 272, 436, 242, 480);
  //Bottom Left
quad (39, 456, 26, 480, -10, 480, -20, 433);
  //Black Edge
quad (237, 405, 227, 420, 224, 419, 234, 403);
  //Small Left Block
quad (34, 437, 27, 453, 18, 452, 25, 434);
  //Small Left Block Top
quad (34, 437, 25, 434, 20, 431, 23, 430);

//Red Area 2nd Layer
fill (195, 0, 14);
noStroke ();
  //Tiny Block
quad (363, 362, 344, 363, 311, 342, 330, 340);

//Deep Teal 2nd Layer
fill (34, 69, 82);
noStroke ();
 //Bottom Left
quad (103, 454, 88, 480, 26, 480, 39, 456);
  //Red Block
quad (490, 310, 486, 320, 460, 319, 465, 310 );
  //Black LeftAbove Top
triangle (18, 260, 0, 260, 0, 245);


//White 2nd Layer
fill (255);
noStroke ();
  //Red Block
quad (363, 362, 360, 377, 341, 378, 344, 363 );
  //Tiny Block
quad ( 323, 363, 320, 375, 310, 375, 313, 364);
  //Tiny Block on Left
quad ( 26, 434, 19, 452, 13, 449, 20, 431 );
 
//White Square Details
fill (255);
stroke (1);
quad (280, 196, 397, 258, 409, 236, 291, 175);

//Line Details
stroke (1);
line (203, 153, 280, 196);
line (280, 196, 255, 243);
line (256, 243, 295, 266);
line (295, 266, 321, 218);
line (403, 250, 430, 265);
line (430, 265, 423, 278);
line (161, 224, 136, 209);
line (236, 284, 220, 309);

line (195, 165, 220, 179);
line (220, 179, 208, 201);
line (208, 201, 182, 186);

line (224, 276, 212, 295);
line (212, 295, 187, 280);
line (187, 280, 198, 262);


//White Square Details 2.0
fill (255);
stroke (1);
  //Square 
quad (286, 242, 274, 265, 262, 258, 275, 236);
  


