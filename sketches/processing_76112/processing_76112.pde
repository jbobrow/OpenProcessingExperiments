
int SIZE=600; //width and height of the window
float C=0.5*SIZE; //center coordinate of the window
float D=SIZE-100; //diameter of circular cavity
float R=0.5*D; //radius of circular cavity
float halfarcextent=0.1*PI; //half the angular extent of the arc
final float GLANCE_DURATION = 2000;
final float GATE_ON_DURATION = 1000;
final float INIT_GLANCE= 5000;
boolean readytocollide=true;
boolean isgateon=true; 
boolean isoccluded=false;
boolean gameStarted=false;
float startTime;
float gameStartTime;
float gateOnStartTime;
float speed=8.0; //speed of about 8.0 is good, with a gravity factor something lower is better
float gravityfactor=-.0; //unknown unit, somewhere between -0.1 and -1.0 is reasonable
int ballR=10; //ball radius
float posx=C+random(-100.0, 100.0), posy=C+random(-100.0, 100.0); //ball positions x and y, with random initial starting coordinates
float vx=random(0, speed), vy=sqrt(speed*speed-vx*vx); // ball speeds vx and vy, with random starting speeds normalized to make a correct final speed
float disttowall; //used later in computation of how close ball is to wall
String msg="Click here to get started";

void setup()
{
  size(600,600);  //setup window
  smooth(); //makes things not look pixellated
  PFont f = createFont("Arial",16,true); // Arial, 16 point, anti-aliasing on
  textFont(f, 20);

  //gameStartTime=millis();
  //drawenvironment(); //runs my drawenvironment() function to draw the bouncy cave (see below)
 
  isgateon=false;
 
  
}

void draw() {

  if (gameStarted == false){
    
    //start with the background cave shown
    drawenvironment();
    fill(40, 40, 200); 
    text(msg,C-100,C);
    
    //start with a blank canvas
//    fill(0);
//    text(msg,C-100,C);
//    
    if (mousePressed){
      gameStarted = true;
      gameStartTime=millis();      
    }
    
  }else{   
  
    if (millis()-gameStartTime < INIT_GLANCE) {
      isoccluded=false;
    }else if ((!isoccluded) && (millis()-startTime > GLANCE_DURATION)) {
      isoccluded = true;
    }

    if (millis()-gateOnStartTime > GATE_ON_DURATION) {
      isgateon=false;
    }

    drawenvironment();  
    if (isgateon) drawgate();
    drawball();
  
    moveball();
  
    //display the speeds in the centre
    text(atan((posy-C)/(posx-C)),C-15, C-100);
    text(vx, C, C);
    text(vy, C, C+15);
    text(sqrt(vx*vx+vy*vy), C, C+30);
    
    if (isoccluded) {
      background(0, 0, 0);
    }
  }
}

void moveball() {
  posx+=vx;
  posy+=vy;
  vy-=gravityfactor;

  disttowall = R - sqrt((posx-C)*(posx-C)+(posy-C)*(posy-C)) - ballR;

  if (disttowall<0 && readytocollide) {
    
    if (!isgateon && posx>C && atan((abs(posy-C))/(posx-C))<halfarcextent){
      println( atan((abs(posy-C))/(posx-C)));
      exit();
    } 
    
    float ballradialpos = sqrt((posx-C)*(posx-C)+(posy-C)*(posy-C));

    float vdotn = (vx*(posx-C)+vy*(posy-C))/ballradialpos;
    vx=vx-2*vdotn*(posx-C)/ballradialpos;
    vy=vy-2*vdotn*(posy-C)/ballradialpos;

    //change speed randomly 
    //speed=speed+random(-3.0,3.0);

    //force to be the right speed
    //vy=(vy/abs(vy))*sqrt(speed*speed-vx*vx);

    readytocollide=false; //make sure the ball doesn't change direction again before it comes back within the boundary
  } 
  else {
    readytocollide=true;
  }
}

void drawenvironment() {
  background(60, 20, 20);
  fill(255, 200, 200);
  noStroke();
  ellipse(C, C, D, D);

  rect( C, C-R*sin(halfarcextent), C, D*sin(halfarcextent));
  if (gameStarted == false){
    text(msg, C, C);
  }  

}

void drawgate() {
  noFill();
  stroke(255, 0, 0);
  strokeWeight(5);
  arc(C, C, D, D, TWO_PI-halfarcextent, TWO_PI+halfarcextent);
}

void drawball() {
  fill(40, 40, 200);
  noStroke();
  ellipse(posx, posy, 2*ballR, 2*ballR);
}

//void mousePressed(){
//  println("mousePressed");
//}

void keyPressed() {
  
  println("keyPressed");
  println("Key: " + str(key) + " " + int(key) + ", KeyCode: " + keyCode);   
    
  if (keyCode==32) { //when space is pressed KeyEvent.VK_SPACE
    isoccluded=false;
    startTime=millis();
  } else if (keyCode==16) { //when shift is pressed (KeyEvent.VK_SHIFT)
//  else if (keyCode==DOWN) { //when shift is pressed 
    isgateon=true;
    gateOnStartTime=millis();
  }
 

}

