
Player p1;
Player p2;

Energy energy;

Scenery scenery;

Explosion explosion;
int explodingPlayer;

int timeP1 = 0;
int timeP2 = 0;

float topY = 0;

int start = 0;
int timeForLastFrame = 0;

boolean startScreen = true;
boolean endScreen = false;
String title = "ENERGY BEAM DUEL";
String pressSpaceS = "CLICK HERE THEN PRESS SPACE TO START";
String pressSpaceC = "PRESS SPACE TO CONTINUE";
String[] p1Inst = {"Press corresponding key when", "marked pulse is alligned with dot", "","Q - when pulse is on top","A - when pulse is on bottom"};
String[] p2Inst = {"Press corresponding key when", "marked pulse is alligned with dot", "","U - when pulse is on top","J - when pulse is on bottom"};

// end or reset
String winner = "";
float wipeCircle;
boolean spaceAllowed = true;
boolean spacePressed = false;

void setup(){
  size(800,400);
  
  p1 = new Player(1);
  p2 = new Player(2);
  energy = new Energy();
  scenery = new Scenery();
  
  timeP1 = 0;
  timeP2 = 0;
  
  topY = 0;
  
  winner = "";
  wipeCircle = width*2;
  
  startScreen = true;
  endScreen = false;
  
  spaceAllowed = true;
  spacePressed = false;
  
  explosion = new Explosion();
  explodingPlayer = 0;
}

void draw(){
  start = millis();
  timeForLastFrame = 20;
  
  scenery.drawScenery();
  
  if(!startScreen && !endScreen){    
    
    if(millis() > timeP1 + (p1.pulseSpeed)*50){
      p1.newPulse();
      timeP1 = millis();
    }
    
    if(millis() > timeP2 + (p2.pulseSpeed)*50){
      p2.newPulse();
      timeP2 = millis();
    }
  
    energy.calcEnergy();
    
    p1.updatePulse();
    p2.updatePulse(); 
  }  
  
  // draw items 
  energy.drawRadiance();
  energy.drawBeamP1();
  energy.drawBeamP2();
  energy.drawCollision(); 
  p1.drawPulses();
  p2.drawPulses();
  p1.drawFeedback();
  p2.drawFeedback();
  
  if(startScreen){
    if(spacePressed){
      for(float i = 10; i >= 0; i--){
        fill(255, (10-i)*25);
        ellipse(energy.x,energy.y,wipeCircle + i*5,wipeCircle + i*5);
      }
      
      wipeCircle -= 10;
    
      if(wipeCircle < 0){
        wipeCircle = 0;
        if(spacePressed){
          startScreen = false;
          spacePressed = false;
        }
      }     
      
    }
    else{
      background(255);
    }
    fill(0);
    textSize(24);
    text(title,width/2 - textWidth(title)/2,height*0.33);
    textSize(12);
    
    for(int i = 0; i < p1Inst.length; i++){
      text(p1Inst[i],10,(height*0.8) + (i*15));
      text(p2Inst[i],width - 10 - textWidth(p2Inst[i]),(height*0.8) + (i*15));
    }
    
    if(!spacePressed){
      text(pressSpaceS,width/2 - textWidth(pressSpaceS)/2,height*0.95);
    }    
  }
  
  if(endScreen){    
    for(float i = 10; i >= 0; i--){
      fill(255, (10-i)*25);
      ellipse(energy.x,energy.y,wipeCircle + i*5,wipeCircle + i*5);
    }
    
    explosion.spread();
    explosion.drawExplosion();
    
    fill(0);
    text(winner,width/2 - textWidth(winner)/2,height*0.33);
    if(!spacePressed){
      text(pressSpaceC,width/2 - textWidth(pressSpaceC)/2,height*0.95);
    }  
    
    wipeCircle+= 10;
    
    if(wipeCircle > width*2){
      wipeCircle = width*2;
      spaceAllowed = true;
      if(spacePressed){
        spacePressed = false;
        resetGame();
      }
    }
  }
  
  if(explodingPlayer != 1){
    p1.drawPlayer();
  }
  if(explodingPlayer != 2){
    p2.drawPlayer();
  }
  
  
  timeForLastFrame = millis() - start;
}

