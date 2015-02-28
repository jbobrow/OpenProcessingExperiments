
size(640, 480);
background (21,42,109);

smooth ();
fill (255,255,255);

//fat_white
  noStroke ();  
quad(416,0,
566, 0,
402, 302,
278, 246);

//hammerhead
  stroke (0);
quad (248,211,
433,314,
403, 370,
217,267);

//cheese
quad (376,176,
466,228,
440,278,
348,227);

//cheese_thinstrip
line (404,192,
      376,243);
      
//cheese_bigpiece
line (418, 200, 
      390, 250);
      
//cheese_corner
line (432, 208
      ,413, 242);
line (413, 242,
      448, 261);
      
//big_blue
  noStroke();
  fill (31,61,88);
quad (220,0,
      330,0,
      100,403,
      94, 220);
      
      
//white_corner
  fill (255,255,255);
triangle (0,352,
          80, 320,
          0,460);
          
//grey_corner
  fill (111,137,164);
quad (61,0,
      220,0,
      94,220,
      -38,163);
     
//black_left
  fill (0);
quad (0, 163,
      94, 220,
      100, 403,
      0, 352);
      
//PRISM_REDTOP
  fill(182,4,27);
quad (0, 242,
      136,319,
      111,363,
      0,301);
//prism_white facet
  fill (255,255,255);
quad (0,295,
      113,358,
      111,363,
      0,301);
      
//prism_bottom
//redside
  fill(182,4,27);
quad(0,92,
     75, 134,
     75,170,
     0,128);
//blueishside
  fill(80,112,139);
quad(75,134,
     101,90,
     102, 126,
     75, 170);
//blacktop
  fill(0);
quad (0,38,
      101,90,
      75,134,
      0,92);

//prism_middle
//front
  fill (80,112,139);
quad(0,57,
     40,78,
     40, 107,
     0,85);
//side
  fill (31,61,88);
quad(40,78,
     65,46,
      65,78,
      40, 107);
//top
   fill (111,137,164);
   stroke (0);
   strokeWeight (.25);
 quad(0,11,  
      64,46,
      40,78,
      0,57); 
      
noStroke();      
     
//prism_top
//front
  fill (31,61,88);
quad (0,16,
      7, 20,
      7,44,
      0,42); 
//side
  fill (203,228,231);
quad (7, 20,
      17,8,
      17,30,
      7,44);
//top
  fill(0);
quad (0,1,
      17,8,
      7,20,
      0,16);
     
     
//black_midtop
   fill(0);
quad(354,0,
     386,0,
     328,100,
     328,43);

//red_top
  fill(182,4,27);
quad(296,0, 
     354,0,
     328, 43,
     285,19);
     
//white_diamond
   fill(255,255,255);
quad (285,19,
      328,43,
      328,100,
      285,75);              
