
size (640,480);
noStroke ();
smooth ();

//colors
  color white = color (255);
  color black = color (0);
  color flagWhite = color (255);
  color grey = color (162,172,161);
  color lightGrey = color (170,180,170);
  
  color yellow = color (250,190,55);
  color orange = color (230,125,60);
  
  color babyBlue = color (80,185,220);
  color darkBlue = color (40,85,160);
  color lightBlue = color (70,120,180);
  color uglyBlue = color (90,85,130);
  color flagBlue = color (40,75,150);
  color fadedBlue = color (100,180,210);
  
  color darkBabyBlue = color (0,165,180);                            
  color uglyGreen = color (50,80,60);
  color darkGreen = color (42,80,55);
  color shitGreen = color (100,100,65);
  color lightGreen = color (5,130,90);
  
  color pink = color (220,65,70);
  color flagRed = color (200,50,50);
  color lightPink = color (206,155,151);
  color maroon = color (170,45,45);
  color brown = color (90,50,30);
  color hadairo = color (200,150,100);
    

//below_white_quads
  //uglyGreen_quad
    fill (lightGreen);
    quad (367,366, 491,363, 491,382, 367,385);
  //back_big_yellow
    noFill ();
    stroke (yellow);
    strokeWeight (65);
    strokeCap (SQUARE);
    arc (-60,625, 1260,590, radians (270),radians (310));
    arc (-20,625, 1260,590, radians (316),TWO_PI);
    noStroke ();
  //transBlue_rectangle
    fill (fadedBlue);
    quad (0,269, 22,273, 22,302, 0,297);
  //uglyBlue_quad
    fill (uglyBlue);
    quad (116,292, 193,309, 193,343, 116,324);
  //pink_rectangle
    fill (lightPink);
    quad (570,384, 641,400, 641,446, 570,428);
  //rectangle_babyblue
    fill (babyBlue);
    rect (0,195, 424,10);
  //maroon_halfcircle
    fill(maroon);
    arc (464,147, 48,74, radians (-15), radians (165));
  //grey_arc_topleft
    stroke (lightGrey);
    noFill ();
    strokeWeight (45);
    arc (0,0, 304,150, 0,HALF_PI); 
    arc (-85,-56, 304,150, 0,HALF_PI); 
    noStroke ();  
  //grey_box
    fill (grey);
    rect (340,0, 26,47);
    //rectangles_uglyBlue
    fill (uglyBlue);
    rect (6,112, 70,10); 
    rect (176,112, 70,10); 
  //rectangles_green 
    fill (uglyGreen);
    rect (90,110, 70,10); 
    rect (255,110, 80,13); 
  //black_lines
    stroke (black);
    strokeWeight (2);
    noFill ();
      //topLeft_diagonals
      line (0,148, 29,118);
      line (79,146, 102,118);
      line (171,146, 201,117);
      line (171,146, 175,170);      
      line (252,146, 278,113);
      line (311,145, 339,113);
      line (348,151, 450,107);
      line (419,144, 520,104);
      line (502,135, 537,114);
      //topLeft_horizontal
      line (72,180, 420,180);
      line (426,0, 425,26);
      line (467,0, 466,24);
      line (0,98, 257,90);
      line (43,83, 43,97);
      line (114,82, 114,94);
      
      line (0,22, 406,-1);
      line (0,60, 640,31);
      
      line (104,175, 127,154);
      line (55,92, 418,80);
      line (418,80, 533,62);
      line (330,32, 330,71);
      line (410,28, 403,74);  
      line (-1,441, 120,425);
      line (-1,464, 9,462);
        line (9,462, 21,449);
      noStroke ();
      
  //circle_orange 
    fill (orange);
      ellipse (60,35, 68,68);
      ellipse (145,35, 68,68);
    stroke (yellow);
      strokeWeight (3);
      strokeCap (SQUARE);
      line (150,0, 150,8);
      line (156,0, 156,43);
    noStroke ();
      fill (darkBlue);
      rect (64,50, 110,6);
    fill (lightBlue);
    quad (28,9, 65,9, 59,18, 35,18);   
 //blue_cross_triangle&quad
    fill (darkBlue);
      triangle (162,18, 613,48, 162,34);
      quad (310,5, 400,17, 292,60, 240,60);
  //flagBlue_line_middle
      stroke (flagBlue);
      strokeWeight (5);
      strokeCap (SQUARE);
      line (300,38, 460,-3);
  //lines02
    stroke (black);
    strokeWeight (2);
      line (323,0, 323,26);
        line (323,26, 366,27);
        line (366,27, 366,0);
      line (377,0, 377,25);
        line (377,25, 415,24);
        line (415,24,415,0);
      line (286,0, 286,34);
      line (259,0, 258,75);
      line (242,0, 240,76); 
      line (248,34, 489,24);
    noStroke ();

    //multicolored_quads
      fill (lightBlue);
        quad (355,142, 378,131, 378,145, 353,151);
      fill (yellow);
        quad (353,151, 378,145, 378,158, 353,159);
      fill (flagRed);
        quad (353,159, 378,158, 378,167, 353,169);
        quad (318,153, 338,150, 338,173, 318,173);
      noFill ();


    //flag_red&white
      fill (white);
      quad (460,80, 500,50, 500,105, 460,125);
      fill (flagRed);
      quad (460,125, 500,105, 500,137, 460,150);
    //flag_greenwhitered
      fill (darkGreen);
      quad (530,12, 550,-3, 550,120, 530,125);
      fill (white);
      quad (550,0, 570,0, 570,115, 550,120);
      fill (flagRed);
      quad (570,0, 590,0, 590,110, 570,115);
    //flag_Canadian
      fill (maroon);
      rect (490,87, 14,30);
      rect (534,87, 14,30);
    //arc_square
      noFill ();
      stroke (black);
      strokeWeight (2);
      line (45,320, 45,337);
      line (188,286, 188,302);
      arc (21,248, 400,144, radians(34),radians (83));
      arc (21,265, 400,144, radians(34),radians (83));
      arc (0,540, 1340,370, radians (280),TWO_PI);
      strokeWeight (3);
        line (-1,409, 424,421);
        arc (98,191, 160,81, radians (285),radians (355));
        arc (233,115, 86,58, radians (20),radians (75));
        arc (256,137, 28, 20, radians (45),radians (140));
      strokeWeight (3);
        line (17,-1, -1,26);
      stroke (brown);
        arc (-120,460, 1870,284, PI,TWO_PI);
        arc (-160,490, 1870,284, PI,TWO_PI);
        arc (-160,540, 1870,284, PI,TWO_PI);
      stroke (darkBlue);
      strokeWeight (2);
        arc (170,490, 190,80, PI,radians (245));
      stroke (uglyGreen);
        line (77,252, 95,240);
        line (77,252, 95,262);
    noStroke ();

