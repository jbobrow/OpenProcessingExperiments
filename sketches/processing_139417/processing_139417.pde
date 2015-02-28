
int x;
int y;
int a;
int b;
PShape s;
PShape j;
PShape k;
PShape l;
PShape m;

void setup(){
 size(600,400,P2D);
  background(255,255,255);
  frameRate(10); 
  s = loadShape("cog.svg");
  j = loadShape("cog2.svg");
}
void draw(){

  if (mousePressed) {
    
    
    if (mouseX != pmouseX){
      a = int(random(600));
      b = int(random(400));
      j.setFill(color(random(255),random(255),random(255),random(100)));  
      shape(j, a,b,40,40);
    }else{
      x = mouseX;
      y = mouseY;
      s.setFill(color(random(100)));  
      s.rotate(TWO_PI / 16);
      shape(s, x,y,40,40);
    }
      
  }
  
  x = int(random(600));
  y = int(random(400));
  noStroke();

}






