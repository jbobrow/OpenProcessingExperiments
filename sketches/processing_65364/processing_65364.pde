
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/65340*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
void setup() {
  setup2 ();
  setup3 ();
  frameRate(100);
  size(600,600);


}
int mySeconds;
int x;
int y;
int z;
int a;
int b;
int youLost;
void draw() {
background(123456);
  mySeconds=millis()/1000;
  textSize(24);
  text(""+mySeconds,20,20);
  if (mySeconds>=20) {
    b=b+6;}
  if (mySeconds>=40) {
    b=b+7;
  }  
  if (youLost==1) {
    textSize(96);
    text("YOU LOST", 20,200);
    noLoop();
    return;
    
  }
  fill(0,0,255);
    b=height-50;
  myTriangle(a,b);
  draw2();
  draw3();
}
void keyPressed() {
    if (keyCode == UP) {
      b=(b-5);
    }
    if (keyCode == DOWN) {
      b=(b+5);
    }
     if (keyCode == LEFT) {
      a=(a-5); 
     }
     if (keyCode == RIGHT) {
     a=(a+5);
     }
}
  

