
/* @pjs crisp=true; 
preload="Deprivation Map 1.jpg,map2.jpg,sci-fi.png"; 
 */

PImage bg;
PImage img;  



// array, that stores if ellipses should be drawn or not
boolean[] ellipseToggle = new boolean[6];

void setup() {
  size(1453, 614); //size always goes first
  smooth();
  // no loop of draw needed, because nothing is animated
  noLoop();
   bg = loadImage("map2.jpg");
  background(bg);

  // Create the font
  textFont(createFont("Helvetica", 7));
  textFont(createFont("Helvetica", 9));
  img = loadImage("Deprivation Map 1.jpg");
  noLoop();
}


void draw() {
  // clear background
  background(bg);




  tint (255, 126); //Display at half opacity
  fill (243, 112, 34, 190);
  stroke (243, 112, 34, 190);
  ellipse(16, 28, 12, 12);
  rect (738, 18, 6, 12);

  tint (255, 126); //Display at half opacity
  fill (244, 193, 15, 190);
  stroke (244, 193, 15, 190); 
  ellipse(16, 46, 12, 12);
  rect (738, 36, 6, 12);

  tint (255, 126); //Display at half opacity
  fill (63, 200, 26, 190); 
  stroke (63, 200, 26, 190);
  ellipse(16, 63, 12, 12);

  tint (255, 126); //Display at half opacity
  fill (33, 112, 12, 190); 
  stroke (63, 200, 26, 190);
  ellipse(16, 81, 12, 12);

  tint (255, 126); //Display at half opacity
  fill (01, 126);
  stroke (01, 126);
  rect (738, 54, 6, 12);

  tint (255, 126); //Display at half opacity
  fill (159, 28, 227, 126); 
  stroke (159, 28, 227, 126);
  rect (738, 72, 6, 12);

  tint (255, 126); //Display at half opacity
  fill (25, 154, 236, 126);
  stroke (25, 154, 236, 126);
  rect (738, 90, 6, 12);


  fill(01);
  textFont(createFont("Helvetica", 9));
  text("Locations Targeted During Riots", 28, 30);
  text("Number of Rioters at Locations During Riots", 750, 30);
  text("Locations of People Arrested over Riots", 28, 48);
  text("Number of People Arrested During Riots", 750, 48);
  text("Number of Reports by International Newspapers", 750, 66);
  text("Number of Reports by National Newspapers", 750, 84);
  text("Number of Reports by Local Newspapers", 750, 102);
  text("Reported by International Newspapers", 28, 102);
  text("5% Most Deprived Urban Areas", 28, 66);
  text("5-10% Most Deprived Urban Areas", 28, 84);

  fill(159, 28, 227);
  text("Reported by National Newspapers", 28, 120);

  fill(25, 154, 236);
  text("Reported by Local Newspapers", 28, 138);


  // draw ellipses if they are "on" 
  {
    if (ellipseToggle[5])
      image(img, 0, 0);
    tint ( 90); //Display at half opacity
  } 
  if (ellipseToggle[0])
  {  
    tint (255, 126); //Display at half opacity
    fill (244, 193, 15, 190);
    stroke (244, 193, 15, 190); 
    ellipse(394, 171, 12, 12);
    ellipse(70, 155, 12, 12);
    ellipse(155, 226, 12, 12);
    ellipse(169, 247, 12, 12);
    ellipse(198, 233, 12, 12);
    ellipse(212, 297, 12, 12);
    ellipse(240, 155, 12, 12);
    ellipse(240, 155, 12, 12);
    ellipse(247, 148, 12, 12);
    ellipse(240, 77, 12, 12);
    ellipse(247, 99, 12, 12);
    ellipse(283, 141, 12, 12);
    ellipse(311, 354, 12, 12);
    ellipse(375, 389, 12, 12);
    ellipse(240, 155, 12, 12);
    ellipse(410, 112, 12, 12);
    ellipse(453, 346, 12, 12);
    ellipse(552, 106, 12, 12);
    ellipse(594, 403, 12, 12);
    ellipse(608, 190, 12, 12);
    ellipse(297, 403, 12, 12);
    ellipse(354, 78, 12, 12);
    ellipse(580, 127, 12, 12);
    ellipse(396, 445, 12, 12);
    ellipse(219, 297, 12, 12);
    ellipse(559, 261, 12, 12);
    ellipse(141, 91, 12, 12);
    ellipse(148, 120, 12, 12);
    ellipse(141, 222, 20, 12);
    ellipse(205, 120, 12, 12);
    ellipse(215, 276, 12, 12);
    ellipse(215, 276, 12, 12);
    ellipse(226, 117, 12, 12);
    ellipse(233, 84, 12, 12);
    ellipse(354, 60, 12, 12);
    ellipse(367, 63, 12, 12);
    ellipse(375, 77, 12, 12);


    rect (1245, 180, 6, 12);
    rect (1203, 221, 6, 12);
    rect (1224, 232, 6, 12);
    rect (1252, 264, 6, 12);
    rect (1221, 309, 6, 12);
    rect (1284, 405, 6, 12);
    rect (1100, 366, 6, 12);
    rect (1062, 441, 6, 12);
    rect (1062, 225, 6, 12);
    rect (1044, 405, 6, 12);
    rect (1015, 207, 6, 12);
    rect (976, 377, 6, 12);
    rect (962, 398, 6, 12);
    rect (948, 242, 6, 12);
    rect (927, 201, 6, 12);
    rect (927, 214, 6, 12);
    rect (920, 242, 6, 12);
    rect (909, 249, 6, 12);
    rect (877, 342, 6, 12);
    rect (870, 334, 6, 12);
    rect (863, 244, 6, 60);
    rect (835, 299, 6, 12);
    rect (820, 285, 6, 12);
    rect (814, 256, 6, 12);
    rect (822, 226, 6, 12);
    rect (814, 205, 6, 24);
    rect (807, 292, 6, 12);
    rect (877, 242, 6, 12);
    rect (877, 320, 6, 12);
    rect (898, 195, 6, 12);
    rect (898, 207, 6, 12);
    rect (1012, 203, 6, 12);
    rect (1029, 212, 6, 12);
    rect (1033, 203, 6, 12);
  }
  if (ellipseToggle[1])
  {  
    tint (255, 126); //Display at half opacity
    fill (243, 112, 34, 130);
    stroke (243, 112, 34, 190);
    ellipse(145, 183, 12, 12);
    ellipse(219, 148, 12, 12);
    ellipse(233, 91, 12, 12);
    ellipse(237, 127, 12, 12);
    ellipse(254, 84, 12, 12);
    ellipse(254, 162, 12, 12);
    ellipse(261, 77, 12, 12);
    ellipse(261, 106, 12, 12);
    ellipse(289, 183, 12, 12);
    ellipse(300, 151, 12, 12);
    ellipse(315, 226, 12, 12);
    ellipse(339, 177, 12, 12);
    ellipse(315, 226, 12, 12);
    ellipse(315, 219, 12, 12);
    ellipse(354, 229, 12, 12);
    ellipse(360, 240, 12, 12);
    ellipse(360, 254, 12, 12);
    ellipse(367, 250, 12, 12);
    ellipse(375, 261, 12, 12);
    ellipse(389, 273, 12, 12);
    ellipse(417, 261, 12, 12);
    ellipse(325, 162, 12, 12);
    ellipse(261, 247, 12, 12);
    ellipse(173, 144, 12, 12);
    ellipse(169, 258, 12, 12);
    ellipse(205, 261, 12, 12);
    ellipse(190, 279, 12, 12);
    ellipse(180, 286, 12, 12);

    rect (1047, 294, 6, 30);
    rect (1083, 277, 6, 36);
    rect (1044, 288, 6, 30);
    rect (1033, 291, 6, 24);
    rect (1026, 276, 6, 42);
    rect (1026, 269, 6, 42);
    rect (1019, 262, 6, 42 );
    rect (997, 243, 6, 54);
    rect (980, 243, 6, 54);
    rect (918, 261, 6, 42);
    rect (891, 283, 6, 42);
    rect (870, 286, 6, 42);
    rect (849, 294, 6, 30);
    rect (838, 309, 6, 30);
    rect (955, 159, 6, 60);
    rect (984, 205, 6, 48);
    rect (934, 216, 6, 60);
    rect (955, 206, 6, 48);
    rect (819, 194, 6, 60);
    rect (902, 187, 6, 60);
    rect (863, 196, 6, 48);
    rect (824, 212, 6, 42);
    rect (824, 234, 6, 42);
    rect (930, 173, 6, 60);
    rect (920, 154, 6, 72);
    rect (923, 150, 6, 72);
    rect (934, 140, 6, 72);
    rect (927, 177, 6, 72);
  }

  if (ellipseToggle[2])
  { 
    fill(01);
    textFont(createFont("Helvetica", 8));
    text("Centenary Square", 312, 266);
    text("White Abbey Road", 289, 192);
    text("Whetley Hill", 254, 156);
    text("Manningham Labour Club", 162, 183);
    text("Oak Lane", 267, 72);
    text("Bradford Arms", 333, 156);
    text("Old Fellows Pub", 151, 264);
    text("Second West", 142, 279);

    fill(01, 126);
    rect (1012, 288, 6, 30);
    rect (980, 250, 6, 18);
    rect (948, 258, 6, 18);
    rect (906, 243, 6, 18);
    rect (909, 190, 6, 36);
    rect (846, 319, 6, 36);
    rect (863, 316, 6, 12);
    rect (852, 320, 6, 12);
  }
  if (ellipseToggle[3])
  {
    fill(159, 28, 227);
    textFont(createFont("Helvetica", 8));
    text("Centenary Square", 312, 276);
    text("White Abbey Road", 289, 201);
    text("Whetley Hill", 254, 165);
    text("Manningham Labour Club", 162, 192);
    text("Betting Shop", 243, 127);
    text("Whetley Motor Company", 147, 154);
    text("Arthur's Bar", 267, 106);
    text("Westgate", 360, 226);
    text("Addison's Bar", 366, 244);
    text("BMW Garage", 190, 91);
    text("Upper and Lower Globe Pub", 426, 261);
    text("Arthur's Bar", 300, 145);
    text("Bradford Arms", 333, 162);
    text("Chemist", 234, 258);
    text("Old Fellows Pub", 151, 270);
    text("Second West", 142, 285);
    text("The Coach House", 120, 298);

    fill(159, 28, 227, 126);
    rect (1047, 291, 6, 30);
    rect (1008, 294, 6, 24);
    rect (1012, 307, 6, 12);
    rect (1083, 294, 6, 24);
    rect (969, 244, 6, 36);
    rect (1005, 256, 6, 12);
    rect (984, 242, 6, 12);
    rect (969, 232, 6, 36);
    rect (920, 222, 6, 18);
    rect (934, 157, 6, 72);
    rect (824, 243, 6, 18);
    rect (831, 211, 6, 72);
    rect (898, 313, 6, 12);
    rect (863, 325, 6, 12);
    rect (842, 314, 6, 18);
    rect (820, 316, 6, 30);
  }
  if (ellipseToggle[4]) {
    fill(25, 154, 236);
    textFont(createFont("Helvetica", 8));
    text("Centenary Square", 312, 285);
    text("White Abbey Road", 289, 210);
    text("Whetley Hill", 254, 174);
    text("Manningham Labour Club", 162, 201);
    text("Bradford Arms", 333, 168);
    text("Westgate", 360, 234);
    text("McCann's DIY Store", 261, 87);
    text("Oak Lane", 267, 78);
    text("BMW Garage", 190, 99);
    text("Tyris Police Station", 375, 255);
    text("Hall Ings Road", 381, 264);
    text("Bradford Interchange", 389, 285);
    text("Upper and Lower Globe Pub", 426, 270);
    text("Manningham Lane", 348, 186);
    text("Save Garage", 267, 247);
    text("St. Leonard's Road", 111, 147);
    text("The Coach House", 120, 304);

    fill(25, 154, 236, 126);
    rect (1054, 324, 6, 12);
    rect (1086, 324, 6, 12);
    rect (1044, 309, 6, 12);
    rect (1036, 303, 6, 12);
    rect (1023, 296, 6, 36);
    rect (1026, 280, 6, 24);
    rect (969, 293, 6, 18);
    rect (1598, 958, 6, 36);
    rect (916, 232, 6, 36);
    rect (916, 232, 6, 36);
    rect (1012, 255, 6, 24);
    rect (1005, 256, 6, 12);
    rect (921, 192, 6, 30);
    rect (930, 159, 6, 60);
    rect (863, 166, 6, 60);
    rect (846, 236, 6, 18);
    rect (824, 207, 6, 72);
    rect (828, 320, 6, 30);
  }
}  




void keyPressed() {
  // turn ellipses on/off
  if ((key == 'q') || (key =='Q')) {
    ellipseToggle[0] = !ellipseToggle[0];
  }
  if ((key == 'w') || (key == 'W')) {
    ellipseToggle[1] = !ellipseToggle[1];
  }
  if ((key == 'e') || (key == 'E')) {
    ellipseToggle[2] = !ellipseToggle[2];
  }
  if ((key == 'r') || (key == 'R')) {
    ellipseToggle[3] = !ellipseToggle[3];
  }
  if ((key == 't') || (key == 'T')) {
    ellipseToggle[4] = !ellipseToggle[4];
  }
  if ((key == 'y') || (key == 'Y')) {
    ellipseToggle[5] = !ellipseToggle[5];
  }


  // turn all ellipses off
  if (key == ' ') {
    for (int i=0; i< ellipseToggle.length; i++) {
      ellipseToggle[i] = false;
    }
  }

  // execute the code inside draw() again
  redraw();
}



