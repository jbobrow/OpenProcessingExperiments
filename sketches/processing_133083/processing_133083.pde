
/////////////////////////////
//     Universal Cycle     //
//                         //
//      Taryn Hampton      //
/////////////////////////////

Arm arm1; Arm arm2; Arm arm3; Arm arm4;
Arm arm5; Arm arm6; Arm arm7; Arm arm8;
Arm arm9; Arm arm10; Arm arm11; Arm arm12;

int minCount;
int hourCount;
float pRadius;
float pRadius2;
float pulseX;
float pulseY;
int colorRange;

void setup() {
  size (1200,600);
  noFill();
  minCount=minute();
  hourCount = hour();
  
  //Posotion the arms
  arm1 = new Arm(14, random(-2, 0), random(-2, 0));
  arm2 = new Arm(14, random(2, 0), random(-2, 0));
  arm3 = new Arm(14, random(-2, 0), random(2, 0));
  arm4 = new Arm(14, random(2, 0), random(2, 0));
  
  arm5 = new Arm(14, random(-3, 0), random(-1, 0));
  arm6 = new Arm(14, random(3, 0), random(-1, 0));
  arm7 = new Arm(14, random(-3, 0), random(1, 0));
  arm8 = new Arm(14, random(3, 0), random(1, 0));

  arm9 = new Arm(14, random(-1, 0), random(-3, 0));
  arm10 = new Arm(14, random(1, 0), random(-3, 0));
  arm11 = new Arm(14, random(-1, 0), random(3, 0));
  arm12 = new Arm(14, random(1, 0), random(3, 0));
}

void draw() {
  background(0);

//to see time
  println("second: " + second());
  println("minute: " + minute());
  println("hour: " + hour());
  
  arm1.follow(); arm1.display();
  arm2.follow(); arm2.display();
  arm3.follow(); arm3.display(); 
  arm4.follow(); arm4.display();
  
  arm5.follow(); arm5.display();
  arm6.follow(); arm6.display();
  arm7.follow(); arm7.display();
  arm8.follow(); arm8.display();
  
  arm9.follow(); arm9.display();
  arm10.follow(); arm10.display();
  arm11.follow(); arm11.display();
  arm12.follow(); arm12.display();
  
  if(minCount == minute()) {
    arm1.pulse(); arm2.pulse(); arm3.pulse(); arm4.pulse();
    arm5.pulse(); arm6.pulse(); arm7.pulse(); arm8.pulse();
    arm9.pulse(); arm10.pulse(); arm11.pulse(); arm12.pulse();
  }
  else {
    minCount = minute();
    pRadius = 0;
    pRadius2 = 70;
  }
  
  if(hourCount != hour()) {
    colorRange = (24-hour())*10;
    hourCount = hour();
  }
  else{colorRange = (24-hour())*10;}
  
  stroke(random(colorRange, 255), random(colorRange, 255), 255);
  strokeWeight(random(0,3));
  
}



class Arm {
  float posX;
  float posY;
  float folPosX;
  float folPosY;
  float posDifX;
  float posDifY;
  float folDifX;
  float folDifY;
  float secSpeed;
  float radX;
  float radY;
  float tipX;
  float tipY;
  float difFolTipX;
  float difFolTipY;

    Arm(float tempSecSpeed, float tempRadX, float tempRadY) {
    secSpeed = tempSecSpeed;
    radX = tempRadX;
    radY = tempRadY;
  }
  
  void display() {
    line(posX, posY, tipX, tipY);
  }
  
  void follow() {
    posDifX = mouseX - posX; 
    posDifY = mouseY - posY; 
    if(folPosX >= posX) {
      difFolTipX = folPosX - tipX + 3*second();
    }
    else {
      difFolTipX = folPosX - tipX - 3*second();
    }
    
    if(folPosY >= posY) {
      difFolTipY = folPosY - tipY + 3*second();
    }
    else {
      difFolTipY = folPosY - tipY - 3*second();
    }
    folDifX = posX - folPosX + radX*.7*second();
    folDifY = posY - folPosY + radY*.7*second();  
    folPosX = folPosX + folDifX/secSpeed; //calculates end of line segment x coordinate
    folPosY = folPosY + folDifY/secSpeed; //calculates end of line segment y coordinte
    posX = posX + posDifX/secSpeed;//calculates center X coordinate
    posY = posY + posDifY/secSpeed;//calculates center Y coordinate
    tipX = tipX + difFolTipX/15;
    tipY = tipY + difFolTipY/15;
  }
  
  
  void pulse() {
    pRadius = pRadius + 3; //speed of initial outward blast
    if(pRadius != 0){
      pRadius2 = pRadius2 - .7; //speed of "shock wave"
    }
    else {pRadius2 = 0;}
    ellipse(tipX, tipY, pRadius, pRadius);
    ellipse(tipX, tipY, pRadius2, pRadius2);
  }
}



