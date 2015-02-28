
void setup() {
  smooth();
  size(800,450);
  background(255);
 
}
int i=0;
 void mouseReleased() {
      background(255);
    }
void draw(){
  frameRate(20);
  int x=int(random(0,800));
  int y=int(random(0,450));
  int a=int(random(0,100));
  int b=int(random(0,100)); 
 
    if (mousePressed && (mouseButton==LEFT)) {
      background(255);
      String l = "Bienvenue sur mon portfolio.";
      fill(#57c0ea);
      textSize(25);
      text(l,350,225);
    }
    
       else {
    fill(#57c0ea);
    textSize(a);
    String h = "Bienvenue";
    text(h,x,y);
    
  }}
