
Star[] stars;
float last;

int NUM_STARS = 200;

class Star{
  PVector pos;
  PVector vel;
  float age;
  
  Star(){
    init();
  }

  void init(){
    age = 0.0f;
    pos = new PVector(random(-width,width),random(-height,height));

    vel = new PVector(pos.x, pos.y);
    vel.normalize();    
    vel.mult(random(10,100));
  }
  
  void update(float delta){
    age += delta;
    
    pos.x += vel.x * delta;
    pos.y += vel.y * delta;
    
    if(abs(pos.x) > width/2.0f || abs(pos.y) > height/2){
      init();
    }
  }
  
  void render(){
    stroke(max(20 + age * 100.0f, 0));
    //point(pos.x, pos.y);
    float fx = vel.x / 10.0f;
    float fy = vel.y / 10.0;
    line(pos.x, pos.y, pos.x - fx, pos.y - fy );    
  }
}

void setup(){
  size(650,400);
  stars = new Star[NUM_STARS];
  for(int i = 0; i < NUM_STARS; i++){
    stars[i] = new Star();
  }
}

void draw(){
  pushMatrix();
  fill(0,20);
  rect(-1,-1,width+2,height+2);
  
  Star s;
  
  translate(width/2, height/2);
  
  float delta = (millis() - last)/1000.0f;
  for(int i = 0; i < NUM_STARS; i++){
    s = stars[i];
    s.update(delta);
    s.render();
  }
  last = millis();
  popMatrix();
}