//white_rectangles
    fill (white);
    quad (37,205, 67,147, 99,147, 57,205);
    quad (174,211,  244,144, 255,144, 189,211);
    quad (206,256, 311,190, 339,190, 224,256);
    quad (43,291, 110,230, 138,230, 63,291);
    quad (406,114, 420,110, 420,161, 406,165);
    quad (377,216, 482,147, 511,147, 398,216);
    triangle (0,354, 29,356, 0,381);
    quad (81,358, 195,296, 219,296, 101,358);
    quad (219,365, 368,316, 394,316, 237,370);
    quad (303,401, 505,350, 533,356, 327,408);
    quad (390,270, 529,214, 561,220, 412,277);
    quad (469,410, 591,382, 605,390, 480,414);
    quad (580,230, 640,195, 640,211, 603,230);
    
    
  //flags_01
      fill (flagBlue); triangle (293,75, 311.3,71, 303,110);
      fill (flagRed); triangle (311.3,71, 329.6,67, 321.3,106); triangle (329.6,67, 348,63, 339.6,102); triangle (348,63, 366.3,59, 358,98);
      fill (flagBlue); triangle (366.3,59, 384.6,55, 376.3,94);
      fill (flagRed); triangle (384.6,55, 403,51, 394.6,90); triangle (403,51, 421.3,47, 413,86);
      fill (flagWhite);triangle (421.3,47, 439.6,43, 431.3,82);
      fill (flagRed); triangle (439.6,43, 458,39, 449.6,78); triangle (458,39, 476.3,35, 468,74); triangle (476.3,35, 494.6,31, 486.3,70);
      fill (flagBlue); triangle (494.6,31, 513,27, 504.6,66); 
  //flags_02
      fill (flagRed); triangle (292,135, 310.3,131, 302,170);
      fill (flagWhite); triangle (310.3,131, 328.6,127, 320.3,166); triangle (328.6,127, 347,123, 338.6,162); triangle (347,123, 365.3,119, 357,158);
      fill (flagBlue); triangle (365.3,119, 383.6,115, 375.3,154);
      fill (flagRed); triangle (383.6,115, 402,111, 393.6,150); triangle (402,111, 420.3,107, 412,146);
      fill (flagBlue); triangle (420.3,107, 438.6,103, 430.3,142);
    
