


PImage bg;


void setup(){
  size(800,600);
  bg = loadImage("catty.jpg");
  background(bg);
  smooth();
  strokeWeight(8);
  frameRate(10);
}

void draw(){
  bg = loadImage("catty.jpg");
  background(bg);
  smooth();

   fill(0);
  float mx = constrain(mouseX,190,280);
  float my = constrain(mouseY,190,270);
  ellipse(mx,my,40,40);
  
  fill(0,100,150);
  float hx = constrain(mouseX,192,276);
  float hy = constrain(mouseY,197,265);
  ellipse(mx,my,30,30);
 
  //eye ball right

  fill(0);
  float ix = constrain(mouseX,544,626);
  float iy = constrain(mouseY,190,270);
  ellipse(ix,iy,40,40);

  fill(0,100,150);
  float nx = constrain(mouseX,545,627);
  float ny = constrain(mouseY,193,269);
  ellipse(nx,ny,30,30);


}

  


