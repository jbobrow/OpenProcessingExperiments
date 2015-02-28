
Maxim maxi;
AudioPlayer player;
boolean buttonOn; 

float xc = random(50,450);
float yc = random(50,150);
float wc = 30;
float hc = 30;

float xr = 0;
float yr = 290;
float wr = 100;
float hr = 10;
  
float speedX = random(0.5,2);
float speedY = random(0.5,2); 
  
void setup() {
  
  size(500, 300);
  background(0, 0, 0);
  smooth();
  ellipseMode(CORNER);  
  maxi = new Maxim(this);
  player = maxi.loadFile("ping.wav");
  player.setLooping(false);
  
  
}
  
void draw() {
    
  background(0, 0, 0);
  
  ellipse(xc, yc, wc, hc);
  fill(random(0,255), 100, random(0,255));
  if(buttonOn){
    xc = xc + speedX;
    yc = yc + speedY;
  
    if ((xc > width - wc) || (xc <= 0)) {
      speedX = -speedX;
      player.cue(0);
      player.play();
      background(0, 0, 255);
      fill(255,0,255);
    }
  
    if (((yc > height - hc - 10) && xc <= mouseX + 50 && xc >= mouseX-60)||(yc <= 0)) { 
        speedY = -speedY;
        player.cue(0);
        player.play();
        fill(255,0,255);
        background(0, 0, 255);      
    }else if(yc > height){
       buttonOn = false;
       xc = random(50,450);
       yc = random(50,150);
       speedX = random(0.5,2);
       speedY = random(0.5,2); 
    }
  }
  rect(xr,yr,wr,hr);
  fill(255,255,255);
}

void mousePressed() {
  buttonOn = true;
}

void mouseDragged()
{
  xr = mouseX - 50;
}