//above_white_quads
  //blue_triangle
    fill (lightBlue);
      triangle (196,347, 361,352, 196,361);
  //rectangles_darkBlue
    fill (darkBlue); 
      rect (40,240, 5,42); 
      rect (20,260, 60,5); 
      quad (222,145, 245,146, 245,196, 222,196);
  //ellipse_darkBabyBlue
    fill (darkBabyBlue);
    ellipse (31,173, 58,29);
  //small_stuff
    fill (grey);
    quad (490,0, 510,0, 510,28, 490,32);
    fill (yellow);
    quad (448,27, 491,27, 491,37, 433,37);


//orange_right_diamond
  //box_orange
    fill (orange);
    quad (515,295, 595,184, 679,309, 603,421);
  //smaller
    //green
      fill (lightGreen);
      triangle (487,276, 539,284, 487,285);
    //maroon
      fill (maroon);
      quad (487,255, 506,255, 543,284, 487,265);
    //yellow
      fill (yellow);
      triangle (527,255, 546,257, 546,283);
  //circle_darkBlue
    fill (darkBlue);
    ellipse (593,287, 16,16);
    ellipse (585,408, 16,16);
  //red_triangle
    fill (maroon);
    triangle (330,187, 360,187, 345,200);
  //darkBlue_line
    stroke (darkBlue);
    strokeWeight (2);
    line (595,262, 640,250);
  //circles_tan
    fill (hadairo);
    stroke (hadairo);
    line (628,207, 640,206);
    line (630,225, 640,223);
    line (630,240, 640,239);
    line (627,255, 640,253);
    line (625,270, 640,268);
    line (621,287, 640,283);
    ellipse (628,209, 11,11);
    ellipse (631,225, 11,11);
    ellipse (628,241, 11,11);
    ellipse (626,256, 11,11);
    ellipse (624,272, 11,11);
    ellipse (620,287, 11,11);
    ellipse (644,239, 11,11);
    ellipse (643,253, 11,11);
    ellipse (640,269, 11,11);
    ellipse (637,284, 11,11);
    noStroke ();

 
