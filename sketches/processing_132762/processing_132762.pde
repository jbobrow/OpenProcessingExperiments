

ArrayList<Dust> dusts;
color dustColor;
float r;

float dim;

void setup(){
  size(500, 500);
  dusts = new ArrayList<Dust>();
  r=0;
  dim = width/3;
}

void draw(){
  background(0);
  
  // mouse control
  //if (mouseX > width-100 && mouseY < 100) {
  
  // auto
  if (frameCount%250>200 || frameCount%600<200 || frameCount%444>423) {
    if (random(1)>0.9)
      r = random(8,10);
    else
      r = random(1,5);
      
    dusts.add(new Dust(random(100, width-100), random(-10, -50), r));
  }
  
  if (dusts.size() != 0) {
    for(int i=0; i<dusts.size(); i++) {
      Dust d = dusts.get(i);
      d.display();
      d.update();
      d.wind();
      if (d.loc.y > random((height - height/2), height)) {
        d.fade = true;
      }
      
      if (dusts.size()>400)
        dusts.remove(i);
    }
    
  }
  

  println(dusts.size());
  
  // show frame rate
//  fill(250);
//  text(int(frameRate), 20, 20);

}

class Dust {
  PVector loc;
  float radius;
  float speedX, speedY;
  float speedS, speedChange;
  int r;
  int g;
  int b;
  int alpha;
  int time;
  boolean fade;
  
  Dust(float _x, float _y, float _r){
    loc = new PVector(_x, _y);
    radius = _r;
    r = 255;
    g = 253;
    b = 196;
    alpha = (int)(255/radius+80);
    
    speedX = random(radius*-0.08, radius*0.08);
    speedY = random(2/(radius/2)+0.1);
    speedS = 0;
    //speedChange = .1;
    speedChange = .2/radius;
    time = (int)random(150);
    fade = false;
  }
  
  void display() {
    
    noStroke();
    fill(r, g, b, alpha);
    
    pushStyle();
    if (fade) {
      alpha = (int)lerp(alpha, 0, 0.01);
    } else {
      alpha = (int)(((255/radius+80))/2 + ((255/radius+100))/2*sin(speedS));
    }
    
    ellipse(loc.x, loc.y, radius, radius);
    if (radius > 8) {
      fill(50, 150);
      ellipse(loc.x, loc.y, radius-3, radius-3);
    }
    popStyle();

  }
  
  void update() {
    loc.x += speedX;
    loc.y += speedY;
    speedS += speedChange;
    //dustColor *= (sin(speedS));
  }
  
  
  void wind() {
    
    if (frameCount%(300-time) > 250-time){
      speedX += random(0.01);
      speedY += random(0.005);
    }
    else {
      speedX -= random(0.005);
      speedY -= random(0.001);
    }
  }
  
  
}


