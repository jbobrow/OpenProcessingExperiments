
void setup(){
size(500,500);
background(0);
smooth();}


void draw(){
  if(mousePressed){
    stroke(255);
    line(200,mouseY,mouseX,mouseY);}
    else{
      stroke(255,0,0);
      line(mouseY,mouseX,mouseY,mouseX);}
}


