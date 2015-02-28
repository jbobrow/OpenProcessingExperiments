
int step = 6;
float rHue;
int alt = 0;

int startR =240;
float rSat = 100;

float a = 5*PI/6;


void setup(){
  size (250,250);
  colorMode(HSB, 2*PI, 100, 100);
  smooth();
  frameRate(35);
  background(0,0,25);
}

void draw(){
  
  ellipseMode(CENTER);
  rHue = a % (2*PI);
  a=a+PI/4;
   
  startR = constrain(startR, 20, 240);
  rSat = constrain(rSat, 50, 100);
  
  stroke(0,0,25);
  fill(rHue, rSat, 100, 75); 
    
    ellipse(width/2, height/2, startR, startR);
    
    if (alt == 0){
    startR = startR - startR/step;
    rSat = rSat - rSat/step;
    }
    else if(alt == 1){
      startR = startR + startR/step;
      rSat = rSat + rSat/step;
    }
    
    if (startR >=240){
      alt = 0;
    }else if (startR <=20){
      alt =1;
    }

  }





  
  
  

