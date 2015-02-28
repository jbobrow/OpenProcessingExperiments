
class Ball{
  
  
  int diam = 3;
  int h = diam;
  int w = diam;
  float x = mouseX;
  float y = mouseY;
  float gravity = random(-0.002, 0.002);
  float bottomPoint = height - (diam/2);
  float sideRight = width + (diam/2);
  float sideLeft = 0 - (diam/2);
  float topPoint = 0 - (diam/2);
  float velY = random(-2, 2);
  float velX = random(-3, 3);
  
  
    
  
  AudioOutput out;
  AudioPlayer soundplayD;
  AudioPlayer soundplayE;
  AudioPlayer soundplayF;
  AudioPlayer soundplayFsharp;
  AudioPlayer soundplayG;
  AudioPlayer soundplayA;
  AudioPlayer soundplayBflat;
  
  
  Ball(){
    soundplayD = m.loadFile("Sound sample D.wav");
    soundplayE = m.loadFile("Sound sample E.wav");
    soundplayF = m.loadFile("Sound sample F.wav");
    soundplayFsharp = m.loadFile("Sound sample F sharp.wav");
    soundplayG = m.loadFile("Sound sample G.wav");
    soundplayA = m.loadFile("Sound sample A.wav");
    soundplayBflat = m.loadFile("Sound sample B flat.wav");
  
    
  }
    
  
  
  void drawBall(){
    
    if(y > sideLeft && !soundplayD.isPlaying() && this.x < width*(1/7.0)){
      soundplayD.loop(0);
    }
    
    if(y > bottomPoint && !soundplayE.isPlaying() && this.x > width*(1/7.0) && this.x < width*(2/7.0)){
      soundplayE.loop(0);
    }
    
    if(y > sideRight && !soundplayF.isPlaying() && this.x > height*(2/7.0) && this.x < height*(3/7.0)) {
      soundplayF.loop(0);
    }
    
    if (y > bottomPoint && !soundplayFsharp.isPlaying() && this.x > width*(3/7.0) && this.x < width*(4/7.0)) {
      soundplayFsharp.loop(0);
    }
    
    if (y > topPoint && !soundplayG.isPlaying() && x > height*(6/7.0) && x < height*(7/7.0)) {
      soundplayG.loop(0);
    }
    
    if (y > sideLeft && !soundplayA.isPlaying() && x > height*(1/7.0) && x < height*(2/7.0)) {
      soundplayA.loop(0);
    }
    
    if (y > bottomPoint && !soundplayBflat.isPlaying() && x > width*(1/7.0) && x < width) {
      soundplayBflat.loop(0);
    }
    
    
    fill(random(100, 230));
    noStroke();
    ellipse(x, y, diam, diam);
    velY = velY + gravity;
    y = y + velY;
    x = x + velX;
    
    if(y > height){
      velY =- velY/1.1;
      y = height;
    }
    if(x > width){
      velX =- velX/1.1;
      x = width;
    }
    
  }
}
  
    

  

