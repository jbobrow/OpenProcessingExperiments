
import seltar.motion.*;

int cant = 10000;
Motion [] m = new Motion [cant];
PVector [] p = new PVector [cant];
float d;
void setup () {
  size (950,450);
    
  
  frameRate(160);
  noFill();
  
  for(int i = 0; i < cant; i++){
    
    m[i] = new Motion(random(width),random(height));
    m[i].setConstant(10);
    p[i] = new PVector(m[i].getX(),m[i].getY());
  }
}

void draw (){
  background(10);
  for(int i = 0; i < cant; i++){
    m[i].followTo(mouseX,mouseY);
    //m[i].springTo(mouseX,mouseY);
    float dista = random(random(400));
    if(p[i].dist(new PVector(mouseX,mouseY)) <= dista) {
      m[i].move();
      
      p[i].x = m[i].getX();
      p[i].y = m[i].getY();
      if(p[i].dist(new PVector(mouseX,mouseY)) <= 20) {
        m[i].setX(random(width));
        m[i].setY(random(height));
      }
    }
    d = p[i].dist(new PVector(mouseX,mouseY))*0.005;
    if (d > 1){
      d = 1;
    }
    //println(d);
    stroke(lerpColor(#FF00EF,#00DBFF,d));
    point(m[i].getX(),m[i].getY());
      
}
}

