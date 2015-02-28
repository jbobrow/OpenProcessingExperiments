
PImage img1, img2, img3, img4, img5;
float x,y ;
float angle = 0;
float r =400;
float diff =1;
void setup() {
  size(800, 800);
  background(255);
  img1 = loadImage("1.png");
  img2 = loadImage("2.png");
  img3 = loadImage("3.png");
  img4 = loadImage("4.png");
  img5 = loadImage("5.png");
}


void draw() {
   
  image(img3, 160, 200, 480,400);


  x=r* cos(angle);
  y=r* sin(angle);
 
  pushMatrix();
  translate(width/2, height/2);
  rotate(r);
  tint(255,120);
  image(img4, 0, 0);
  popMatrix(); 
  

  

  image(img1,random(mouseY,mouseX),random(mouseX,mouseY));

 
 
  angle += 0.01;
  r= r -diff;
  if (r== 0|| r==400){
    diff =diff*-1;}
  // angle = angle +0.01;
}



