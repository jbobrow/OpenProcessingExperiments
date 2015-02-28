
void setup(){
  size(500,500, P3D);
background(255);
}
void draw(){
  line(mouseX,250,mouseY,250);
line(mouseX,0, mouseY,250);
fill(0);
rect(250,50,249,50);
fill(255,24,34);
rect(250,50,250,2);
translate(250,250,1);
fill(mouseX,50,mouseY);
box(50);

}
