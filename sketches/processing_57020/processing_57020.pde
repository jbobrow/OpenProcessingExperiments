
PImage myimage;

void setup(){
  size(400, 400);
 myimage = loadImage("kits.jpg");

}

void draw () {
  
  image(myimage, 0, 0, 400, 400);
  
   frameRate(10);
   noStroke();
   smooth();
   fill(random(250), random(113), random(0), 150);
  ellipse(200, 200, 300, 300);
  
  fill(random(100), random(30), random(0), 150);
  ellipse(200, 200, 250, 250);
  
  fill(random(142), random(247), random(241), 150);
  triangle(55, 160, 80, 30, 140, 62);
  
  fill(random(142), random(247), random(241), 150);
  triangle(345, 160, 320, 30, 260, 62);
  
  fill(random(142), random(247), random(241));
  triangle(180, 210, 200, 240, 220, 210);
  
    fill(random(142), random(247), random(241));
  ellipse(120, 170, 20, 20);
  
  fill(random(142), random(247), random(241));
  ellipse(280, 170, 20, 20);
}
  

