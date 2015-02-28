
void setup() {
size(200,400);
noCursor();
background(255);
 
}
 
void draw() {
  //background(200);
   
  if(mousePressed){
    stroke(1.0);
    fill(0);
    rect(130,280,30,80);
  }else{
    fill(255);
    line(mouseX,130,mouseX,360);
  }
  //line(pmouseX,pmouseY,mouseX,mouseY);
   
}
