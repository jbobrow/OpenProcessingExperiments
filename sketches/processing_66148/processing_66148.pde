
void setup() {

  size(700, 700);
  background(10, 30, 50);
  smooth();
  noFill();

  //variables
  String s1 = "Never gonna give you up";
  String s2 = "Never gonna let you down";
  String s3 = "Never gonna run around and desert you";
  float line1 = 1.1;
  float line2 = 1.2;
  float line3 = 1.3; 
  int line0 = 0;

  // stroke stuff
  stroke(255);
  bezier(300, 100, 200, 400, 150, 400, 100, 250);
  bezier(100, 250, 70, 20, 300, 40, 550, 250);  
  bezier(550, 250, 500, 280, 450, 270, 450, 220);
  bezier(450, 220, 580, 320, 580, 200, 650, 80);

  beginShape(LINES);
  vertex(width-(height*0.2), 100);
  vertex(101, 53);
  vertex(105, 122);
  vertex(150, 122);
  endShape();

  ellipse(150, 580, 60, 60);
  ellipse(150, 535, 60, 60);
  bezier(190, 490, 25, 675, 40, 700, 220, 580);

  ellipse(490, 480, 125, 200);
  line(510, 480, 390, 200);  
  line(510, 495, 320, 310);    
  line(495, 505, 320, 350);      

  // no stroke stuff
  noStroke();

  fill(233, 99, 48);
  ellipse(530, 380, 100, 110);
  
  fill(30, 160, 62);
  arc(55, 450, 100, 70, 0, PI/2.5);

  fill(233, 99, 48);
  rect(width/2-50, height*0.7, 50, 90);

  fill(30, 160, 62);
  ellipse(455, 590, 130, 160);  

  fill(215, 209, 60);
  bezier(50, 300, 200, 200, 350, 240, 300, 350);
  fill(215, 209, 60);
  bezier(50, 300, 130, 350, 330, 410, 300, 350);

  //print stuff
  println("N" + line0 + " STRANGERS TO LOVE");
  println(line1 + ": " + s1);
  println(line2 + ": " + s2);
  println(line3 + ": " + s3);
}


