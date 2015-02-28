
/* @pjs preload="leg1.gif"; */
/* @pjs preload="leg2.gif"; */
/* @pjs preload="leg3.gif"; */
/* @pjs preload="trunk.gif"; */

var frameBody = document.getElementsByTagName("body")[0];
frameBody.style.background = "none";

var myDiv = parent.document.getElementById("appletAjaxContainer");
myDiv.style.opacity = "1";
myDiv.style.backgroundColor = "transparent";
myDiv.style.border = "0px";
myDiv.style.position        = "fixed";
myDiv.style.zIndex = "10";
myDiv.style.padding = "0px";

int W = parent.window.innerWidth;
int H = parent.window.innerHeight;


Bug bug;


void setup() {
  size(150,150);
  background(0);
  
  bug = new Bug(W/2, 100);
  bug2 = new Bug(W/2, 100);
}

void draw() {
  
  background(0);
  externals.context.clearRect(0,0,width,height);// part of the canvasAPI that creates a clear rect
  bug2.update();
  bug2.draw();
  bug.update();
  bug.draw();
  
}

class Bug {
  
  float x;
  float y;
  
  PImage legR1;
  PImage legR2;
  PImage legR3;
  PImage legL1;
  PImage legL2;
  PImage legL3;
  PImage trunk;
  
  float angle;
  float v;
  float legSpeed;
  
  boolean isWalking;
  
  Bug(int x, int y) {
    this.x = x;
    this.y = y;
    angle  = 0;
    v      = 200;
    legSpeed = 0.02;
    
    legR1 = loadImage("leg1.gif");
    legR2 = loadImage("leg2.gif");
    legR3 = loadImage("leg3.gif");
    legL1 = loadImage("leg1.gif");
    legL2 = loadImage("leg2.gif");
    legL3 = loadImage("leg3.gif");
    trunk = loadImage("trunk.gif");
    
    isWalking = true;
    
    PImage tmp;
    
  }
  
  void draw() {
    imageMode(CENTER);
    
    pushMatrix();
//    translate(x,y);
    translate(width/2, height/2);
    rotate(angle);
    
    scale(0.4);
    pushMatrix();
    image(trunk,  0, 0);
    popMatrix();
    
    pushMatrix();
    translate(30, -30);
    wRotate( 0.5*sin(millis()*legSpeed) + 0.5 );
    image(legR1, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(35, 25);
    wRotate( 0.5*sin(millis()*legSpeed-PI/2.0) -0.3 );
    image(legR2, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(45, 70);
    wRotate( 0.3*sin(millis()*legSpeed-PI) -0.3 );
    image(legR3, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(-30, -30);
    scale(-1,1);
    wRotate( -0.5*sin(millis()*legSpeed) + 0.5 );
    image(legL1, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(-35, 25);
    scale(-1,1);
    wRotate( -0.5*sin(millis()*legSpeed-PI/2.0) - 0.3 );
    image(legL2, 0, 0);
    popMatrix();
    
    pushMatrix();
    translate(-45, 70);
    scale(-1,1);
    wRotate( -0.3*sin(millis()*legSpeed-PI) - 0.3 );
    image(legL3, 0, 0);
    popMatrix();
    
    popMatrix();
    
//    myDiv.style.left = int(x)+"px";
//    myDiv.style.top  = int(y)+"px";

    myDiv.style.left = int(x)+"px";
    myDiv.style.top  = int(y)+"px";

    fill(0);
//    text(x, 100,100);
//    text(y, 100,130);
  }
  
  void update() {
    
    if(isWalking && random(1)>0.98) {
      isWalking=false;
    }
    
    if(!isWalking && random(1)>0.94) {
      isWalking=true;
    }
    
    if(isWalking && random(1)>0.95) {
      angle += random(-0.3, 0.3);
    }
    
    if(isWalking) {
      x +=  v*sin(angle)/frameRate;
      y += -v*cos(angle)/frameRate;
    }
    
    /*
    if(x>W) {
      x=0-width;
    }
    if(y>H) {
      y=0-height;
    }
    if(x<0-width) {
      x=W;
    }
    if(y<0-height) {
      y=H;
    }
    */
    
    if(x>W-width || y>H-height || x<0 || y<0) {
      x += -v*sin(angle)/frameRate;
      y += +v*cos(angle)/frameRate;
      angle +=  sign(millis()  %  4000-2000) * random(0, 0.3);
    }
    
  }
  
  void wRotate(float a) {
    if(isWalking) rotate(a);
  }
  
  int sign(float n) {
    int ans = 0;
    if(n<0) ans = -1;
    if(n>0) ans =  1;
    return ans;
  }
  
  
}
