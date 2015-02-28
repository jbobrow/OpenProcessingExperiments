
//codigo que so corre uma vez
void setup()
{
  size (400,400);
  background(255);
  smooth();
  
}

void draw()
{
if(mousePressed){ 
  
  if (keyPressed){
   if (key == ' '){
     saveFrame("line-####.jpg");
     background(255);
     } 
 } 
 if (keyPressed){
   if (key == 'r'){
     stroke(255,0,0);
     } 
 } 
 if (keyPressed){
   if (key == 'b'){
     stroke(0);
     } 
 } 
  float r = map(mouseY,0,height,255,0);
  stroke(r,0,0); 
  fill(255,255,0);
  //line(pmouseX, pmouseY,mouseX,mouseY);
  line(pmouseX, pmouseY,mouseX+10,mouseY+r);
}
}


