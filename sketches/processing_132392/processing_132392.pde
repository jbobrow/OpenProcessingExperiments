
//golbalvariables
boolean flipFlop = false;
String keyPrompt = "press any key";
int eyeBallDiam;
int eyeBrowLoc;
int mouthWidth;

void setup(){
  size(300, 300);
  background(44,200,250);
  textSize(12);

}
void draw(){
 if (flipFlop == false){
    eyeBallDiam = 60;
    eyeBrowLoc = -50;
    mouthWidth = 50;
    background(20,237,194);
  }
  if (flipFlop == true){
    eyeBallDiam = 40;
    eyeBrowLoc = -30;
    mouthWidth = 30;
    background(44,200,250);
  }
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}

void keyPressed(){
flipFlop =! flipFlop;
  keyPrompt = ("");
}

void makeFace(){
translate(150,150);

//tails
fill(225,225,0);
rect(82,-80,35,300);
rect(-108,-80,35,300);

//face
fill(225,223,196);
stroke(225);
ellipse(5,0,180,180);

//rectMode(CENTER);
//fill(30,200,30);
//noStroke();
//rect(0,0, 200, 150);



//eyes
fill(225);
stroke(0);
ellipse(-25,0,eyeBallDiam,eyeBallDiam);
ellipse(25,0,eyeBallDiam,eyeBallDiam);
fill(0,225,225);
ellipse(-25,0,20,20);
ellipse(25,0,20,20);




//lips
fill(225,0,0);
ellipse(0,45,mouthWidth,15);
fill(225,223,196);
stroke(225);
line(45,45,-25,45);

//earsthings
stroke(225);
ellipse(-85,15,50,60);
ellipse(85,15,50,-60);
fill(255,255,153);
ellipse(-100,30,30,20);
ellipse(100,30,-30,20);

//hair
fill(225,225,0);
noStroke();
ellipse(100,-70,60,60);
ellipse(-90,-70,60,60);
rect(-90,-80,190,50);
ellipse(40,-80,80,60);
ellipse(-30,-80,80,60);
fill(225,223,196);
noStroke();
ellipse(100,-70,45,45);
ellipse(-90,-70,45,45);
fill(135,4,0);
noStroke();
ellipse(100,-70,35,35);
ellipse(-90,-70,35,35);

//brows
fill(112,65,57);
noStroke();
rect(-80,eyeBrowLoc,65,10);
rect(10,eyeBrowLoc,65,10);
}


