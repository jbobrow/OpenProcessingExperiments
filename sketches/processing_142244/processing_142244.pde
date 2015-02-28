
/*
 Konkuk University
 SOS iDesign

Name:Hong Ji Yae 
 ID: 201420117 
*/


 import ddf.minim.*;

 

Minim minim;

AudioInput in;

float volume = 0;
float volumeF = 0;

void setupAudio(){

minim = new Minim(this);

in = minim.getLineIn(Minim.MONO, 512);

}

void getVolume(){

volumeF = in.right.level()*1000;

volume = 0.8*volume + 0.8*volumeF;

}

void stop(){

in.close();

minim.stop();

super.stop();

}


void setup(){
size (600, 600);
 setupAudio();
background(255,243,3);
 // noLoop();

smooth();
frameRate(10);

 }



 int value = 0;
 



void draw(){

float mx = constrain(mouseX, 30, 70);
 colorMode(RGB,mouseX/(width/255),mouseY/(height/255),255);
  
  fill(255,243,3);
noStroke();
quad(0,0,0,600,600,600,600,0);

  
  
 strokeWeight(5);
 stroke(0);
 fill(118,10,11);
 bezier(94,201,177,550,448,550,522,210);
fill(255,243,3);
 bezier(94,201,95,350,490,350,522,210); 
 
  
  noStroke();
  

  float v = random(-10,10);
  v=random(-10,10);
 
 
 
 
 
  fill(value);
  quad(143+v,80+v,152+v,74+v,172,100,161,104);
  quad(197+v,61+v,208+v,60+v,208,97,197,95);
  quad(252+v,78+v,262+v,81+v,251,107,239,103);
  quad(341+v,84+v,349+v,78+v,361,105,349,108);
  quad(395+v,58+v,408+v,61+v,406,95,392,95);
  quad(452+v,78+v,460+v,83+v,446,104,436,101);
 
 stroke(0);
  strokeWeight(3);
  fill(255);
  ellipse(200,184,197,179);
  ellipse(405,184,197,179);
 
  
   float eyeLeftX = constrain (mouseX,358,465);
float eyeLeftY = constrain (mouseY,140,245);
float m = map(value, 300,100,400,200);
float eyeRightX = map(mouseX,0,width,358,465);
float eyeRightY = map(mouseY,0,width,140,245);
 
  fill(30,163,232);
  ellipse(eyeLeftX,eyeLeftY,82,62);
  fill(30,163,232);
  ellipse(eyeLeftX-200,eyeLeftY,82,62);
 fill(0);
 ellipse(eyeLeftX,eyeLeftY,41,28);
  fill(0);
  ellipse(eyeLeftX-200,eyeLeftY,44,31);
  
  
  
  strokeWeight(5);
  fill(255,243,3);
  bezier(292,268,279,231,270,180,304,187);
  bezier(322,269,335,234,335,180,304,187);
 noStroke();
 quad(299,197,312,192,327,225,318,259);
 quad(486,198,513,204,503,239,482,229);
 
 
 
 strokeWeight(7);
 stroke(180,77,29);
bezier(66,232,20,212,30,187,94,177);
bezier(118,235,170,217,150,185,94,177);
bezier(546,237,600,215,559,170,510,181);
bezier(490,241,457,221,466,194,510,181);


point(67,191);
 point(114,188);
 point(497,194);
 point(543,194);

noStroke();
fill(255,243,3);
quad(98,191,118,194,125,225,111,235);

 
 


 strokeWeight(3);
 stroke(0);
 bezier(77,205,88,200,97,200,107,205);
 bezier(506,212,514,210,526,208,532,214);
  
  fill(255);
quad(298,318,298+v,339+v,243+v,339+v,245,312);
quad(314,318,314+v,339+v,365+v,339+v,361,315);

fill(250,154,154);
bezier(186,400,250,380,272,400,308,410);
bezier(308,410,350,385,402,380,430,400);
bezier(212,406,185,482,224,509,305,510);
bezier(305,510,410,502,420,463,413,408);
noStroke();
quad(220,402,228,482,307,508,308,412);
quad(308,412,286,508,386,485,412,406);
quad(291,495,293,508,323,506,330,488);
quad(325,403,298,424,413,428,408,397);
quad(267,401,304,414,214,420,218,398);
quad(190,399,207,416,216,402,190,399);
quad(409,399,418,420,433,403,418,398);
stroke(250,154,154);
noFill();
bezier(134,349,146,382,170,410,202,436);
bezier(416,443,449,419,478,380,493,345);


float dia =50;


if(mousePressed){
  
  
  
  
    float a=random(300); 
    float b=random(255); 
    float c=random(150); 
     

  strokeWeight(14);
  stroke(pmouseX,50,pmouseY,50);
  fill(constrain(mouseX,mouseY,a),b,c);
  ellipse(mouseX,mouseY,dia,dia);
  ellipse(mouseX,height-mouseY,dia,dia);
  ellipse(width-mouseX,mouseY,dia,dia);
    ellipse(width-mouseX,height-mouseY,dia,dia);


fill(constrain(mouseX,mouseY,a),b,c);

}

    getVolume(); // this call fetches the microphone volume for the current frame.

float Y = map(volume, 0, 200, 2, 100); // With the map we can use it!

float X = map(volume, 0, 200, 2, 200); // The same we apply to create an Y variable.
 noStroke();
  fill(132,147,49);
  ellipse(58,105,X,Y);
  ellipse(51,145,X,Y);
  ellipse(88,331,X,Y);
  ellipse(100,376,X,Y);
  ellipse(533,105,X,Y);
  ellipse(533,322,X,Y);
  ellipse(512,388,X,Y);
}


void mouseWheel(MouseEvent event) {
  float e = event.getAmount();
  println(e);
}




void mouseMoved() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}

void keyPressed(){

  if(keyPressed){
  setup();
  
  
}

  
 
  
}
  
 

  void mouseDragged() {
  value = value + 5;
  if (value > 255) {
    value = 0;
  }
}




   void mousePressed() {
 
     float a=random(255);
    stroke(0);
    fill(a);
    bezier(300,41,270,17,252,36,297,93);
    bezier(300,41,330,20,359,49,297,93);
    


  }
 
