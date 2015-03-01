
import ddf.minim.*;

Minim minim;
AudioInput in;

//Virus virus;
Virus[] virus = new Virus[200];


void setup() {
  size(1200,600);
  smooth();
  //virus = new Virus();
  //virus.prime();
  
  
    //Initialize Library
  minim = new Minim(this); //using library

  // use the getLineIn method of the Minim object to get an AudioInput
  in = minim.getLineIn(); //gets audio microphone input
  
  for(int i = 0; i<virus.length; i++) {
    virus[i] = new Virus();
    virus[i].prime();
  
}
}


void draw() {
  float modifier = in.left.get((16)%1024)*100;
  fill(0,modifier*1000,modifier*1000,10);
  rect(0,0,width, height);
  //virus.update();
  
  for (int j = 0; j<virus.length; j++) {
    virus[j].update();
  }
  
}
class Cells {
  
  void prime() {
    
    
    
    
  }
  
  void update() {
    
    
    
  }
  
  
  
  
}
class Virus {
 

  
 
  float bigness;
  float xPos;
  float yPos;
  float speed;
  float m;
  //int constant = 24;
  //float angle = 0.5;
  //int scalar = 30;
  //float speed = 0.1;
  
  void prime() {
    
    xPos = random(0,width);
    yPos = random(0,height);
    bigness = random(2,10);
    speed = random(1,10);
    
  }
  
  void update() {
    noStroke();
    m = map(xPos,0, width,25,255);
    float modifier = in.left.get((8)%1024)*50;
    speed = random(abs(modifier*10), 10);
    fill(m,0,0,200);
    ellipse(xPos, yPos+(modifier*20), bigness*3*modifier+(xPos/50), bigness*2*modifier+(xPos/50));
    
    //movement
    xPos += speed;
    if (xPos > width) {
      xPos = 0;
    }
    println(m);
}


}


