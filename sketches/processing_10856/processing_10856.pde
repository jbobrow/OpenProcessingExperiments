
import java.awt.event.*;

PFont font;
int zbuf=0;

ArrayList particles = new ArrayList();

void setup(){
  background(0);
  size(400,400,P3D);
  colorMode(HSB, 255);
  
  this.addMouseWheelListener(new MouseWheel());
  
  font = createFont("Osaka", 24, true);
  textFont(font);
}

void draw(){
  lights();
  background(0);
  
  update();
  
  if(mousePressed){
    particles.add(new Particle(random(width) - width/2, 
                  random(height) -height/2, random(200) - 100,
                  random(50), color(random(255),255,255)));
  }
  
  int s = particles.size();
  for(int i=0; i<s; i++){
    Particle p = (Particle)particles.get(i);
    p.draw();
  }
  
  clickme();
}

void clickme(){
  pushMatrix();
  fill(255);
  text("Click me!", 0,0);
  popMatrix();
}

void update(){
  int s = particles.size();
  for(int i=0; i<s; i++){
    Particle p = (Particle)particles.get(i);
    p.update();
  }
  
  translate(width/2,height/2, zbuf);
  rotateX(map(mouseY,0,width,0,TWO_PI));
  rotateY(map(mouseX,0,width,0,TWO_PI));
}

void circle(float x, float y, float v){
  ellipse(x,y,v,v);
}

class Particle{
  float x;
  float y;
  float z;
  float v;
  color c;
  
  float angle;
  
  Particle(float _x, float _y, float _z, float _v, color _c){
    x = _x;
    y = _y;
    z = _z;
    v = _v;
    c = _c;
  }
  
  void update(){
    angle += random(TWO_PI/16.0) - TWO_PI/32.0;
  }
  
  void draw(){
    fill(c);
    noStroke();
    
    pushMatrix();
    rotateY(angle);
    translate(x,y,z);
    circle(0,0,v);
    popMatrix();
  }
}

class MouseWheel implements MouseWheelListener{
  void mouseWheelMoved(MouseWheelEvent e){
    zbuf -= e.getWheelRotation();
  }
}

