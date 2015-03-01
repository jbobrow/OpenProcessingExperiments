
CreaturePrime guy;
CreatureFans[] fan = new CreatureFans[6];

boolean upPressed;
boolean downPressed;
boolean leftPressed;
boolean rightPressed;

float lerp = .01;

//float collideVar

float d;

void setup() {
  
  size(600, 600);
  smooth();
  guy = new CreaturePrime();
  guy.prime();

  for (int i=0;i<fan.length;i++) {
    fan[i] = new CreatureFans();
    fan[i].prime();
  }
}

void draw() {
  background(255);
  guy.update();

  //Groupie Data
  for (int j=0;j<fan.length;j++) {
    d=dist(guy.xPos, guy.yPos, fan[j].xPos, fan[j].yPos);
    fan[j].update();
  }

  for (int k=0; k<fan.length; k++) {
    for (int m=1; m<fan.length-1; m++) {
      if (dist(fan[k].xPos, 0, fan[m].xPos, 0) < (fan[k].bigness)/2
        ||
        dist(fan[k].yPos, 0, fan[m].yPos, 0) < (fan[k].bigness)/2 ) {
      }
    }
  }
}

void mousePressed() {
  lerp *= -1;
}
  
    void keyPressed() {
      if (keyCode == 'W') {
        upPressed=true;
      }

      if (keyCode== 'S') {
        downPressed=true;
      }
      if (keyCode=='A') {
        leftPressed=true;
      }
      if (keyCode=='D') {
        rightPressed=true;
      }
    }

    void keyReleased() {
      if (keyCode == 'W') {
        upPressed=false;
      }

      if (keyCode== 'S') {
        downPressed=false;
      }
      if (keyCode=='A') {
        leftPressed=false;
      }
      if (keyCode=='D') {
        rightPressed=false;
      }
    }

class CreatureFans {

  float xPos;
  float yPos;
  float fanSpeed;
  float bigness;

  void prime() {

    xPos = random(bigness*50, width-bigness*50);
    yPos = random(bigness*50, height-bigness*50);
    bigness = 1;    // Change the creature's size
    fanSpeed = 5;
  }

  void update() {

    //The body. Position determined here
    strokeWeight(3);  
    stroke(0);
    fill(75, 56, 32);
    ellipse(xPos, yPos, bigness*50, bigness*50);

    // The eyeball
    fill(255);        
    ellipse(xPos-(bigness*4), yPos-(bigness*2), bigness*25, bigness*10);

    //The pupil
    fill(0);    
    ellipse(xPos-(bigness*5), yPos-(bigness+bigness*.5), bigness*5, bigness*5);

    //The mouth
    line(xPos-(bigness*16), yPos+(bigness*10), xPos+(bigness*11), yPos+(bigness*10));
  

  //MOVEMENT

  if(d>100) {
    fanSpeed=5;
    xPos=lerp(xPos, guy.xPos, lerp);
    yPos=lerp(yPos, guy.yPos, lerp);
  }
  else{
    fanSpeed=0;
  } 
  
  }
    //Wall bounding

    //KOMBAT
}
class CreaturePrime {

  float xPos;
  float yPos;
  float playerSpeed;
  float bigness;

  void prime() {

    xPos = random(bigness*50, width-bigness*50);
    yPos = random(bigness*50, height-bigness*50);
    bigness = 3;    // Change the creature's size
    playerSpeed = 5;
  }

  void update() {

    //The body. Position determined here
    strokeWeight(3);  
    stroke(0);
    fill(75, 56, 32);
    ellipse(xPos, yPos, bigness*50, bigness*50);

    // The eyeball
    fill(255);        
    ellipse(xPos-(bigness*4), yPos-(bigness*2), bigness*25, bigness*10);

    //The pupil
    fill(0);    
    ellipse(xPos-(bigness*5), yPos-(bigness+bigness*.5), bigness*5, bigness*5);

    //The mouth
    line(xPos-(bigness*16), yPos+(bigness*10), xPos+(bigness*11), yPos+(bigness*10)); 




    //MOVEMENT
    if (upPressed==true) {
      guy.yPos-=playerSpeed;
    }
    if (downPressed==true) {
      guy.yPos+=playerSpeed;
    }
    if (leftPressed==true) {
      guy.xPos-=playerSpeed;
    }
    if (rightPressed==true) {
      guy.xPos+=playerSpeed;
    }
  }




  //Wall bounding

  //KOMBAT
}



