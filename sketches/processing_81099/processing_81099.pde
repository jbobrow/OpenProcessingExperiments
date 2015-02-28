

void setup(){
  size(400,400);
  background(0,0,0);}
void keyPressed(){
  if (key == CODED){
    if (keyCode == UP){
      frameRate(75);
      fill(250,7,215);
     ellipse(pmouseX,pmouseY,20,20);
  ellipse(width-pmouseX,pmouseY,20,20);}
    if (keyCode == DOWN){
      frameRate(50);
      fill(7,82,229);
    ellipse(pmouseX,pmouseY,20,20);
  ellipse(width-pmouseX,pmouseY,20,20);}
    if (keyCode == LEFT){
      frameRate(50);
      fill(229,7,11);
    ellipse(pmouseX,pmouseY,20,20);
  ellipse(width-pmouseX,pmouseY,20,20);}
    if (keyCode == RIGHT){
      frameRate(50);
      fill(9,229,7);
    ellipse(pmouseX,pmouseY,20,20);
  ellipse(width-pmouseX,pmouseY,20,20);}
    if (keyCode == ALT){
      frameRate(50);
      rect(pmouseX,pmouseY,20,20);
      rect(width-pmouseX,width-pmouseY,20,20);}}
    if (keyCode == SHIFT){
      frameRate(5);
        int z= int(random(250));
int s= int(random(250));
int y= int(random(250));
int d= int(random(250));
      background(z,s,y,d);}}
      
void draw(){

  keyPressed();}
 
  



