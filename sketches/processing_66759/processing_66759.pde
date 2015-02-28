

//Keion
float speedY=3;
float bombX=(390);
float bombY= -10;
float posY;
float expl= 1;
float bck=150;
float smokeA = 10;
float smokeB = 10;
int bombs = 3;
PImage bg;
int fade;


//


PFont myFont;
PFont launchFont;
boolean isGreenTrue = false;
boolean isRedTrue = false;
boolean isLaunchTrue = false;
int code01, code02, code03;

void setup() {
  background(150);
  size(600, 600);
  frameRate(72);

  myFont = createFont("Arial", 24, true);
  launchFont = createFont("Arial", 12, true);
  textFont(myFont);
  
  bg = loadImage("New-York-Cityscape.jpeg");
}

void draw() {
  background(150);
  
  fill(0, 255, 0);
  ellipse(400, 500, 80, 80);
  
  fill(255, 0, 0);
  ellipse(520, 500, 80, 80);
  
  float rG = 40;
  float distanceG = dist(400, 500, mouseX, mouseY);
  float rR = 40;
  float distanceR = dist(520, 500, mouseX, mouseY);
  float wL = 100;
  float hL = 30;
  
  if(mousePressed == true && distanceG <= rG) {
    isGreenTrue = true;
  }
  if(isGreenTrue == true) {
    textFont(myFont);
    text("ENTER COMBINATION : " + code01 + code02 + code03, width/2-150, height/2);
    PImage launchCode = loadImage("launchcode.png");
    imageMode(CENTER);
    image(launchCode, width/2 - 150, height/2 - 150);
    fill(0);
    rectMode(CORNER);
    rect(width/2 - wL/2, height/2 + 35, wL, hL);
    fill(255);
    textFont(launchFont);
    text("LAUNCH", width/2 - 25, height/2 + 55);
  }
  if(mousePressed == true && distanceR <= rR) {
    isRedTrue = true;
  }
  if(isRedTrue == true) {
    fill(255, 0, 0);
    rect(0, 0, width, height);
        for(int i = 0; i < 10; i++) {
      for(int j = 1; i < 255; i++) {
        fill(j, 0, 0);
        ellipse(random(width), random(height), i/50, i/10);
    
    fill(0);
    textFont(myFont);
    text("SYSTEM ERROR 404 !!!!!!!", width/2-100, height/2);
    text("SELF DESTRUCTION INITIATED", width/2-100, height/2+50);
      }
    }
  }
//    if(mousePressed == true && code02 == 5 && code03 == 9 && code01 == 1 
//  && mouseX >= width/2 - wL/2 && mouseX <= width/2 + wL/2 + wL && mouseY >= height/2 && mouseY <= height/2 +35)

      if(mousePressed == true && code02 == 5 && code03 == 9 && code01 == 1) {
     isLaunchTrue = true;
  }
    
      
  
    if(isLaunchTrue == true) {  

        
        nukeLaunch();
        fill(255, 0, 0);
        textFont(myFont);
        text("Nuclear launch detected", width/2 + 15, height/2-200); 
        
    }

  println(code01);
  println(code02);
  println(code03);
  println(isLaunchTrue);

} //end of draw loop

  void keyPressed() {
    
    if(key == 53 ) {
      code02 = 5;
  }
    if(key == 57 ) {
      code03 = 9;
    }
    if(key == 49 ) {
      code01 = 1;
    }
  }

void nukeLaunch() {
   background(bg);
  fill(200);
   speedY*=1.05;
   PShape b;
   b = loadShape("bomb.svg");
  b.rotate(9.4);
  posY=bombY+speedY;
  shape(b, bombX,posY, 80, 200);
  if (posY>=height) {
    noStroke();
    expl/=.95;
    fill(#FFF527);
    ellipse(width/2, height, expl, expl);
    bck+=.8;
    
   if(expl>=800){
     fill(0, fade);
     fade+=5;
    rectMode(CORNER);
  rect(0,0,width,height);
     }
  }
}

