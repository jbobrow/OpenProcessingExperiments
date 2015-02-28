
ArrayList<Particle> particles = new ArrayList<Particle>();
ArrayList<Point> points = new ArrayList<Point>();

int NUM = 3000;
float SPEED = 0.01;

int maxPoints = 0;

void setup(){
  size(400,300);
  background(0);
  textSize(140);
  text("Hello",20,200);
  
  for(int i=0;i<width; i++){
    for(int j=0;j<height;j++){
      if(brightness(get(i,j)) > 1){
        points.add(new Point(i,j));
      }
    }
  }
  
  maxPoints = points.size();
  
  for(int i=0; i<NUM; i++){
    particles.add(new Particle());
  }
  
  background(0);
}

void draw(){
  background(0);
  fill(255);
  noStroke();
  
  for(Particle p : particles){
    p.update();
  }
  
  for(Particle p : particles){
    p.draw();
  }
}

class Particle {
  Point start;
  Point end;
  float rate = 1;
  float speed;
  
  Particle(){
    start = points.get(int(random(maxPoints)));
    end = points.get(int(random(maxPoints)));
    rate = random(1);
    speed = random(SPEED) + 0.001;
  }
  
  void update(){
    if(rate>=1){
      start = end;
      end = points.get(int(random(maxPoints)));
      rate = 0;
    }else{
      rate += speed;
    }
  }
  
  void draw(){
    float br = brightness();
    fill( br*br*br*255 );
    rect( start.x*(1-rate) + end.x*(rate),
          start.y*(1-rate) + end.y*(rate), 2, 2);
  }
  
  float brightness(){
    return (cos(rate*TWO_PI)+1)*0.5;
  }
  
}

class Point {
  Point(float x, float y){
    this.x = x;
    this.y = y;
  }
  
  float x;
  float y;
}

