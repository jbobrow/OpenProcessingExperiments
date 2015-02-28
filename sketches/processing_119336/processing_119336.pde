
import java.util.*;
void setup() {
  size(800,800); 
  background(0);
  frameRate(60);
}

class piece {
  float x,y,tx,ty;
  float oldx,oldy;
  float n;
  void drawthis() {
    
    fill(color(250,120,30,50));
    ellipse(oldx,oldy,10,10);
    ellipse(tx,ty,20,20);
    
    noStroke();
    fill(color(250,120,30,50));
    ellipse(x,y,5+abs(sin(n/50))*20,5+abs(sin(n/50))*20);

    
  }
  
  void update(float ms) {
    
    x = lerp(oldx,tx,n/1000);
    y = lerp(oldy,ty,n/1000);
    //n+=n>0?((n/10)>50?50:n/10):1;
    n = max(n+1+(1000-n)/30,1);
    //n = max(n+1+max(500-n,n)/100,1);
    //n = max(n+abs(sin(n))*10,1);
    if (n >= 1000) {
      oldx = tx;
      oldy = ty;
      tx = int(random(width));//mouseX;
      ty = int(random(height));//mouseY;
      n = 0;
    }
  }
  piece(int nx,int ny, int ntx, int nty) {
    x = nx; y = ny; tx = ntx; ty = nty;oldx = nx; oldy = ny; 
  }
  
}
piece example = new piece(50,50,500,500);

void draw() {
  //background(0);
  fill(0,5);
  rect(0,0,width,height);
  example.drawthis();
  example.update(1000/frameRate);
}