//above_everything 
  //ellipses_transparent
    noFill ();
    strokeWeight (2);
    stroke (black);
    ellipse (38,347, 47,26);
    ellipse (146,350, 50,31);
    ellipse (268,348, 43,31);
    ellipse (398,350, 36,32);
    ellipse (75,136, 48,31);
    ellipse (193,136, 48,23); 
    noStroke ();
  //red_odd_shape
    fill (flagRed);
    beginShape ();
      vertex (463,378); vertex (509,378); vertex (522,388);
      vertex (514,397); vertex (463,397);
    endShape ();
    beginShape ();
      vertex (514,378); vertex (530,378); vertex (530,397);
      vertex (519,397); vertex (527,388);
    endShape ();
  //lines
    fill (black);
    stroke (black);
    //bottomLeft_quads
      line (-1,282, 5,280);
        line (5,280, 7,322);
        line (7,322, -1,323);
      line (-1,343, 30,343);
        line (30,343, 8,357);
        line (8,357, -1,357);
    //topLeft_horizontal
      line (0,167, 253,167);
    //left_vertical
      line (51,184, 51,224);
      line (52,206, 52,235);
      line (117,184, 117,224);
      line (165,180, 165,235);
      line (185,184, 185,223);
    //bottom_horizontal
      rect (0,248, 402,2);
      line (402,248, 402,267);
      rect (0,282, 479,2);
      strokeWeight (2);
      line (479,283, 472,356);
      line (472,356, 458,349);
      line (400,282, 398,334);
      line (396,366, 391,391);
      line (266,282, 266,332);
      line (266,363, 266,383);
      line (147,282, 147,334);
      line (147,366, 147,383);
      line (35,284, 37,333);
      line (37,360, 37,383);
      noStroke ();
  //rectanges_lightBlue
    fill (lightBlue);
    rect (428,191, 58,3);
    rect (428,198, 58,3);
    noFill ();
  //green_boxes
    fill (lightGreen);
    rect (170,304, 30,28);
    rect (140,318, 52,15);
  //triangle_yellow
    fill (yellow);
      triangle (41,52, 71,52, 71,82);
      //white_circles
        fill (white);
        ellipse (40,55, 4,4);
        ellipse (43,59, 4,4);
        ellipse (47,63, 4,4);
        ellipse (51,66, 4,4);
        ellipse (54,70, 4,4);
        ellipse (58,74, 4,4);
        ellipse (62,77, 4,4);
        arc (36,52, 4,4, 0,PI);  
        arc (65,82, 4,4, PI,TWO_PI);        
  //red_strokes
    strokeWeight (2);
    noFill ();
    stroke (maroon);
    arc (98,106, 576,340, radians (270),radians (380));
    arc (61,7, 578,502, radians (270),radians (412));
    arc (358,485, 356,206, radians (299),TWO_PI);
    strokeWeight (8);
    strokeCap (ROUND);
    arc (47,0, 108,88, 0,HALF_PI);
    noStroke ();    
  //blue_arcs
    stroke (darkBlue);
    strokeWeight (2);
    arc (660,132, 520,286, HALF_PI, radians (158));
    bezier (580,316, 585,300, 610,296, 639,291);
    noStroke ();
  //ellipse_shitGreen
    fill (shitGreen);
    ellipse (56,417, 12,12);
    ellipse (40,295, 10,5);
  //trap_pink
    fill (pink);
    quad (95,431, 148,431, 148,434, 98,434);
    quad (98,448, 148,448, 148,451, 95,451);
  //yellow
    stroke (yellow);
    strokeWeight (7);
    line (-1,369, 5,369);
    line (-1,379, 9,379);
    strokeWeight (3);
    line (325,409, 384,381);
    line (334,385, 383,409);
    noStroke ();
  //orange
    fill (orange);
    triangle (196,337, 286,311, 196,346);
  //random_bits
    fill (lightBlue);
    quad (577,3, 590,3, 630,40, 617,40);
    fill(black);
    triangle (574,18, 592,28, 586,33);
    strokeWeight (7);
    strokeCap (SQUARE);
    stroke (lightBlue);
    line (415,134, 635,132);
    noStroke ();   
  //target_ellipse
    fill (black);
    ellipse (7,183, 17,17);
    fill (white);
    ellipse (7,183, 16,12);
    fill (black);
    ellipse (7,183, 9,9);       
  //target_square
    fill (black);
    noStroke ();
    quad (269,385, 289,380, 309,385, 289,390);
    fill(yellow);
    quad (274,385, 289,381, 304,385, 289,389);
    fill (black);
    quad (281,385, 289,382, 297,385, 289,388);
    fill (yellow);
    quad (287,385, 289,383, 291,385, 289,387); 
  //star_david
    strokeWeight (1);
    beginShape ();
    fill (white); vertex (165,202);
      vertex (170,202); vertex (174,197); vertex (178,202); vertex (183,202);
      vertex (179,206);  vertex (183,211); vertex (179,211); vertex (174,216);
      vertex (169,211); vertex (165,211); vertex (169,206); vertex (165,202);
    endShape ();  
    stroke (darkBlue);
    noFill (); line (165,202, 183,202);
    line (183,202, 174,216); line (174,216, 165,202);
    line (174,197, 183,211); line (183,211, 165,211); line (165,211, 174,197);

