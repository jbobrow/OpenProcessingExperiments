
PFont font;
boolean eggCracked = false;

void setup() {
  setupAudio();
  size(500, 500);
  smooth();
  noStroke();
frameRate(15);
  background(255); 
  font = loadFont("Serif-48.vlw");

}



void draw() {

  
   

  //face
  fill(211, 163, 117);
  ellipse(250, 250, 280, 370);
  //nose

  fill(206, 140, 123);
  ellipse(250, 250, 40, 43);
  ellipse(250, 250, 40, 43);
  ellipse(232, 258, 20, 20);
  ellipse(268, 258, 20, 20);
  //light
  fill(222, 184, 161, 75);
  ellipse(246, 247, 30, 35);

  //leftcheek
  fill(206, 140, 123);
  ellipse(180, 255, 60, 48);
  //light
  fill(222, 184, 161, 75);
  ellipse(172, 255, 45, 47);
  //rightcheek
  fill(206, 140, 123);
  ellipse(320, 255, 60, 48);
  //light
  fill(222, 184, 161, 75);
  ellipse(313, 255, 45, 47);


float ex = 220;
float ey = 200;
float dx = constrain((mouseX-ex)/20,-14,14);
float dy = constrain((mouseY-ey)/20,-14,14);

  //lightshadowleft
  fill(222, 184, 161);
  ellipse(205, 180, 90, 90);
  //darkshadowleft
  fill(206, 140, 123);
  ellipse(220, 190, 50, 70);
  //lefteye
  fill(255, 255, 255);
  ellipse(ex, ey, 35, 45);
  noFill();
   //pupilleft
  fill(0, 0, 0);
  ellipse(ex+dx, ey+dy, 20, 25);
 

float exx = 280;
float eyy = 200;
float dxx = constrain((mouseX-ex)/20,-14,14);
float dyy = constrain((mouseY-ey)/20,-14,14);

  //lightshadowright
  fill(222, 184, 161);
  ellipse(295, 182, 90, 90);
  //darkshadowright
  fill(206, 140, 123);
  ellipse(280, 192, 50, 70);
  //righteye
  fill(255, 255, 255);
  ellipse(exx, eyy, 40, 50);
  noFill();
 //pupilright
  fill(0, 0, 0);
  ellipse(exx+dxx,eyy+dyy, 20, 25);




  //eyelids
  //mouth
  fill(209, 101, 82);
  strokeWeight(3);
  beginShape();
  curveVertex(150, 250);
  curveVertex(150, 300);
  curveVertex(200, 335);
  curveVertex(250, 345);
  curveVertex(300, 335);
  curveVertex(350, 300);
  curveVertex(350, 250);
  endShape();


  getVolume(); 
  float eggCrack = map(volume, 0, 100, 0, 40);  
  
  
  if (eggCrack > 20)
  {
    stroke(0);
    line(110, 250, 165, 200);
    line(165, 200, 210, 250);
    line(210, 250, 250, 200);
    line(250, 200, 290, 250);
    line(290, 250, 330, 200);
    line(330, 200, 390, 250);
    noStroke();

    eggCracked = true;
  }

  if (eggCracked == true) {

    background(255);
    fill(255, 255, 0);
    if(frameCount%20<1){
    ellipse(250, 250, 300, 300);
    }
    textFont(font);
    textAlign(CENTER);
    fill(0);
    text("YOLK", 250, 250);
    if (frameCount%5 == 0) {
      fill(255, 255, 0);
      ellipse(250, 250, 300, 300);
    }
  }


  //shirt
  /*
  float dx = constrain((mouseX-ex)/20, -14,14);
   float dy = constrain((mouseY-ey)/20, -14,14);
   ellipse(ex+dx,ey+dy, 20,20);
   */
}

