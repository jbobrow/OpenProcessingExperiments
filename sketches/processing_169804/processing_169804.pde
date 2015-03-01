
PImage img;
PImage img1;
PImage circle;
float x=10;
float y=15;
float speed= 2;
float up=4;

void setup() {
  size(500,500);
  img= loadImage("http://png-4.findicons.com/files/icons/1609/ose_png/256/globe.png");
  img1= loadImage("http://upload.wikimedia.org/wikipedia/commons/7/76/Mozilla_Nightly_icon_2011.png");
  circle= loadImage("http://www.wikiprogress.org/images//Icon_World.png");
  
}

void draw() {
  int imgwidth= img.width;
  int imgheight= img.height;
  background(200);
  
  imageMode(CENTER);
  image(circle,x,y,imgwidth/3, imgheight/3);
  x= x+speed;
  y= y+up;
 
 
 
  if (y>height -5){
    up=-2;
  }  
  if (y<5){
    up=2;
    
  } 
 if (x > height -5) {
    speed= -2;
  }
  
  if(x<5){
    speed=2;
  }
  
  
  if (mousePressed){
  if(x> mouseX-1){//rechte oder linke Grenze
      speed=speed*-2;
    
  }  
  if (y> mouseY-1){
    up=up*-2;
  }
    if (y>height -1){
    up=-2;
  }  
  if (y<1){
    up=2;
    
  } 
 if (x > height -1) {
    speed= -2;
  }
  
  if(x<1){
    speed=2;
  }
  }  

    
  image(img,mouseX, mouseY, imgwidth/3, imgheight/3);
  
  if(mousePressed){
  image(img1, mouseX,mouseY, imgwidth/3, imgheight/3);
  }
  
}
