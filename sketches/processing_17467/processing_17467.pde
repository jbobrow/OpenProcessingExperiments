
void setup() {
  size(200,200);
  background(40);
  smooth();
  
  // Neck Stuff
  rectMode(CENTER);      //
  noStroke();            //
  fill(80);              //
  rect(100,162,30,26);   //
  stroke(65);            //
  line(85,154,114,154);  // Neck Line
  line(85,170,114,170);  // Neck Line
  
  // Antenna
  noStroke();
  triangle(width/2,20,(width/2)-3,40,(width/2)+3,40);
  fill(255,0,0);
  ellipse(width/2,20,10,10);
  
  // Light Grey Stuff
  noStroke();            //
  fill(150);             //
  rectMode(CENTER);      //
  rect(100,94,81,110);   // Head
  rect(100,200,160,50);  // Body
  
  // Metal Details
  // Rectangles
  rectMode(CENTER);
  fill(130);
  rect((width/2),200,60,20);
  fill(100,190,230);
  rect((width/2-10),200,36,15);
  // Ellipse
  fill(100,255,100);
  ellipse((width/2+18),198,10,10);
  stroke(138);
  // Lines
  line(60,45,139,45);
  line(80,45,80,140);
  line(60,140,139,140);
  line(20,182,179,182);
  // Points
  strokeWeight(2);
  point(65, 42);
  point(95, 42);
  point(125, 42);
  point(70,48);
  point(90,48);
  point(110, 48);
  point(130, 48);
  point(65, 142);
  point(95, 142);
  point(125, 142);
  point(40, 179);
  point(67, 179);
  point(94, 179);
  point(125, 179);
  point(160, 179);
  point(47, 184);
  point(75, 184);
  point(102, 184);
  point(134, 184);
  point(168, 184);
  
  noStroke();
  fill(255);             // White Stuff
  rect(77,80,35,35);     // Eye Left
  rect(123,80,35,35);    // Eye Right
  
  rect(100,124,96,25);   // Mouth
  
  strokeWeight(1);
  stroke(200);           // Mouth line Stuff
  line(52,124,147,124);  // Mouth line horizontal
  line(100,111,100,136); // Mouth line Middle
  line(113,111,113,136); //
  line(126,111,126,136); //
  line(139,111,139,136); //
  line(87,111,87,136);   //
  line(74,111,74,136);   // 
  line(61,111,61,136);   //
}

void draw() {
  noStroke();
  fill(255);             // White Stuff
  rect(77,80,35,35);     // Eye Left
  rect(123,80,35,35);    // Eye Right
  strokeWeight(3);       // Pupil Stuff
  stroke(40);
  fill(255);             //
  rect(((mouseX+pmouseX)/20)+63,((mouseY+pmouseY)/16)+68,8,8);       // Pupil Left
  rect(((mouseX+pmouseX)/20)+117,((mouseY+pmouseY)/16)+68,8,8);      // Pupil Right
  
}

void mousePressed(){
  println("Does. Not. Compute.");
  
  // Mouth Open
  fill(50);
  noStroke();
  rect(100,124,96,15);
  
  // Lightning Bolt
  stroke(255,255,0);
  line((width/2)-8,14,(width/2)-17,8);
  line((width/2)-19,12,(width/2)-17,8);
  line((width/2)-19,12,(width/2)-25,7);
  
}

void mouseReleased() {
  noStroke();
  
  // Close the mouth again
  fill(255);             // White Stuff
  rect(100,124,96,25);   // Mouth
  strokeWeight(1);       //
  stroke(200);           // Mouth line Stuff
  line(52,124,147,124);  // Mouth line horizontal
  line(100,111,100,136); // Mouth line Middle
  line(113,111,113,136); //
  line(126,111,126,136); //
  line(139,111,139,136); //
  line(87,111,87,136);   //
  line(74,111,74,136);   // 
  line(61,111,61,136);   //
  
  // Cover up Lightning Bolt  
  noStroke();
  fill(40);
  rectMode(CORNERS);
  rect((width/2)-6,16,(width/2)-28,5);
  rectMode(CENTER);
}

