
//DECLARE VARIABLES
float xPos1;
float yPos1;
float radius1;

float xPos2;
float yPos2;
float radius2;
float speed2;
float speed1;

void setup() {
  size(600,600);
  background(97,195,289);
 
  xPos1 = random(0,600);
  yPos1 = random(0,600);
  radius1 = random(30,51);
  speed1 = 7;
  xPos2 = random(0,600);
  yPos2 = random(0,600);
  radius2 = random(30,51);
  speed2 = 9;
}

void draw() {
  background(68,184,224);
    noStroke();
    fill(random(0,255),225,225);
    ellipse(xPos2, yPos2,radius2,radius2);
    
    xPos2+=speed2; //xPos = xPos + 3;s
    yPos2+=speed1; //yPos = yPos + 1;
   
    
  if ((xPos2<  0)||(xPos2 >  600)) { speed2 = - speed2; }
  if ((yPos2< 0)||(yPos2 > 600)) { speed1 = - speed1; }
  
}
