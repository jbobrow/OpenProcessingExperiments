


PImage img1, img2;  


// array, that stores if ellipses should be drawn or not
boolean[] ellipseToggle = new boolean[6];

void setup() {
  size(2362, 945); //size always goes first
  smooth();
  // no loop of draw needed, because nothing is animated
  noLoop();
  img2 = loadImage("Map2 dwg.jpg");
   // Create the font
  textFont(createFont("Helvetica", 12));
  img1 = loadImage("Deprivation Map 1.jpg");
  noLoop();
}


void draw() {
  img2 = loadImage("Map2 dwg.jpg");
  
  tint (255, 126); //Display at half opacity
    fill (243, 112, 34, 190);
    stroke (243, 112, 34, 190);
    ellipse(27, 47, 20, 20);
    rect (1230, 30, 10, 20);
    
   tint (255, 126); //Display at half opacity
  fill (244, 193, 15, 190);
    stroke (244, 193, 15, 190); 
    ellipse(27, 77, 20, 20);
    rect (1230, 60, 10, 20);
    
    tint (255, 126); //Display at half opacity
  fill (63, 200, 26, 190); 
  stroke (63, 200, 26, 190);
    ellipse(27, 105, 20, 20);
    
    tint (255, 126); //Display at half opacity
  fill (33, 112, 12, 190); 
  stroke (63, 200, 26, 190);
    ellipse(27, 135, 20, 20);
    
     tint (255, 126); //Display at half opacity
  fill (01, 126);
 stroke (01, 126);
    rect (1230, 90, 10, 20);
    
       tint (255, 126); //Display at half opacity
  fill (159, 28, 227, 126); 
  stroke (159, 28, 227, 126);
    rect (1230, 120, 10, 20);
    
       tint (255, 126); //Display at half opacity
  fill (25, 154, 236, 126);
   stroke (25, 154, 236, 126);
    rect (1230, 150, 10, 20);
    
  
  fill(01);
  text("Locations Targeted During Riots", 47, 50);
  text("Number of Rioters at Locations During Riots", 1250, 50);
  text("Locations of People Arrested over Riots", 47, 80);
  text("Number of People Arrested During Riots", 1250, 80);
  text("Number of Reports by International Newspapers", 1250, 110);
  text("Number of Reports by National Newspapers", 1250, 140);
  text("Number of Reports by Local Newspapers", 1250, 170);
  text("Reported by International Newspapers", 47, 170);
  text("5% Most Deprived Urban Areas", 47, 110);
  text("5-10% Most Deprived Urban Areas",47, 140);
  
  fill(159, 28, 227);
  text("Reported by National Newspapers", 47, 200);
  
  fill(25, 154, 236);
  text("Reported by Local Newspapers", 47, 230);
  

  // draw ellipses if they are "on" 
  {
    if (ellipseToggle[5])
    image(img1, 0, 0);
       tint ( 90); //Display at half opacity

} 
  if (ellipseToggle[0])
  {  
   tint (255, 126); //Display at half opacity
    fill (244, 193, 15, 190);
    stroke (244, 193, 15, 190); 
    ellipse(236, 285, 20, 20);
    ellipse(118, 259, 20, 20);
    ellipse(259, 377, 20, 20);
    ellipse(283, 413, 20, 20);
    ellipse(330, 389, 20, 20);
    ellipse(354, 495, 20, 20);
    ellipse(401, 259, 20, 20);
    ellipse(401, 259, 20, 20);
    ellipse(413, 247, 20, 20);
    ellipse(401, 129, 20, 20);
    ellipse(413, 165, 20, 20);
    ellipse(472, 236, 20, 20);
    ellipse(519, 590, 20, 20);
    ellipse(625, 649, 20, 20);
    ellipse(401, 259, 20, 20);
    ellipse(684, 188, 20, 20);
    ellipse(755, 578, 20, 20);
    ellipse(920, 177, 20, 20);
    ellipse(991, 672, 20, 20);
    ellipse(1014, 318, 20, 20);
    ellipse(495, 672, 20, 20);
    ellipse(590, 130, 20, 20);
    ellipse(967, 212, 20, 20);
    ellipse(660, 743, 20, 20);
    ellipse(365, 495, 20, 20);
    ellipse(932, 436, 20, 20);
    ellipse(236, 153, 20, 20);
    ellipse(247, 200, 20, 20);
    ellipse(236, 371, 20, 20);
    ellipse(342, 200, 20, 20);
    ellipse(359, 460, 20, 20);
    ellipse(359, 460, 20, 20);
    ellipse(377, 196, 20, 20);
    ellipse(389, 141, 20, 20);
    ellipse(590, 100, 20, 20);
    ellipse(613, 106, 20, 20);
    ellipse(625, 129, 20, 20);
    
    
    rect (2076, 300, 10, 20);
    rect (2006, 369, 10, 20);
    rect (2041, 387, 10, 20);
    rect (2088, 440, 10, 20);
    rect (2035, 516, 10, 20);
    rect (2141, 676, 10, 20);
    rect (1834, 611, 10, 20);
    rect (1770, 735, 10, 20);
    rect (1770, 375, 10, 20);
    rect (1740, 676, 10, 20);
    rect (1693, 345, 10, 20);
    rect (1628, 629, 10, 20);
    rect (1604, 664, 10, 20);
    rect (1581, 404, 10, 20);
    rect (1545, 336, 10, 20);
    rect (1545, 357, 10, 20);
    rect (1534, 404, 10, 20);
    rect (1516, 416, 10, 20);
    rect (1463, 570, 10, 20);
    rect (1451, 558, 10, 20);
    rect (1439, 408, 10, 100);
    rect (1392, 499, 10, 20);
    rect (1368, 475, 10, 20);
    rect (1357, 428, 10, 20);
    rect (1371, 377, 10, 20);
    rect (1357, 342, 10, 40);
    rect (1345, 487, 10, 20);
    rect (1463, 404, 10, 20);
    rect (1463, 534, 10, 20);
    rect (1498, 325, 10, 40);
    rect (1498, 345, 10, 20);
    rect (1687, 339, 10, 20);
    rect (1716, 354, 10, 20);
    rect (1722, 339, 10, 20);
    
    
    
    
    
    
    
    
    
 
  }
  if (ellipseToggle[1])
  {  
    tint (255, 126); //Display at half opacity
    fill (243, 112, 34, 130);
    stroke (243, 112, 34, 190);
    ellipse(259, 306, 20, 20);
    ellipse(365, 247, 20, 20);
    ellipse(389, 153, 20, 20);
    ellipse(395, 212, 20, 20);
    ellipse(424, 141, 20, 20);
    ellipse(424, 271, 20, 20);
    ellipse(436, 129, 20, 20);
    ellipse(436, 177, 20, 20);
    ellipse(483, 306, 20, 20);
    ellipse(501, 253, 20, 20);
    ellipse(525, 377, 20, 20);
    ellipse(566, 295, 20, 20);
    ellipse(525, 377, 20, 20);
    ellipse(525, 365, 20, 20);
    ellipse(590, 383, 20, 20);
    ellipse(601, 401, 20, 20);
    ellipse(601, 424, 20, 20);
    ellipse(613, 418, 20, 20);
    ellipse(625, 436, 20, 20);
    ellipse(649, 455, 20, 20);
    ellipse(696, 436, 20, 20);
    ellipse(543, 271, 20, 20);
    ellipse(436, 413, 20, 20);
    ellipse(289, 241, 20, 20);
    ellipse(383, 430, 20, 20);
    ellipse(342, 436, 20, 20);
    ellipse(318, 466, 20, 20);
    ellipse(300, 477, 20, 20);
    
    rect (1746, 490, 10, 50);
    rect (1805, 462, 10, 60);
    rect (1740, 481, 10, 50);
    rect (1722, 485, 10, 40);
    rect (1711, 461, 10, 70);
    rect (1711, 449, 10, 70);
    rect (1699, 437, 10, 70);
    rect (1663, 405, 10, 90);
    rect (1634, 405, 10, 90);
    rect (1534, 436, 10, 70);
    rect (1486, 472, 10, 70);
    rect (1451, 478, 10, 70);
    rect (1416, 490, 10, 50);
    rect (1398, 516, 10, 50);
    rect (1593, 265, 10, 100);
    rect (1640, 342, 10, 80);
    rect (1557, 360, 10, 100);
    rect (1593, 344, 10, 80);
    rect (1486, 324, 10, 100);
    rect (1504, 313, 10, 100);
    rect (1439, 327, 10, 80);
    rect (1374, 354, 10, 70);
    rect (1374, 390, 10, 70);
    rect (1551, 289, 10, 100);
    rect (1534, 257, 10, 120);
    rect (1539, 251, 10, 120);
    rect (1557, 234, 10, 120);
    rect (1545, 295, 10, 120);
    
    
    
  }
  
  if (ellipseToggle[2])
  { 
   fill(01);
  text("Centenary Square", 520, 444);
  text("White Abbey Road", 483, 320);
  text("Whetley Hill", 424, 260);
  text("Manningham Labour Club", 270, 306);
  text("Oak Lane", 445, 120);
  text("Bradford Arms", 555, 260);
  text("Old Fellows Pub", 252, 440);
  text("Second West", 238, 466);
  
  fill(01,126);
  rect (1687, 481, 10, 50);
  rect (1634, 418, 10, 30);
  rect (1581, 430, 10, 30);
  rect (1510, 406, 10, 30);
  rect (1516, 317, 10, 60);
  rect (1410, 532, 10, 60);
  rect (1439, 528, 10, 20);
  rect (1421, 534, 10, 20);
  
  
  }
  if (ellipseToggle[3])
  {
    fill(159, 28, 227);
  text("Centenary Square", 520, 460);
  text("White Abbey Road", 483, 335);
  text("Whetley Hill", 424, 275);
  text("Manningham Labour Club", 270, 320);
  text("Betting Shop", 405, 212);
  text("Whetley Motor Company", 245, 257);
  text("Arthur's Bar", 446, 177);
  text("Westgate", 601, 377);
  text("Addison's Bar", 611, 407);
  text("BMW Garage", 317, 153);
  text("Upper and Lower Globe Pub", 710, 436);
  text("Arthur's Bar", 501, 243);
  text("Bradford Arms", 555, 270);
  text("Chemist", 390, 430);
  text("Old Fellows Pub", 252, 450);
  text("Second West", 238, 476);
  text("The Coach House", 200, 497);
  
  fill(159, 28, 227, 126);
  rect (1746, 486, 10, 50);
  rect (1681, 491, 10, 40);
  rect (1687, 513, 10, 20);
  rect (1805, 491, 10, 40);
  rect (1616, 407, 10, 60);
  rect (1675, 428, 10, 20);
  rect (1640, 404, 10, 20);
  rect (1616, 388, 10, 60);
  rect (1534, 371, 10, 30);
  rect (1557, 263, 10, 120);
  rect (1374, 406, 10, 30);
  rect (1386, 352, 10, 120);
  rect (1498, 522, 10, 20);
  rect (1439, 542, 10, 20);
  rect (1404, 524, 10, 30);
  rect (1368, 528, 10, 50);

 

    
  }
  if (ellipseToggle[4]) {
    fill(25, 154, 236);
  text("Centenary Square", 520, 475);
  text("White Abbey Road", 483, 350);
  text("Whetley Hill", 424, 290);
  text("Manningham Labour Club", 270, 335);
  text("Bradford Arms", 555, 280);
  text("Westgate", 601, 390);
  text("McCann's DIY Store", 435, 145);
  text("Oak Lane", 445, 130);
  text("BMW Garage", 317, 165);
  text("Tyris Police Station", 625, 425);
  text("Hall Ings Road", 635, 440);
  text("Bradford Interchange", 649, 475);
  text("Upper and Lower Globe Pub", 710, 450);
  text("Manningham Lane", 580, 310);
  text("Save Garage", 445, 413);
  text("St. Leonard's Road", 185, 245);
  text("The Coach House", 200, 507);
 
  fill(25, 154, 236, 126);
  rect (1758, 540, 10, 20);
  rect (1811, 540, 10, 20);
  rect (1740, 516, 10, 20);
  rect (1728, 505, 10, 20);
  rect (1705, 494, 10, 60);
  rect (1711, 467, 10, 40);
  rect (1616, 489, 10, 30);
  rect (1598, 423, 10, 60);
  rect (1528, 388, 10, 60);
  rect (1528, 388, 10, 60);
  rect (1687, 426, 10, 40);
  rect (1675, 428, 10, 20);
  rect (1563, 321, 10, 50);
  rect (1551, 265, 10, 100);
  rect (1439, 277, 10, 100);
  rect (1410, 394, 10, 30);
  rect (1374, 346, 10, 120);
  rect (1380, 534, 10, 50);
  
  



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


