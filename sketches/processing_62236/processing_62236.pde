

PImage img;
PImage img1;
int grenze = 489;

void setup(){
  noCursor();
  size(300,300);

  img= loadImage ("regenbogen21.jpg");
  img1= loadImage ("friend_bear.gif");
}

void draw(){
  
  tint(255,0,0);

  image(img,0,0, width,height);
  
if(mousePressed){
  noTint();
   image(img,0,0, width,height);
  
  
}
   tint(0,255,0);
  image (img,width/2,0,width,height);
  
  if(mousePressed){
    tint(100,0,255);
    image(img,width/2,0,width,height);
  
}   
  
  tint(255,0,255);
  image (img,0,height/2,width,height);
  
  
  if(mousePressed){
    tint(200,9,100);
    image(img,0,height/2,width,height);
  
}   
  
  if (mouseX >= grenze) {
    image(img1, 500, 105);
  }
  else {
    image(img, 500, 105);
  }
  
  noTint();
   image(img,width/2, height/2, width, height);
   
if(mousePressed){
     tint(255,0,0);
   image(img,width/2, height/2, width, height);
  
  
}   

  if (mousePressed) {
    noTint();
    image(img1, mouseX,mouseY);
  }
  
   
}
  
  
 
  

