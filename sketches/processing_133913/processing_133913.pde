

void setup(){
size(500,500);
strokeWeight(4);
stroke(255,0,0);
}
void draw(){
  background(64,53,131);
  stroke(53,123,131);
line(0,0,mouseX,mouseY);
stroke(53,61,209);
line(width,0,mouseX,mouseY);
stroke(255,255,255);
line(width/2,height,mouseX, mouseY);

}