void keyPressed(){
  if(key == ' ' && spaceAllowed){
    spacePressed = true;
  }
  
  //player 1
  if((key == 'q' || key == 'Q') && p1.allowed[0]){
    p1.input[0] = true;
    p1.allowed[0] = false;
  }
  if((key == 'a' || key == 'A') && p1.allowed[1]){
    p1.input[1] = true;
    p1.allowed[1] = false;
  }
  
  // player 2
  if((key == 'u' || key == 'U') && p2.allowed[0]){
    p2.input[0] = true;
    p2.allowed[0] = false;
  }

  if((key == 'j' || key == 'J') && p2.allowed[1]){
    p2.input[1] = true;
    p2.allowed[1] = false;
  }
  
  if((key == 'r' || key == 'R')){
    resetGame();
  }

}

void keyReleased(){
  //player 1
  if((key == 'q' || key == 'Q')){
    p1.input[0] = false; 
    p1.allowed[0] = true;
  }
  if((key == 'a' || key == 'A')){
    p1.input[1] = false; 
    p1.allowed[1] = true;
  }

  // player 2 
  if((key == 'u' || key == 'U')){
    p2.input[0] = false;
    p2.allowed[0] = true;
  }
  if((key == 'j' || key == 'J')){
    p2.input[1] = false; 
    p2.allowed[1] = true;
  }
} 

void resetGame(){
  p1 = new Player(1);
  p2 = new Player(2);
  energy = new Energy();
  scenery = new Scenery();
  
  timeP1 = 0;
  timeP2 = 0;
  
  topY = 0;
  
  winner = "";
  wipeCircle = width*2;
  
  startScreen = true;
  endScreen = false;
  
  spaceAllowed = true;
  spacePressed = false;
  
  explosion = new Explosion();
  explodingPlayer = 0;
}
class Characters{
  
  String name;
  
  float x;
  float y;
  
  float bodyY = 0;
  
  PVector[] bodyPoints = new PVector[18];
  
  int inverse;
  
  float ang;
  
  Characters(String tName){
    
    name = tName;
    
    
    if(name.equals("P1 ")){
      x = (1.0/8.0)*width;
      inverse = 1;
    }
    else{
      x = (7.0/8.0)*width;
      inverse = -1;
    }
    
    y = height/2;
    
    // front of body
    bodyPoints[0] = new PVector(-15*inverse,0);
    bodyPoints[1] = new PVector(-16*inverse,6);
    bodyPoints[2] = new PVector(-16*inverse,8);
    bodyPoints[3] = new PVector(-13*inverse,16);
    bodyPoints[4] = new PVector(-13*inverse,20);
    bodyPoints[5] = new PVector(-15*inverse,27);
    bodyPoints[6] = new PVector(-15*inverse,30);
    
    // face and front shoulder
    bodyPoints[7] = new PVector(-8*inverse,-2);
    bodyPoints[8] = new PVector(-14*inverse,-4);
    bodyPoints[9] = new PVector(-16*inverse,-5);
    bodyPoints[9] = new PVector(-17*inverse,-6);
    bodyPoints[10] = new PVector(-17*inverse,-9);
    bodyPoints[11] = new PVector(-15*inverse,-9);
    bodyPoints[12] = new PVector(-15*inverse,-14);
    
    // back leg
    bodyPoints[13] = new PVector(-19*inverse,16);
    bodyPoints[14] = new PVector(-19*inverse,20);
    bodyPoints[15] = new PVector(-21*inverse,27);
    
    // hand and arm forward
    bodyPoints[16] = new PVector(-4*inverse, -4);
    bodyPoints[17] = new PVector(-5*inverse, 3);
    
  } 
  
