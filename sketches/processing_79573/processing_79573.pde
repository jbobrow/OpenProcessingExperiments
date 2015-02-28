
int count = 180;
int score=1500;
int lost = 0;
int wins = 0;
PImage willy;
PImage win;
PImage backG;
float makeDeath=1;
float death=1;
int humans=count;
float[] xpos;
float[] ypos;
float[] speedX;
float[] speedY;
float[] rad;
  
void setup(){
  
  size(800, 600);
  backG = loadImage("Background.jpg");
  willy = loadImage("willy.jpg");
  win = loadImage("win.jpg");
  smooth();
  noCursor();
  
  xpos = new float[count];
  ypos = new float[count];
  speedX = new float[count];
  speedY = new float[count];
  rad = new float[count];
  
  int n = 0;
  while(n < count){
 
    xpos[n] = random(800);
    ypos[n] = random(600);
    speedX[n] = random(-4, 5);
    speedY[n] = random(-5, 4);
    rad[n] = 5;
  
    n++;
  }
}
  
void draw(){
  
  float currentTime = millis() / 1000.0;
  strokeWeight(1);
  image(backG,0,0);
  smooth();
  int i = 0;
  while(i < count){
    if(xpos[i] < rad[i]/2){
      speedX[i] = -speedX[i];
      xpos[i] = rad[i]/2;
    } else if(xpos[i] > width - rad[i]/2) {
      speedX[i] = -speedX[i];
      xpos[i] = width - rad[i]/2;
    }
      
    if(ypos[i] < rad[i]/2) {
      speedY[i] = -speedY[i];
      ypos[i] = rad[i]/2;
    }else if(ypos[i] > height - rad[i]/2){
      speedY[i] = -speedY[i];
      ypos[i] = height - rad[i]/2;
    }
    
    xpos[i] = xpos[i] + speedX[i];
    ypos[i] = ypos[i] + speedY[i];
    fill(249,202,194,255);
    ellipse(xpos[i], ypos[i], rad[i], rad[i]);
  
    if((mousePressed == true) && (dist(mouseX, mouseY, xpos[i] , ypos[i]) < 40)){
      { 
        death = 1; 
      }
      if (death==1);
      { 
        speedX[i] = 0;
         speedY[i] = 0;
         rad[i] = 0;
         humans=humans-1;
      }
   if (humans<180);
{
score = score-1;
}
    }
    i++;
  }
  strokeWeight(1);
  if (mousePressed == true) {
    fill(255, 0, 0, 240);
    ellipse(mouseX, mouseY, 80, 80);
  }else{
    fill(50, 50, 50, 100);
    ellipse(mouseX, mouseY, 80, 80);
  }
  
  fill(255,0,0,255);
  scale(3.0);
  text("Destroy all of the humans before time runs out!", 10, 10);
  text("Use as few clicks as possible!", 20, 20);
  text("Score: "+score, 100, 100);
  text("Time:"+((currentTime-22)*-1), 90, 90);
  
  if(currentTime>22 && wins!=1)
  {
    lost=1;
    image(willy,25,0);
    fill(255);
    text("You get nothing! You lose! Good day sir!",25,50);
    text("Final Score:  "+score,75,75);
  }
  if(humans<-900 && lost==0)
  {
    wins=1;
    image(win,-50,-50);
    fill(255);
    text("Congratulations! You have destroyed earth!",15,50);
    text("Final Score:  "+score,75,75);
  }
}


