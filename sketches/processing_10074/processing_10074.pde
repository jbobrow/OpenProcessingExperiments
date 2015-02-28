
//click and hold the mouse button and move the pick across the strings to rock out!

color mesh = color (60);
color boom = color (130, 105, 100);
color plate = color (109, 101, 103);
color grn = color (200, 230, 40);
color yel = color (250, 206, 84);
color or = color (240, 135, 40);
color rd = color (235, 80, 40);

void setup(){
  size (450, 450);
  smooth();
}

void draw(){
  background (255);
  smooth();
  //back for EQ box
  fill (plate);
  rect (263, 112, 135, 45);
  //guitar and amp image
  PImage img; 
  img = loadImage("guitar.png");
  image (img, 0, 0);
  //still speaker
  fill(mesh);
  stroke (0);
  for (int d = 75; d > 0; d -=25){ 
    ellipse (330, 224, (d), (d));
    ellipse (330, 346, (d), (d));
  }
  //vibration occurs when pressed mouse is moved along Y axis   
  noStroke();
  float speed = abs ((mouseY - pmouseY)*0.2); 
  if (mousePressed){
    //jumping bars on EQ using for loop
    //    for (int v = 272; v <= 382; v = v+10){ 
    //      rect (v, 150, 8, -speed);
    //    }
//jumping bars on EQ differing heights
//I wanted to use for loop but couldn't figure out random heights
fill (grn);
rect (272, 150, 8, -speed);
rect (282, 150, 8, -speed*1.2);
fill (yel);
rect (292, 150, 8, -speed*1.5);
fill (or);
rect (302, 150, 8, -speed*1.4);
rect (312, 150, 8, -speed*1.6);
fill (rd);
rect (322, 150, 8, -speed*1.8);
rect (332, 150, 8, -speed*2);
fill (or);
rect (342, 150, 8, -speed*1.7);
fill (rd);
rect (352, 150, 8, -speed*1.9);
fill (or);
rect (362, 150, 8, -speed*1.5);
fill (yel);
rect (372, 150, 8, -speed);
rect (382, 150, 8, -speed*1.2);
fill (boom);
    stroke(0);
//mask to contain EQ bars within box
    PImage img2; 
    img2 = loadImage("barmask.png");
    image (img, 0, 0);
//vibrating speaker
    for (int d = 75; d > 0; d -=25){ 
      ellipse (330, 224, (d+speed), (d+speed));
      ellipse (330, 346, (d+speed), (d+speed));
    }
  }
//pick
  translate (-10, -12); 
  noStroke ();
  fill(grn); 
  beginShape();
  vertex (mouseX+3, mouseY);
  bezierVertex (mouseX+5, mouseY-1, mouseX+14, mouseY+5, mouseX+14, mouseY+10);
  bezierVertex (mouseX+14, mouseY+15, mouseX+3, mouseY+19, mouseX, mouseY+15);
  bezierVertex (mouseX-3, mouseY+10, mouseX, mouseY+2, mouseX+3, mouseY);
  endShape();
  translate (12, 12);

}








