
PImage img; PImage img0; PImage img1;
float x = 0;

void setup(){
  size(720,540);
  img = loadImage("sun.png");
  img0 = loadImage("earth.png");
  img1 = loadImage("moon.png");
}

void draw(){
  fill(0,85);      // this gives the blurry effect
  noStroke();
  rect(0,0,width,height);
  
  pushMatrix();
  translate(width/2,height/2); 
  rotate(x*.02);
  image(img,-150,-140); //the sun
  popMatrix();
  
  x+=.01;
  translate(width/2,height/2);
  translate(30,20); //makes it looke like the earth is traveling in an elliptical orbit
  rotate(x);
  image(img0,150,100); //earth
  
  translate(160,110); //the moon is travelling seperately from the earth, this makes the illusion that it does
  rotate(x*2.2);
  image(img1,10,5); //moon
  
  
}

