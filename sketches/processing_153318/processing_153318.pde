
void setup(){
 
 size(800,600);
  noCursor();

  
}

void draw(){
  
 if(mousePressed){ 
  
  noStroke();
  fill(mouseX,255,mouseY);
  rect(mouseX,300,800,600);
  
  
 }else{   noStroke();
  fill(mouseY,mouseX,255);
  rect(mouseX,0,800,300);
  
  noStroke();
  fill(mouseX,mouseY,125);
  rect(mouseY,0,800,600);
   }}