  void drawAvitar(){
    stroke(255);
    
    
    float tempRand = random(0,50);
    
    for(int j = 0; j < 3; j++){
      int lightInt = (int)(map(j, 0, 3, 205, 50)+ tempRand);
      
      if(name.equals(p1.name)){
        stroke(lightInt,lightInt*0.7,lightInt*0.7);
      }
      else{
        stroke(lightInt*0.7,lightInt*0.7,lightInt);
      }
      
      translate(x - (j*inverse),y + (bodyY * j * 0.2));
      
      scale(0.7);
      
      // front body
      translate(0,bodyY);
      for(int i = 0; i < 6; i ++){
        line(bodyPoints[i].x,bodyPoints[i].y,bodyPoints[i+1].x,bodyPoints[i+1].y);
      }
      
      for(int i = 7; i < 12; i++){
        line(bodyPoints[i].x,bodyPoints[i].y,bodyPoints[i+1].x,bodyPoints[i+1].y);
      }
      
      for(int i = 13; i < 15; i++){
        line(bodyPoints[i].x,bodyPoints[i].y,bodyPoints[i+1].x,bodyPoints[i+1].y);
      }
      
      translate(0,-bodyY);
      
      translate(0,bodyY/2);
      line(bodyPoints[16].x,bodyPoints[16].y,bodyPoints[17].x,bodyPoints[17].y);
      translate(0,-bodyY/2);
      
      scale(1/0.7);
      
      translate(-x + (j*inverse),-y - (bodyY * j * 0.2));
      
    }
    noStroke();
    ang+= (timeForLastFrame/20)*0.1;
    bodyY += sin(ang)*0.15;
    
    
  }
}
class Energy{

  float acc = 0;
  float speed = 0;
  float dist = 0;
  
  float radius = 5;
  
  float x = width/2;
  float y = height/2;
  
  float bHp1 = 1;
  float bHp2 = 1;
  
  float lossRate = 0.05;
  
  Energy(){
    x = width/2;
    y = height/2;
  }
  
  void calcEnergy(){
    float totalEnergy = p1.energySum + p2.energySum;
    
    radius = pow(totalEnergy * (3.0 / 4.0) * PI, 1.0/3.0); // radius of sphere
    radius *= 4;  
    
    // F = ma     a = F/m
    acc = (p1.energySum - p2.energySum)/(totalEnergy + 1000); 
    speed += acc;
    speed = lerp(speed,0,0.0025);
    dist += speed; 
    
    x = (width/2.0) + dist;
    
    if(x > p2.position){
      x = p2.position;
      acc = 0;
      speed = 0;
      
      endScreen = true;
      explosion.startExplosion(2);
      winner = "RED PLAYER IS THE WINNER";
    }
    if(x < p1.position){
      x = p1.position;
      acc = 0;
      speed = 0;
      
      endScreen = true;
      explosion.startExplosion(1);
      winner = "BLUE PLAYER IS THE WINNER";
    }
    
    p1.energySum = lerp(p1.energySum,10,lossRate);
    p2.energySum = lerp(p2.energySum,10,lossRate);

  }
  
  void drawRadiance(){
    // radiance
    noStroke();
    fill(255);
    //println(y);
    
    ellipse(x, y, 2.5*radius, 2.5*radius);
    fill(0,2);
    
    for(float i = 2.5; i > 1; i-=0.01){
      ellipse(x, y, i*radius, i*radius);      
    }
  }
  
  void drawBeamP1(){
    // p1 beam
    noStroke();
    fill(255,0,0);
    bHp1 = map(p1.pulseSpeed,5,20,10,2);
    rect(p1.position, y-(bHp1/2)-1, x-p1.position, bHp1+2);
    fill(255,0,0,50);
    rect(p1.position, y-(bHp1/2)-3, x-p1.position, bHp1+6);
    fill(255,0,0,50);
    rect(p1.position, y-(bHp1/2)-6, x-p1.position, bHp1+12);
    fill(255);
    rect(p1.position, y-(bHp1/2)  , x-p1.position, bHp1);
    
    // p1 hand flair
    translate(p1.position,height/2);
    fill(255);
    stroke(255,0,0,50);
    for(int i = 0; i < 10; i++){
      float tH = (random((bHp1+1)*2,(bHp1+1)*4));
      float rot = random((7.0/6.0) * PI, (11.0/6.0)*PI);
      
      rotate(rot);
      triangle(tH/10,0,-tH/10,0,0,tH);
      rotate(-rot);
    }
    
    noStroke();
    ellipse(0,0,(bHp2+1),(bHp2+1));
    
    translate(-p1.position,-height/2);   
  }
  
