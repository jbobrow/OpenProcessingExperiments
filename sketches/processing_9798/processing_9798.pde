
int w=40,h=4;
int time=0;
Particle[][] boxes = new Particle[w][h];

void setup(){
  size(800,400,P3D);
  background(255);
  rectMode(CENTER);
  colorMode(HSB,255);
  for(int x=0; x<w; x++){
    for(int y=0; y<h; y++){
      boxes[x][y] = new Particle(x*(width/w)+width/(2*w),y*(height/h)+height/(2*h),width/w,height/h);
    }
  }

  noStroke();

}

void draw(){
  background(255);

  time++;
  for(int x=0; x<w; x++){
    for(int y=0; y<h; y++){
      boxes[x][y].update();
    }
  }

}

/*void keyPressed(){
  saveFrame("Panels####.png");
}*/

class Particle {
  float x,y,z, w,h;
  float pit=0, yaw=0, roll=0;
  color c = color(random(30,60),255,random(255,255));
  Particle(float x, float y,float w, float h){
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
  }

  void update(){
    fill(this.c);
    this.pit = (noise(this.x*.002+time*.01, this.y*1)*1)*TWO_PI;

    pushMatrix();
    translate(this.x,this.y,this.z);
    rotateX(this.pit);
    rotateY(this.yaw);
    rotateZ(this.roll);
    rect(0,0, this.w,this.h);
    popMatrix();
  } 
}










