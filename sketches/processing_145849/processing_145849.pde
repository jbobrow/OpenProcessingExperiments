
Fluff[] fluffs = new Fluff[40];
float[] Xpos;
float[] Ypos;



 
void setup() {
  frameRate(15);
  size(800, 800);
  smooth();
  background(0);


  for(int i = 0; i< fluffs.length; i++) {
     fluffs[i] = new Fluff(Xpos,Ypos); //location of fluffs, random
     Xpos = (random(width - 20)); //sets random x pos
     Ypos = (random(height -20)); //sets random y pos

  } //declaring Fluff location and how many fluffs 
  
}

void draw() {
  background(0);
  for (int i=0; i<fluffs.length; i++) {
    fluffs[i].move();
    fluffs[i].display();
   
  }
}


class Fluff {
  
  int howMany;
  int numLegs;
  int cx;
  int cy;
  float legW;
  float legX;
  float legA;
  float legB;
  float rotX;
  float rotY;
  int legLength;
  int rotated;
  int transparency;
  int redtransparency;
  int []legLengthList;
  int []numLegsList;
  
  Fluff(int centerX, int centerY) {
    
    cx = centerX;
    cy = centerY;
     rotX =(random(width));
    rotY =(random(height));
    howMany = int(random(2,4));
    legLength = int(random(5,40));
    rotated = (random(rotX,rotY));
    transparency = int(random(10,90));
    redtransparency = int(random(100,200));
    legLengthList = new int[legLength];
    numLegsList = new int[howMany];
   
    
    
    for(int i=0; i<howMany; i++)
    {
      numLegs = int(random(5,110));
      legLength = int(random(10,80));
      legLengthList[i] = legLength;
      numLegsList[i] = numLegs;
    }
  
  }  
  void display() {
    
    ellipseMode(CENTER);
    stroke(255);
    for(int i=0; i<howMany; i++) {
      legLength = legLengthList[i];
      numLegs = numLegsList[i];
    for (int j = 0; j < 50; j++) {
      float legW = cx + cos(radians (10*j+rotated)) * legLength;
      float legX = cy+ sin(radians (5* j+rotated))* legLength;
      
      
       
      fill(255,transparency);
      ellipse(cx, cy, 1, 1);
      //fill(255,transparency);
      //ellipse(cx, cy - 25, 1,1);
  
      stroke(255,transparency);
      line(cx, cy, legW, legX);
      //ellipse(legX, legX, radius, radius);
      
 if (legLength < 50) {
     fill(103,29,15,redtransparency);
     noStroke();
     ellipseMode(CENTER);
     ellipse(legW,legX,2,2);
    }
   else {
    }

    }
    }

}  
  
  void move() {
  float xtime;
  float ytime;
  float increment; 
    xtime = 0.0;  
    ytime = 100.0;
    increment = 0.002;
    
  xtime += increment;  
  ytime += increment;   

    }

} 








