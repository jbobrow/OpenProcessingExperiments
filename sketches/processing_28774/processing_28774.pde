
class Circle{
  float x;
  float y;
  
  float vx;
  float vy;
  
  float ax = 0.0;
  float ay = 0.1;
  
  float radius;
  
  boolean fade = true;
  float fadeRatio = 50;
  
  int birth;
  int life = 180;
  boolean exist = true;
  
  color c;
  
  Circle(float x,float y){
    this.x = x;
    this.y = y;
    this.vx = random(-2.0,2.0);
    this.vy = random(-4.5,-3.5);
    this.radius = random(5,20);
    this.birth = frameCount;
    this.c = color(random(255),random(255),random(255),255);
  }
  
  void reload(){
    if(fade){
      this.c  = color(red(c)-(red(c)-red(bgColor))/this.fadeRatio,
                      green(c)-(green(c)-green(bgColor))/this.fadeRatio,
                      blue(c)-(blue(c)-blue(bgColor))/this.fadeRatio,
                      alpha(c)-(alpha(c)-alpha(bgColor))/this.fadeRatio);
      if(frameCount-this.birth > this.life){
        this.exist = false;
      }
    }
    this.vx += this.ax;
    this.vy += this.ay;
    this.x += this.vx;
    this.y += this.vy;
  }
  
  void draw(){
    noStroke();
    fill(this.c);
    ellipse(this.x,this.y,this.radius,this.radius);
  }
}