  void drawBeamP2(){
    // p2 beam
    fill(0,0,255);
    bHp2 = map(p2.pulseSpeed,5,20,10,2);
    rect(x, y-(bHp2/2)-1, p2.position - x, bHp2+2);
    fill(0,0,255,50);
    rect(x, y-(bHp2/2)-3, p2.position - x, bHp2+6);
    fill(0,0,255,50);
    rect(x, y-(bHp2/2)-6, p2.position - x, bHp2+12);
    fill(255);
    rect(x, y-(bHp2/2)  , p2.position - x, bHp2);
    
    // p2 hand flair
    translate(p2.position,height/2);
    fill(255);
    stroke(0,0,255,50);
    for(int i = 0; i < 10; i++){
      float tH = (random((bHp2+1)*2,(bHp2+1)*4));
      float rot = random((1.0/6.0) * PI, (5.0/6.0)*PI);
      
      rotate(rot);
      triangle(tH/10.0,0,-tH/10.0,0,0,tH);
      rotate(-rot);
    }
    
    noStroke();
    ellipse(0,0,(bHp2+1),(bHp2+1));
    
    translate(-p2.position,-height/2);
  }
  
  void drawCollision(){
 
    // white sphere --- energy collisions
    //noStroke();
    fill(255);
    
    translate(x,y);    
    
    // player 1
    stroke(255,0,0,50);
    for(int i = 0; i < 10; i++){
      float tH = (random(radius/2.0,radius)) + (p1.energyInc*2);
      float rot = random(0,PI);
      
      if(rot > (1.0/3.0)* PI && rot < (2.0/3.0)*PI){
        tH = 2*tH/3;
      }
      
      rotate(rot);
      triangle(radius/10.0,0,-radius/10.0,0,0,tH);
      rotate(-rot);
    }
    
    // player 2
    stroke(0,0,255,50);
    for(int i = 0; i < 20; i++){
      float tH = (random(radius/2,radius)) + (p2.energyInc*2);
      float rot = random(PI,(2*PI));
      
      if(rot > (4.0/3.0) * PI && rot < (5.0/3.0)*PI){
        tH = 2*tH/3.0;
      }
      
      rotate(rot);
      triangle(radius/10.0,0,-radius/10.0,0,0,tH);
      rotate(-rot);
    }
    
    translate(-x,-y);
    
    
    // central energy collision
    noStroke();
    fill(255,15);
    
    for(float i = 2; i > 1; i -= 0.01){
      ellipse(x-(radius/9.0), y, i * radius/4.0, i * radius/2.0);
      ellipse(x+(radius/9.0), y, i * radius/4.0, i * radius/2.0);
    }
    
  }
}
  
  
class Explosion{
  
  float x,y;
  boolean exist = false;
  
  int number = 500;
  
  float[] pX;
  float[] pY;
  float[] pA;
  float[] pF;
  float[] darkness;
  
  float[] iX;
  float[] iY;
  
  //int explodingPlayer;

  Explosion(){

  }
  
  void startExplosion(int temp){
 
    exist = true;
    
    explodingPlayer = temp;
    y = height/2;
    
    if(temp == 1){
      x = p1.position - 10;      
    }
    else{
      x = p2.position + 10;
    }  
  
    pX = new float[number];
    pY = new float[number];
    pA = new float[number];
    pF = new float[number];
    iX = new float[number];
    iY = new float[number];
    darkness = new float[number];
    
    for (int i = 0; i < pX.length; i++){
      pX[i] = x;
      pY[i] = y;
      pA[i] = random(0, 2*PI);
      pF[i] = random(0.5,4);
      darkness[i] = random(0,255);
      iX[i] = 1;
      iY[i] = 1;
    }  
  }
  
