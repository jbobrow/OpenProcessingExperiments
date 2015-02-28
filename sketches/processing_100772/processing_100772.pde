
int timer=0;
float fX=200;
float fY=200;
float eX=220;
float eY=220;
float pX=305;
float pY=305;
float easing =.09;
color pColor=color(#F9FAF5);
 
void setup(){
  size(500, 500);
  frameRate(50);
  background(#430942);
  noStroke();

fill(#29ED1D);
triangle(18, 18, 18, 360, 81, 360);

fill(#6DC7F0);
rect(81, 81, 63, 63);

fill(#29ED1D);
quad(189, 18, 216, 18, 216, 360, 144, 360);

fill(#29ED1D);
triangle(288, 18, 351, 360, 288, 360); 

fill(#29ED1D);
triangle(288, 18, 351, 360, 288, 360); 

fill(#29ED1D);
quad(189, 18, 216, 18, 216, 360, 144, 360);

fill(#E9FA38);
arc(479, 300, 280, 280, PI, TWO_PI);

}
void draw(){
  food();
  player1();
  collisions();
}
void food() {
  //respawn
  timer++;
  if (timer >=28) {
    fX=random(width);
    fY=random(height);
    timer=0;
  }
  fill(#8211D3);
  rect(fX, fY, 30, 30);
}
 
void player1() {
  float targetX=mouseX;
  float targetY=mouseY;
  pX +=(targetX - pX)*easing;
  pY +=(targetY - pY)*easing;
  fill(pColor);
  rect(pX, pY, 45, 45);
}
void collisions() {
  float pDist=dist(pX, pY, fX, fY);
  if (pDist <=25) {
    pColor=color(#E50E97);
  }
  else{
    pColor=color(#F9FAF5);
  }
}
 
void bGround(){
for(int i = 0; i <= width; i += 50){
    for(int j = 0; j <= height; j += 50){
      fill(#9B0566);
      rect(i,j,50,50);
 }
} 
}


