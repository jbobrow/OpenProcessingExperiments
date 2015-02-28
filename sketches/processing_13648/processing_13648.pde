
float y=200;
void setup(){
  size(400,400);
}
void draw(){
  line(50,50,mouseX,mouseY);
  ellipse(300,y,10,10);
  y=y+0.8;
}             
                
