
float x1;
float y1;
void setup (){
  size (800,400);
frameRate (1);
}



void draw (){
 background (255);
x1= random(800);
y1= random(400);
  bezier(x1,y1,x1+20,y1+random(-100,100),x1+60,y1+random(-100,100),x1+80,y1);


}
