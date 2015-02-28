
float diameter=50;
int r=50;
int g=30;
int b=60;
void setup(){
  size(400,400);}
void draw(){}
void mouseDragged(){
  fill(r,g,b,100);
  ellipse(mouseX,mouseY,diameter,diameter);
  ellipse(400-mouseX,400-mouseY,diameter,diameter);}
  
void keyPressed(){
  if(key=='r'){
    r=r+10;
    }
  if(key=='g'){
    g=g+10;}
  if(key=='b'){
    b=b+10;}
}
  


