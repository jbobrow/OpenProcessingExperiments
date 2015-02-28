
void setup(){
  size(500,500);
  smooth();
  noStroke();}
  
  void draw(){
//ellipse follow the mouse 
background(200,70);
fill(0);
ellipse(mouseX,mouseY,30,30);

//if mouse pressed create a new composition    
if(mousePressed){
  background(0,70);
  stroke(255);
//create line distant 50px each other  
  for(int i = 0; i <= 500; i = i+50){
    for(int j=0;j <= height;j=j+50){
  line(i,j,mouseX,mouseY);}}  }
  }