  void spread(){
    if(exist){
      for(int i = 0; i < pX.length; i++){
        pX[i] += (sin(pA[i]) * pF[i])*iX[i];
        pY[i] += (cos(pA[i]) * pF[i])*iY[i];
        
        if(pX[i] > width || pX[i] < 0){
          iX[i] = -iX[i];
          
        }
        if(pY[i] > height || pY[i] < 0){
          iY[i] = -iY[i];
        }
      }
    }
  }
  
  void drawExplosion(){
    if(exist){
      for(int i = 0;  i < pX.length; i++){
        if(explodingPlayer == 1){
          stroke(darkness[i],0,0); 
        }
        else{
          stroke(0,0,darkness[i]);
        }       
        point(pX[i],pY[i]);
      }
    }
     
  }
}
class Player{
  
  String name;
  
  Characters avitar;
  
  boolean[] input = new boolean[2];
  boolean[] allowed = new boolean[2];
  boolean[] required = new boolean[2];
  
  Pulse[] pulse = new Pulse[20];
  int theCurrentPulse;
  float maxPSpeed = 20; // slowest
  float minPSpeed = 5; // fastest
  float pulseSpeed = 20;
  float pulseSpeedTarget = 20;
  
  float energySum = 10;
  float energyInc = 0.01;
  float energyTarget = 0.01;
  float energyLoss = 0.005;
  
  float position = 0;
  
  String[] feedback = new String[5];
  float[] fbX = new float[5];
  float[] fbY = new float[5];
  int[] fbAlpha = new int[5];
  
  
  Player(int temp){ 
    //player 1
    if(temp == 1){
      name = "P1 ";
      position = (1.0/8.0)*width;
    }
    
    //player 2
    else{
      name = "P2 ";
      position = (7.0/8.0)*width;
    }
    
    for(int i = 0; i < allowed.length; i++){
      allowed[i] = true;
    }
    
    for(int i = 0; i < pulse.length; i++){
      pulse[i] = new Pulse();
    }
    
    for(int i = 0; i < feedback.length; i++){
      feedback[i] = "test";
    }
    
    avitar = new Characters(name);
  }
  
  void drawFeedback(){
    for(int i = 0; i < feedback.length; i++){
      fill(255,fbAlpha[i]);
      
      if(name.equals(p1.name)){
        text(feedback[i],fbX[i] - textWidth(feedback[i]), fbY[i]);
      }
      else if(name.equals(p2.name)){
        text(feedback[i],fbX[i], fbY[i]);
      }
      fbY[i]-= (timeForLastFrame/20)*2;
      fbAlpha[i] -= (timeForLastFrame/20)*5;
    }
    
  }
  
  void updatePulseSpeed(){
    pulseSpeed = lerp(pulseSpeed,pulseSpeedTarget,0.2);
    //println(name + pulseSpeed + " " + pulseSpeedTarget);
  }
  
  void updateFeedback(float temp){
    String latest = "ERROR";
    
    if(temp > 9.7){
      latest = "PERFECT!";
      pulseSpeedTarget -= 2;
    }
    else if(temp > 9.0){
      latest = "GREAT";
      pulseSpeedTarget -= 1;
    }
    else if(temp > 8.5){
      latest = "GOOD";
    }
    else if(temp > 7.5){
      latest = "JUST";
      pulseSpeedTarget += 1;
    }
    else{
      latest = "BAD";
      pulseSpeedTarget += 5;
    }
    
    if(pulseSpeedTarget > maxPSpeed){
      pulseSpeedTarget = maxPSpeed;
    }
    if(pulseSpeedTarget < minPSpeed){
      pulseSpeedTarget = minPSpeed;
    }
    
    
    for(int i = 0; i < feedback.length-1; i++){
      feedback[i] = feedback[i+1];
      fbY[i] = fbY[i+1];
      fbX[i] = fbX[i+1];
      fbAlpha[i] = fbAlpha[i+1];
    }
    
    fbY[feedback.length-1] = (height/2) - 50;
    fbX[feedback.length-1] = pulse[theCurrentPulse].x;
    fbAlpha[feedback.length-1] = 255;
    feedback[feedback.length-1] = latest;
  
  }
  
