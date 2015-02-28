
float x1;
float y1;
void setup (){
  size (800,400);
frameRate (15);
}



void draw (){
 
x1= random(800);
y1= random(400);
  bezier(random(800), random (400),5,25,125,25,180,100);
  
}
