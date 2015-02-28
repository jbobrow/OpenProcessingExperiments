
boolean flipFlop = false;
String keyPrompt = "press any key";
float browHeight[] ={-15,-25};
float mouthWidth[] ={25,100};
float mouthHeight[] ={5,15};
float buttonColorR[] ={0,255};
float buttonColorG[] ={0,255};
float buttonColorB[] ={0,255};
float lightColorR[] ={0,255};
float lightColorG[] ={0,255};
float lightColorB[] ={0,255};
float eyeColorR[] ={0,255};
float eyeColorG[] ={0,255};
float eyeColorB[] ={0,255};
float _browHeight = -15;
float _mouthWidth = 100;
float _mouthHeight = 5;
float _buttonColorR = 0;
float _buttonColorG = 255;
float _buttonColorB = 0;
float _lightColorR = 0;
float _lightColorG = 255;
float _lightColorB = 0;
float _eyeColorR = 100;
float _eyeColorG = 150;
float _eyeColorB = 255;

void setup(){
size(300,300);
background(255);
textSize(12);
}

void draw(){
  makeFace();
  smooth();
  text(keyPrompt,-145,-135);
}

void keyPressed(){
  _browHeight = random(browHeight[0],browHeight[1]);
  _mouthWidth = random(mouthWidth[0],mouthWidth[1]);
  _mouthHeight = random(mouthHeight[0],mouthHeight[1]);
  _buttonColorR = random(buttonColorR[0],buttonColorR[1]);
  _buttonColorG = random(buttonColorG[0],buttonColorG[1]);
  _buttonColorB = random(buttonColorB[0],buttonColorB[1]);
  _lightColorR = random(lightColorR[0],lightColorR[1]);
  _lightColorG = random(lightColorG[0],lightColorG[1]);
  _lightColorB = random(lightColorB[0],lightColorB[1]);
  _eyeColorR = random(eyeColorR[0],eyeColorR[1]);
  _eyeColorG = random(eyeColorG[0],eyeColorG[1]);
  _eyeColorB = random(eyeColorB[0],eyeColorB[1]);
  keyPrompt = ("");
}

void makeFace(){
  background(255);
  noStroke();
  rectMode(CENTER);
  translate(150,150);
fill(200,190,200);
rect(0,0,150,150);
//eyes
fill(255);
ellipse(-35,0,40,40);
ellipse(35,0,40,40);
fill(_eyeColorR,_eyeColorG,_eyeColorB);
ellipse(-35,0,25,25);
ellipse(35,0,25,25);
fill(0);
ellipse(-35,0,20,20);
ellipse(35,0,20,20);
//brows
rect(-35,-15,50,15);
rect(35,_browHeight,50,15);
//mouth
rect(0,50,_mouthWidth,_mouthHeight);
//neck
fill(200,190,200);
rect(0,90,30,35);
//arms
rect(118,150,25,100);
rect(-118,150,25,100);
fill(170,160,170);
ellipse(100,100,75,25);
ellipse(-100,100,75,25);
ellipse(400,0,40,40);
ellipse(400,0,40,40);
//"ears"
ellipse(75,0,15,150);
ellipse(-75,0,15,150);
//shoulders
fill(200,190,200);
rect(0,120,200,75);
//antenna
ellipse(0,-75,10,10);
ellipse(10,-75,10,10);
ellipse(20,-75,10,10);
ellipse(30,-75,10,10);
ellipse(40,-75,10,10);
ellipse(50,-75,10,10);
ellipse(60,-75,10,10);
ellipse(70,-75,10,10);
ellipse(-10,-75,10,10);
ellipse(-20,-75,10,10);
ellipse(-30,-75,10,10);
ellipse(-40,-75,10,10);
ellipse(-50,-75,10,10);
ellipse(-60,-75,10,10);
ellipse(-70,-75,10,10);
rect(0,-100,5,60);
fill(_lightColorR,_lightColorG,_lightColorB);
ellipse(0,-135,18,20);
//nose
fill(170,160,170);
triangle(0,0,-15,40,15,40);
//chest/buttons
rect(0,120,150,60);
fill(255,0,0);
ellipse(-50,120,15,15);
fill(0);
rect(-50,140,18,18);
fill(_buttonColorR,_buttonColorG,_buttonColorB);
ellipse(-35,125,5,5);
ellipse(-25,125,5,5);
ellipse(-15,125,5,5);
ellipse(-5,125,5,5);
ellipse(5,125,5,5);
ellipse(15,125,5,5);
ellipse(25,125,5,5);
ellipse(35,125,5,5);
ellipse(-35,135,5,5);
ellipse(-25,135,5,5);
ellipse(-15,135,5,5);
ellipse(-5,135,5,5);
ellipse(5,135,5,5);
ellipse(15,135,5,5);
ellipse(25,135,5,5);
ellipse(35,135,5,5);
ellipse(-35,145,5,5);
ellipse(-25,145,5,5);
ellipse(-15,145,5,5);
ellipse(-5,145,5,5);
ellipse(5,145,5,5);
ellipse(15,145,5,5);
ellipse(25,145,5,5);
ellipse(35,145,5,5);
}



