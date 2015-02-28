
ArrayList circles;

void setup(){
  size(1440, 855);
  circles = new ArrayList();
  colorMode(HSB, 100);
  noStroke();
  smooth();
}

void draw(){
  background(0);
  for(int i = circles.size() - 1; i >= 0; i--){
    GrowCircle now = (GrowCircle) circles.get(i);
    now.grow();
    if(now.a == 0){
      circles.remove(i);
    } else circles.set(i, now);
  }
  for(int i = 0; i < circles.size(); i++){
    GrowCircle now = (GrowCircle) circles.get(i);
    now.display();
  }
}

void mousePressed(){
  circles.add(new GrowCircle(color(random(100), 100, 100), mouseX, mouseY, .8));
}
class GrowCircle{
  int orgnx, orgny;
  float speed, prog, a = 100;
  color shade;
  
  GrowCircle(color shade, int orgnx, int orgny, float speed){
    this.orgnx = orgnx;
    this.orgny = orgny;
    this.shade = shade;
    this.speed = speed;
  }
  
  void grow(){
    prog += speed;
    a = max(a - .15, 0);
  }
  
  void display(){
   noStroke();
   ellipseMode(RADIUS);
   fill(shade, a);
   ellipse(orgnx, orgny, prog, prog);
  }
}


