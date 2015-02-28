
//COLLAGE ENGINE
//VIIRJ.COM, 2013

    

PImage a;
PImage b;
PImage c;
PImage d;
PImage e;
PImage f;
PImage g;  
PImage h;
 


void setup(){
  size(600,600);
  a = loadImage("7.JPG");
  b = loadImage("4.JPG");
  c = loadImage("1.JPG");
  d = loadImage("2.JPG");
  e = loadImage("mhY0ll2.jpg");
  f = loadImage("251.jpg");
  g = loadImage("002-dirty-grunge-texture.jpg");
  h = loadImage("1-01.png");
 
 
    frameRate(1);
    imageMode(CENTER);
 
}

void draw(){
  background(0);
   float x= random (width);  
  float y= random (height);
  float z= random (100,300);
 
  
    
    
 //image(a,mouseX,mouseY,200,200);
 tint(x, y,z,200);
  //image(d,width/2,height/2,800,800);
 
  image(b, x,y,500,500);
      image(a,y,z,400,400);
    image(b,x,z,300,300);
    image(a,y,z,200,200);
    image(a, y,y,600,600);
    image(b,z,z,700,700);
    image(f,x,x,800,800);
    image(g,z,x,400,400);

     tint(x, z);
  image(c,z,z,900,900);
   image(d,width/2,height/2,900,900);
  tint(255,50);
  image(e,z,z,200,200);
 // image(f,width/2,height/2,400,400);
   tint(255,30);
 //     image(h,width/2,height/2,900,900);
      
 
}



   
 
  


