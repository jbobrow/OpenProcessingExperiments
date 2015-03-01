
color blue = color(0,0,256);
int sk = 50;
void setup() {
size(400,400);
background(blue);

}
void draw() {
rectMode(CENTER);
ellipseMode(CENTER);

stroke(0);

fill(mouseX,mouseY,0);

rect(00,00,sk,sk);
rect(400,00,sk,sk);



}
void mouseClicked(){
  float rr = random(0,256);
  float rg = random(0,256);
  float rb = random(0,256);
  color litur = color(rr,rg,rb);
  fill(litur);
  if (mouseX < width/2) {
  rect(mouseX,mouseY,50,50);
  } else { 
    ellipse(mouseX, mouseY, 50, 50);
  }
}

