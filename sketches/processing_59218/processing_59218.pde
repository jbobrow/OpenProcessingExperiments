
int SIZE=450; //width and height of the window
float C=0.5*SIZE; //center coordinate of the window
float D=SIZE-100; //diameter of circular cavity
float R=0.5*D; //radius of circular cavity
float halfarcextent=0.1*PI; //half the angular extent of the arc
boolean isgateon=false; 
boolean isoccluded=false;
boolean readytocollide=true;

float speed=8.0; //speed of about 8.0 is good, with a gravity factor something lower is better
float gravityfactor=-.0; //unknown unit, somewhere between -0.1 and -1.0 is reasonable
int ballR=10; //ball radius

float posx=C+random(-100.0,100.0), posy=C+random(-100.0,100.0); //ball positions x and y, with random initial starting coordinates
float vx=random(0,1.0), vy=sqrt(speed*speed-vx*vx); // ball speeds vx and vy, with random starting speeds normalized to make a correct final speed

float disttowall; //used later in computation of how close ball is to wall

void setup()
{
  size(SIZE,SIZE);  //setup window
  smooth(); //makes things not look pixellated
  
  drawenvironment(); //runs my drawenvironment() function to draw the bouncy cave (see below) 
  
  //isgateon=true;
}

void draw() {
  drawenvironment();
  if (isgateon) drawgate();
  drawball();
  
  posx+=vx;
  posy+=vy;
  vy-=gravityfactor;
  
  disttowall = R - sqrt((posx-C)*(posx-C)+(posy-C)*(posy-C)) - ballR;
  
  if (disttowall<0 && readytocollide) {
    float ballradialpos = sqrt((posx-C)*(posx-C)+(posy-C)*(posy-C));
    
    float vdotn = (vx*(posx-C)+vy*(posy-C))/ballradialpos;
    vx=vx-2*vdotn*(posx-C)/ballradialpos;
    vy=vy-2*vdotn*(posy-C)/ballradialpos;
    
   //change speed randomly 
    //speed=speed+random(-3.0,3.0);

    //force to be the right speed
    //vy=(vy/abs(vy))*sqrt(speed*speed-vx*vx);
    
    readytocollide=false;
  } else {
    readytocollide=true;
  }

//display the speeds in the centre
  text(vx,C,C);
  text(vy,C,C+15);
  text(sqrt(vx*vx+vy*vy),C,C+30);
  
  if(isoccluded){
    background(0,0,0);
  }
}

void drawenvironment() {
  background(60,20,20);
  fill(255,200,200);
  noStroke();
  ellipse(C,C,D,D);
  
  rect( C, C-R*sin(halfarcextent), C, D*sin(halfarcextent));
}

void drawgate() {
   noFill();
   stroke(255,0,0);
   strokeWeight(5);
   arc(C,C,D,D,TWO_PI-halfarcextent,TWO_PI+halfarcextent);
}

void drawball() {
  fill(40,40,200);
  noStroke();
  ellipse(posx,posy,2*ballR,2*ballR);
}

void keyPressed() {
  if (keyCode==KeyEvent.VK_SPACE) { //when space is pressed
   isoccluded=!isoccluded;
  } else if (keyCode==KeyEvent.VK_SHIFT) { //when shift is pressed (untested)
    isgateon=!isgateon;
  }
}
