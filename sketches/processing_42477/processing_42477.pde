
PImage camaleonte1;
PImage camaleonte2;
PImage camaleonte3;
PImage camaleonte4;

float cam1 = 100;
float cam2 = 100;
float cam3 = 100;
float cam4 = 100;
float r = map(mouseX, mouseY,200, 5, 27);


void setup(){
  size(400, 400);
  
  camaleonte1 = loadImage("camaleonte1.jpg");
  camaleonte2 = loadImage("camaleonte2.jpg");
  camaleonte3 = loadImage("camaleonte3.jpg");
  camaleonte4 = loadImage("camaleonte4.jpg");
}

void draw(){
  
  if(mouseX <= 200 && mouseY <= 200){
    cam1 = cam1 + 1;
  }else{
    cam1 = 100;
  }
  if(mouseX > 200 && mouseY <= 200){
    cam2 = cam2 +1;
  }else{
    cam2 = 100;
  }
   if(mouseX <= 200 && mouseY > 200){
    cam3 = cam3 + 1;
  }else{
    cam3 = 100;
  }
   if(mouseX > 200 && mouseY > 200){
     cam4 = cam4 + 1;
  }else{
    cam4 = 100;
  }
  
  tint(cam3);
  image (camaleonte3, 0, 200);
  filter(GRAY);
  
  tint(cam4);
  image (camaleonte4, 200, 200);
  filter(POSTERIZE, r);
  
  tint(cam1);
  tint (mouseX,mouseY,100);
  image (camaleonte1, 0, 0);
  
  tint(cam2);
  image (camaleonte2, 200, 0);
  
  


 
  
}


