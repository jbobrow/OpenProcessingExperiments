

void setup(){
size (600,600);
background (255,129,238);
noStroke();
frameRate (30);
}
 
void draw(){
  int r = 40;
  
 //circles everywhere
for(int y = 0; y < mouseX; y = y+20) {
  fill(100,200,50);
  for (int x = 0; x <mouseY; x = x+20){ 
    //fill(random(100,200),0,50);
  ellipse (x-25, y-25, (mouseY/50)*cos(x), (mouseX/25)*cos(mouseY));
}} 
//bottom right squares
 fill (mouseX/2,mouseY*1/3,100);
for (int y=0; y < 280; y = y +50) {
  for (int x=300; x < 600; x = x +50) {
    rect (x,y,40,40);
  }}

}
void mousePressed() {
 fill (mouseX/2,mouseY*1/3,100);
for (int y=300; y < 600; y = y +50) {
  for (int x=300; x < 600; x = x +50) {
    rect (x,y,40,40);
  }}
  
} 