  void newPulse(){
    int thisPulse = 0;
    
    // add new pulse
    for (int i = 0; i < pulse.length; i++){
      if(pulse[i].used == false){
        pulse[i].used = true;
        thisPulse = i;
        i = pulse.length;
        
        pulse[thisPulse].x = position;
        pulse[thisPulse].y = height/2;
        pulse[thisPulse].currentPulse = false;
        pulse[thisPulse].locked = false;
        pulse[thisPulse].boost = 1.0;
        
        if(random(1) < 0.5){
          pulse[thisPulse].upD = true;
        }
        else{
          pulse[thisPulse].upD = false;
        }
      }
    } 
  }
  
  void updatePulse(){
    
    // check for input - up
    if(input[0]){
      if(!pulse[theCurrentPulse].upD){
        pulse[theCurrentPulse].setToZero();

      }
      else{
        
        pulse[theCurrentPulse].lockAtCurrent();        
      }
      input[0] = false; 
      updateFeedback(pulse[theCurrentPulse].sizeOf);  
    }
    else if(input[1]){ // down
      if(pulse[theCurrentPulse].upD){
        pulse[theCurrentPulse].setToZero();
      }
      else{
        pulse[theCurrentPulse].lockAtCurrent();
      }
      input[1] = false;  
      updateFeedback(pulse[theCurrentPulse].sizeOf);      
    }
       
    
    // check current pulse
    float oldDistance = width;
    
    for(int i = 0; i < pulse.length; i++){
      float distance = dist(pulse[i].x,0,energy.x,0);
      
      if(distance < oldDistance && !pulse[i].locked && pulse[i].used){
        oldDistance = distance;            
        
        for(int j = 0; j < pulse.length; j++){ // the problem is here????
          //println("this: " + j); 
          pulse[j].currentPulse = false;
        } 
               
        pulse[i].currentPulse = true;
        theCurrentPulse = i; 
        
      }
    } 
    
    // move
    for(int i = 0; i < pulse.length; i++){
      pulse[i].movePulse(name);
    } 
 
    updatePulseSpeed();   
  }
  
  void drawPulses(){
  // move and draw
    for(int i = 0; i < pulse.length; i++){
      pulse[i].drawPulse(name);
    } 
    
    // draw centre pip
    float cBeam;
    if(name.equals(p1.name)){
      cBeam = energy.x - (energy.x - p1.position)/2;
      fill(255,0,0,100);
    }
    else{
      cBeam = energy.x + (p2.position - energy.x)/2;
      fill(0,0,255,100);
    }
    
    ellipse(cBeam,height/2,3,3);
  }
  
  
  
  void drawPlayer(){
    avitar.drawAvitar();
  }
  
  
}
class Pulse{
  
  float x;
  float y;
  float yShift;
  float sizeOf;
  boolean upD;
  boolean used;
  boolean currentPulse = false;
  boolean locked = false;
  
  float maxPulse = 10;
  
  float boost = 1.0;
  
  Pulse(){
  }
  
  void setToZero(){
    // add animation
    
    sizeOf = 0;
    locked = true;
    boost = 1.0;
  }
  
  void lockAtCurrent(){
    // add animation
    
    locked = true;
    boost = 3.0;
  }
  
