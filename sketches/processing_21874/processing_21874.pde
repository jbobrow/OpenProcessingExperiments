


void setup (){
size (800,600);
background (0);
}
void draw(){
 }
  void mousePressed() {
    for (int r=0; r<800; r=r+10){
  noStroke();
  fill(mouseY,20,mouseX);
  rectMode(CENTER);
rect(mouseX+r,mouseY,25,25);}
    
}
//void keyPressed () {
  //saveFrame ("dibu-####.png");}

