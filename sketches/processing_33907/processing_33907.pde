
int numCircles = 1000;
int [] rad = new int[numCircles];
int timeOff = 5000;
int timeOn = 10000;
int lastTime;

float [] circleX = new float[numCircles];
float [] circleY = new float[numCircles];
float [] vel = new float[numCircles];
float [] r = new float[numCircles];
float [] g = new float[numCircles];
float [] b = new float[numCircles];

boolean circlesOn = true;

void setup(){
  size(500, 500);
  smooth();
  frameRate(15);
  PFont font;
      font = loadFont("JosefinSans-Bold-48.vlw"); 
      textFont(font);
      fill(255);
  
  for(int i=0; i< numCircles; i++){
    rad[i] = round(random(10,40));
    circleX[i] = round(random(rad[i], width-rad[i]));
    circleY[i] = round(random(rad[i], height-rad[i]));
    vel[i] = round(random(-50,50));
    r[i] = random(255);
    g[i] = random(255);
    b[i] = random(255);
    
  }
  lastTime = millis();
}

void draw(){
  background(0);
  noStroke();
  if(millis() < 5000){
    PFont font;
      font = loadFont("JosefinSans-Bold-48.vlw"); 
      textFont(font);
      fill(255, 255, 255);
      String s = "find the rectangle";
      text(s, 60, 0, 400, 400);
      textAlign(CENTER, CENTER);
    fill(0);
    noStroke();
    rect(500, 500, 0, 0);
  }else{

  if(circlesOn == true){  
    for(int j=0; j< numCircles; j++){
      ellipse(circleX[j], circleY[j], rad[j], rad[j]);
      circleY[j] += vel[j];
      circleX[j] += vel[j];
      fill(r[j], g[j], b[j], 190);
  
     if(circleY[j] < 0+rad[j] || circleY[j] > height-rad[j]){
      vel[j] *= -1;
      }
     if(circleX[j] < 0+rad[j] || circleX[j] > width-rad[j]){
      vel[j] *= -1;
      }
    }
      if(timeOn < millis() - lastTime){
        circlesOn = false;
        lastTime = millis();
        println("circles off");        
      }
  }else{
      PFont font;
      font = loadFont("JosefinSans-Bold-48.vlw"); 
      textFont(font);
      fill(255, 255, 255);
      String s = "there is no rectangle. haha.";
      text(s, 60, 0, 400, 400);
      textAlign(CENTER, CENTER);
      
    if(timeOff < millis() - lastTime){
      circlesOn = true;
      lastTime = millis();

    }
  }
  }
}//void draw