  void movePulse(String name){
    if(used){
      if(name.equals(p1.name)){
        //x += 1;
        
        x += timeForLastFrame / (p1.pulseSpeed/boost);
        yShift = (energy.bHp1 / 2) - 1;
         
        // size of pulse
        if(!locked){
          sizeOf = dist(x,0,energy.x - (energy.x - p1.position)/2,0);
          sizeOf = map(sizeOf,0,(energy.x - p1.position)/2.0,sqrt(maxPulse),0);
          sizeOf = sq(sizeOf);
        }
      
        if(x > energy.x){ 
          if(!locked){
            p1.updateFeedback(0);
          }
          
          used = false;
          currentPulse = false;
          locked = false;
          x = width;
          
          
          // transfer energy here
          if(sizeOf > 1){
            p1.energySum +=5;
          }
          
        }
      }
      else if (name.equals(p2.name)){
        //x -= 1;
        x -= timeForLastFrame / (p2.pulseSpeed/boost);
        yShift = (energy.bHp2 / 2) - 1;
         
        // size of pulse
        if(!locked){
          float cBeam = energy.x + (p2.position - energy.x)/2;
          sizeOf = dist(x,0,cBeam,0);
          sizeOf = map(sizeOf,0,cBeam - energy.x,sqrt(maxPulse),0);
          sizeOf = sq(sizeOf);
        }
      
        if(x < energy.x){ /// this should be > energy.x
          if(!locked){
            p2.updateFeedback(0);
          }
          
          used = false;
          currentPulse = false;
          locked = false;
          x = -width;
          
          // transfer energy here
          if(sizeOf > 1){
            p2.energySum += 5;
          }
        }        
      }
    }
  }
  
  void drawPulse(String name){
    //fill(255);
    if(used){
      if(upD){
        if(currentPulse && !locked){
          if(name.equals(p1.name)){
            fill(255,0,0,150);
          }  else {
             fill(0,0,255,150); 
          }
          triangle(x,y-sizeOf-yShift - 7,x+sizeOf,y-yShift - 2,x-sizeOf,y-yShift - 2);

        }
        fill(255);
        triangle(x,y-sizeOf-yShift,x+sizeOf,y-yShift,x-sizeOf,y-yShift);
      }
      else{
        if(currentPulse && !locked){
          if(name.equals(p1.name)){
            fill(255,0,0,150);
          }  else {
             fill(0,0,255,170); 
          }
          triangle(x,y+sizeOf+yShift + 5,x+sizeOf,y+yShift + 2,x-sizeOf,y+yShift + 2);
        }
        fill(255);
        triangle(x,y+sizeOf+yShift,x+sizeOf,y+yShift,x-sizeOf,y+yShift);
      }
      
      // show which is the current pulse
      if(currentPulse && !locked){
        stroke(255);
        //line(x,y-40,x,y+40);
        noStroke();
      }
    }    
  }
}
class Rocks{
  
  PVector[] rocks = new PVector[8];
  float x, y;
  
//  float topY;
  
  Rocks(float tempX, float tempY){
    float rotation = 0;
    float hyp = random(3,7);
    float xC = 0;
    float yC = 0;
    
    for(int i = 0; i < rocks.length; i++){
      rotation += random(PI/4.2,PI/3.8); // 8.0 is central
      
      xC = cos(rotation) * hyp * (random(4,6));
      yC = sin(rotation) * hyp;
      
      rocks[i] = new PVector(xC,yC); 
    }
    
    
    x = (tempX * (width/7.0) + width/7.0) + random(-7,7);
    
    if(tempY == 0){ 
      y = height;
    }
    else{
      y = topY - (hyp * 0.95);
    }
    
    topY = y - (hyp * 0.95);

  }
  
  void drawRocks(){
    
    translate(x,y);
    
    // draw rock
    beginShape();
    noStroke(); 
    
    for(int i = 0; i < rocks.length; i++){
      float brightnessNoise = random(10);
      float rockBright = dist(x,y,energy.x,energy.y) + brightnessNoise;
      rockBright = map(rockBright,0,height/2,80,50);
      rockBright = constrain(rockBright,0,150);
      fill(rockBright);
      vertex(rocks[i].x,rocks[i].y);
    }
    endShape(CLOSE);
    
    translate(-x,-y);
     
  }
  
