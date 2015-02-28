
//"The Science Experiment"
//Valerie Nelkin
//Senior Honors Project 2010

int fishNum = 500;
Fish[] fish = new Fish[fishNum];
boolean mouseDown = false;
float sphereScale = 1;
color fishStroke = color(random(100),random(100),random(100));
color fishColor = color(random(255),random(255),random(255));

void setup(){
  size(800,600);
  background(30,50,150);
  smooth();
  for(int i=0; i<fishNum; i++){
    fish[i] = new Fish(random(width), random(height));
  }
}

void mousePressed(){
  mouseDown = true;

}
void mouseReleased(){
  mouseDown = false;
}
void addRipples() {
  
  if (mouseDown == true) {  
  for (int i =300; i>=0; i=i-20) {
      int r = (int)(100-(((i)/(300.0))*100));
      int g = (int)(200-(((i)/(300.0))*100));
      int b = (int)(200-(((i)/(300.0))*100));
      noFill();
      strokeWeight(20);
      stroke(r,g,b,50);
  
      ellipse(mouseX, mouseY, i*sphereScale,i*sphereScale); 
    }
  }
  if (mouseDown == false) {
  background(30,50,150);
  fill(fishColor);
  stroke(fishStroke);
  strokeWeight(1);
  }
    }


void draw(){
   background(30,50,150);
   addRipples();
  for(int i=0; i<fishNum; i++){
    fish[i].update();
  }
  for(int i = 0; i<fishNum-1; i++){
    for(int c = i+1; c<fishNum; c++){
      float d = dist(fish[i].x, fish[i].y, fish[c].x, fish[c].y)+1;
       if( d <= 15 ){
        fish[i].xv += .004*(fish[i].x - fish[c].x);
        fish[i].yv += .004*(fish[i].y - fish[c].y);
        fish[c].xv += .004*(fish[c].x - fish[i].x);
        fish[c].yv += .004*(fish[c].y - fish[i].y);
      }
      else if( d>50 && d <=80){
        fish[i].xv -= .000005*(fish[i].x - fish[c].x);
        fish[i].yv -= .000005*(fish[i].y - fish[c].y);
        fish[c].xv -= .000005*(fish[c].x - fish[i].x);
        fish[c].yv -= .000005*(fish[c].y - fish[i].y);
        fish[i].xv += ((fish[c].xv+fish[i].xv)/2-fish[i].xv)*.01;
        fish[i].yv += ((fish[c].yv+fish[i].yv)/2-fish[i].yv)*.01;
      }
      if(mouseDown){
         float d2 = dist(mouseX,mouseY, fish[i].x, fish[i].y);
         if(d2<100){
         fish[i].xv -= .002*(mouseX-fish[i].x)/d2;
         fish[i].yv -= .002*(mouseY-fish[i].y)/d2;
         }
      }
    }
  }
}

class Fish {
  float x,y;
  float xv = random(-1,1), yv = random(-1,1);
  float tailStep = 0, tailSpeed = random(2,3);
  float s = random(.05,.2);
   
  //Bezier points///////
  float sx = -90, sy = 0;
  float ax = -40, ay = 0;
  float bx = 5, by = 40;
  float cx = -40, cy = 0;
  float dx = 5, dy = -40;
  float ex = 10, ey = 0;
  float animOff = random(TWO_PI);
  ////////////////////////
  Fish(float x, float y){
    this.x = x;
    this.y = y;
    
  }

  void update(){
    this.tailStep += this.tailSpeed;
    this.xv += (  noise(  this.x*.01 + PI,this.y*.01, millis()*.00002  )*2-1  )*.3;
    this.yv += (  noise(  this.x*.01 - PI,this.y*.01, millis()*.00002  )*2-1  )*.3;
    this.xv = constrain(this.xv, -2,2);
    this.yv = constrain(this.yv, -2,2);
    this.x += this.xv;
    this.y += this.yv;
    drawFish();
    if(this.x<-10){
      this.x = width+10;
    }
    else if(this.x>width+10){
      this.x = -10;
    }
    if(this.y<-10){
      this.y = height+10;
    }
    else if(this.y>height+10){
      this.y = -10;
    }
  } 

  void drawFish(){
    sy = 30*sin( this.tailStep*.1 + this.animOff);
    pushMatrix();
    translate(this.x, this.y);
    scale(this.s,this.s);
    rotate( atan2(this.yv, this.xv) );
    bezier( this.sx,this.sy, this.ax,this.ay, this.bx,this.by, this.ex,this.ey );
    bezier( this.sx,this.sy, this.cx,this.cy, this.dx,this.dy, this.ex,this.ey );
   
    line( this.sx,this.sy, this.ex,this.ey);
    popMatrix();

  }

}



