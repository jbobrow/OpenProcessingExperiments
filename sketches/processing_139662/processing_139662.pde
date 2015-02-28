
// Brianna Jennings
// Dory

int eyeSize;
int eyeBallDiam;
int whiteEye;
boolean clicked = false;


//run once
void setup(){
size(300,300);
background(166,166,166);
}

void keyPressed(){
  clicked=! clicked;
  background(166,166,166);
}

  
void draw(){
    if (clicked == false){
      eyeSize = 5;
      eyeBallDiam = 15;
      whiteEye = 30;
    }
   if (clicked == true){
     eyeSize = 10;
     eyeBallDiam = 30;
     whiteEye = 60;
}

  translate(150,150);
  
//dark blue 
 fill(0,1,6);
 ellipse(80,0,115,35);
 ellipse(-80,0,115,35);
 noStroke();

 //yellow
 fill(30,41,100);
 ellipse(80,0,95,23);
 ellipse(-80,0,95,23);

 //med blue
 fill(252,248,0);
 ellipse(92,0,87,20);
 ellipse(-92,0,87,20);

 //her face
 fill(32,44,106);
 ellipse(0,0,75,200);

 //The Eyes
 stroke(2);
 fill(255,255,255);
 ellipse(40,-40,whiteEye,whiteEye);
 ellipse(-40,-40,whiteEye,whiteEye);
 noStroke();
 fill(186,46,142);
 ellipse(40,-35,eyeBallDiam,eyeBallDiam);
 ellipse(-40,-35,eyeBallDiam,eyeBallDiam);
 fill(56,43,71);
 ellipse(40,-35,eyeSize,eyeSize);
 ellipse(-40,-35,eyeSize,eyeSize);
 
 // The Mouth
  fill(23,30,72);
  pushMatrix();
  translate(16,-35);
  rect(-30, 50, 30, 30, 3, 6, 12, 18);
  popMatrix();

}