  void drawLightShadow(){
    translate(x,y);
    
    // draw light/shadow on rocks
    for(int i = 0; i < rocks.length-1; i++){
      // find center
      float centX = lerp(rocks[i].x,rocks[i+1].x,0.5);
      float centY = lerp(rocks[i].y,rocks[i+1].y,0.5);

      if(dist(centX + x,centY + y,energy.x,energy.y) < dist(x,y,energy.x,energy.y) && centY < 0){
        
        // calculate intensity
        float intensity = dist(centX + x,centY + y,energy.x,energy.y);
        intensity = map(intensity,0,height/2,255,150) + random(-30,0);
        
        for(int j = 0; j < 3; j++) {   
          
          translate(0,j*0.5);
          
          if(centX + x <= energy.x){           
            stroke(255,150,150,intensity - (j*20));
          } 
          else{
            stroke(150,150,255,intensity - (j*20));
          }
          
          line(rocks[i].x,rocks[i].y,rocks[i+1].x,rocks[i+1].y);
          
          translate(0,-j*0.5);
        }
        
      }
      else{
        if(centY > 0){
          stroke(0);
        }
        else{
          stroke(50);
        }
        
        line(rocks[i].x,rocks[i].y,rocks[i+1].x,rocks[i+1].y);
      }
      
      //line(rocks[i].x,rocks[i].y,rocks[i+1].x,rocks[i+1].y);
    }
    
    // final line
    float centX = lerp(rocks[rocks.length-1].x,rocks[0].x,0.5);
    float centY = lerp(rocks[rocks.length-1].y,rocks[0].y,0.5);
    
    //if(centY < 0){
    if(dist(centX + x,centY + y,energy.x,energy.y) < dist(x,y,energy.x,energy.y) && centY < 0){
      // calculate intensity
      float intensity = dist(centX + x,centY + y,energy.x,energy.y);
      intensity = map(intensity,0,height/2,300,150);
             
      if(centX + x <= energy.x){
        stroke(255,150,150,intensity);
      } 
      else{
        stroke(150,150,255,intensity);
      }
    }
    else{
      stroke(0);
    }
    
    line(rocks[rocks.length-1].x,rocks[rocks.length-1].y,rocks[0].x,rocks[0].y);
    translate(-x,-y);
  }
}
class Scenery{
  
  Rocks[] rocks = new Rocks[48];
  Rocks[] plinthA = new Rocks[16];
  Rocks[] plinthB = new Rocks[16];
  
  Scenery(){
    
    // creat rocks
    for(int i = 0; i < 10; i++){
      rocks[i] = new Rocks(0.5,i);      
    }
    
    for(int i = 10; i < 16; i++){
      rocks[i] = new Rocks(1.2,i-10);      
    }
    
    for(int i = 16; i < 24; i++){
      rocks[i] = new Rocks(1.9,i-16);      
    }
    
    for(int i = 24; i < 30; i++){
      rocks[i] = new Rocks(2.8,i-24);      
    }
    
    for(int i = 30; i < 37; i++){
      rocks[i] = new Rocks(3.7,i-30);
    }
    
    for(int i = 37; i < 48; i++){
      rocks[i] = new Rocks(4.6,i-37);
    }
    
    for(int i = 0; i < plinthA.length; i++){
      plinthA[i] = new Rocks(-0.3,i);
    }
    
    for(int i = 0; i < plinthA.length; i++){
      plinthB[i] = new Rocks(5.3,i);
    }
    
    
  }
  
  void drawScenery(){
    background(0);
    
    // draw the rocks
    for(int i = 0; i < rocks.length; i++){
      rocks[i].drawRocks();
    }
    for(int i = 0; i < rocks.length; i++){
      rocks[i].drawLightShadow();
    }
    
    for(int i = 0; i < plinthA.length; i++){
      plinthA[i].drawRocks();
    }
    for(int i = 0; i < plinthA.length; i++){
      plinthA[i].drawLightShadow();
    }
    
    for(int i = 0; i < plinthB.length; i++){
      plinthB[i].drawRocks();
    }
    for(int i = 0; i < plinthB.length; i++){
      plinthB[i].drawLightShadow();
    }
    
    noStroke();
    fill(50);
    //rect(0,height * 0.9,width,height);
    
  }
}


