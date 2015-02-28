
ArrayList clips = new ArrayList();
Paddle paddleMan;
Paddle paddleCpu;
Ball ball;

Boolean fullscreen = false;

void setup() {
  if(fullscreen){
    size(screenWidth,screenHeight);
  } else {
    size(550,400);
  }
  rectMode(CENTER);
  strokeCap(SQUARE);
  
  paddleCpu = new Paddle();
  paddleCpu.z = 5;
  ball = new Ball();
  paddleMan = new Paddle();
  paddleMan.human = true;
}

void draw() {
  background(0);
  
  //Draw arena
  noFill();
  stroke(128);
  strokeWeight(10/5);
  rect(width/2,height/2,(width-ball.trackerWidth/2)/5,(height-ball.trackerWidth/2)/5);
  
  //update everything else
  for(int i = 0; i < clips.size(); i++){
    Clip clip = (Clip) clips.get(i);
    clip.update();
  }
}

class Clip {
  public float x = 0;
  public float y = 0;
  public float z = 1;
  public float scale = 1;
  public float w = 0;
  public float h = 0;
  
   Clip(){
     clips.add(this);
   }
   
   protected void update(){
   }
}

class Paddle extends Clip {
  public boolean human;
  public int score = 0;
  public float alpha = 200;
  public float lag = 10;
  
  public float pX = 0;
  public float pY = 0;
  
  Paddle(){
    w = 200;
    h = 150;
  }
  
  void update(){
    pX = x;
    pY = y;
    if(human){
      x = mouseX-width/2;
      y = mouseY-height/2;
    } else {
      x += (ball.x-x)/lag;
      y += (ball.y-y)/lag;
    }
    x = min(width/2-w/2-ball.trackerWidth/2,x);
    x = max(-width/2+w/2+ball.trackerWidth/2,x);
    y = min(height/2-h/2-ball.trackerWidth/2,y);
    y = max(-height/2+h/2+ball.trackerWidth/2,y);
    
    alpha += (20-alpha)/10;
    
    draw();
  }
  
  void draw(){
    noStroke();
    fill(255,255,255,alpha);
    rect(width/2+(x/z),height/2+(y/z),w/z,h/z);
    float ts = h/2/z;
    fill(255,255,255,(alpha-20)*2);
    textSize(ts);
    text(score,width/2+x/z-ts/2,height/2+y/z+ts/2);
  }
}

class Ball extends Clip {
  protected ArrayList trail = new ArrayList();
  
  public float xSpeed = 5;
  public float ySpeed = 3;
  public float zSpeed = 0.03;
  
  public float trackerWidth = 10;
  
  public float xCurve = 0;
  public float yCurve = 0;
  
  public float xWall = width/2;
  public float yWall = height/2;
  public float zWall = 5;
  
  public color col = color(255,255,255);
  
  public float bounce = 1.01;
  
  Ball() {
    z = 1;
    w = 100;
    h = 100;
    x = 0;
    y = 0;
  }
  
  protected void update(){
    z += zSpeed;
    y += ySpeed;
    x += xSpeed;
    
    xSpeed += xCurve;
    ySpeed += yCurve;
    
    xSpeed *= 0.99;
    ySpeed *= 0.99;
    xCurve *= 0.99;
    yCurve *= 0.99;
    
    if(z>zWall){
      z = zWall;
      zSpeed = -abs(zSpeed)*bounce;
      bounce(paddleCpu);
    }
    if(z<1){
      z = 1;
      zSpeed = abs(zSpeed)*bounce;
      bounce(paddleMan);
    }
    if(x>xWall-w/2-trackerWidth/2){
      x = xWall-w/2-trackerWidth/2;
      xSpeed = -abs(xSpeed)*1;
    } 
    if(x<-xWall+w/2+trackerWidth/2){
      x = -xWall+w/2+trackerWidth/2;
      xSpeed = abs(xSpeed)*1;
    }  
    if(y<-yWall+h/2+trackerWidth/2){
      y = -yWall+w/2+trackerWidth/2;
      ySpeed = abs(ySpeed)*1;
    }  
    if(y>yWall-h/2-trackerWidth/2){
      y = yWall-h/2-trackerWidth/2;
      ySpeed = -abs(ySpeed)*1;
    }  
    draw();
  }
  
  private void draw(){
    //Draw Trail
    for(int i = 0; i < 10; i++){
    }
    
    //Draw Ball
    noStroke();
    fill(col);
    ellipse(width/2+(x/z),height/2+(y/z),w/z,h/z);
    
    //Draw Tracker
    noFill();
    stroke(col);
    strokeWeight(trackerWidth/z);
    rect(width/2,height/2,(xWall*2+w/2-trackerWidth/2)/z,(yWall*2+h/2-trackerWidth/2)/z);
  }
  
  private void bounce(Paddle paddle){
    if(x>paddle.x-paddle.w/2 && x<paddle.x+paddle.w/2 && y<paddle.y+paddle.h/2 && y>paddle.y-paddle.h/2){
      paddle.alpha = 200;
      xCurve += -(paddle.x-paddle.pX)/17;
      yCurve += -(paddle.y-paddle.pY)/17;
      xSpeed += -(paddle.x - x)/17;
      ySpeed += -(paddle.y - y)/17;
    } else {
      paddle.alpha = 0;
      if(paddle == paddleMan){
        paddleCpu.score++;
      } else {
        paddleMan.score++; 
      }
    }
  }
}

