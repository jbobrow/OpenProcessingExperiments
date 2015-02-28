
PImage myImage1;
PImage myImage2;
PImage myImage3;

void setup(){
  size(1000,1000);
  myImage1=loadImage("flower.jpg");
  myImage2=loadImage("MICHAELGlass.jpg");
  myImage3=loadImage("MICHAELdeserts.jpg");
}

void draw(){
  tint(200,0,200,150);
  image(myImage1,random(200,800),random(250,500),random(0,250),random(0,250));
  tint(0,0,random(0,255),150);
  image(myImage2,random(0,1000),random(0,1000),random(0,500),random(0,500));
  
  tint(200,180,50,100);
  image(myImage3,random(0,200),random(200,800),random(0,450),random(0,800));
  fill(0,0,mouseX);
  tint(200,180,50,50);
  rect(random(0,1000),random(0,1000),random(0,70),random(0,70));
  line(random(0,500),random(500,1000),random(0,1000),random(0,500));
  image(myImage2,random(0,1000),random(0,1000),random(0,1000),random(0,1000));
  tint(random(0,200),0,random(0,50),random(0,50));
  rect(mouseX,mouseX,random(0,70),random(0,70));
}

