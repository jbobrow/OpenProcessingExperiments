
int pupilw=0;
int pupilh=0;
int eyeballw=0;
int eyeballh=0;
int mouth=10;
int a;
int b;
int c;

//for the 'moving picture'

void setup() {  // setup() does not return a value
  size(800, 800);
  smooth();
  strokeWeight(7);
  
  
  fill(250, 210 ,200);
  ellipse(200, 250, 180, 200);
  
  
  
  
  
  
  
  
  
  
  
  
 
}

void draw() {  // draw() does not r  eturn a value

background(10,150, 255);
  fill(250, 210 ,200);
  ellipse(200, 250, 180, 200);
  
  
  
  fill(0,0,0);
  quad(100,30, 300,30, 270, 185, 130,185);
  fill(255,255,0);
  strokeWeight(0);  
  rect(120,30, a,100);
  if (a<50) {a=a+1;}
  else if (a>=50) {a=10;}
  rect(185,30, b,100);
  if (b<50) {b=b+1;}
   else if (b>=50) {b=10;}  
  rect(255,30, c,100);
  if(c<50) {c=c+1;}
  else if (c>=50) {c=10;}
  
      
  fill( 150,295, 50);
  ellipse(200, 160, 40,40);
  fill(255,0,0);
  ellipse(200,160, 25,20);
  rect(120,120,165,mouseY/20);
  fill(255,255,255);
  strokeWeight(4);
  
  //eyes
  
  ellipse(150, 250, pupilw, pupilh);
  ellipse(240, 250, pupilw, pupilh);
  fill(0,0,0);
  if (pupilw<40){pupilw=pupilw+1;}
  else if(pupilw>=40){pupilw=0;}
  if(pupilh<40){pupilh=pupilh+1;}
  else if(pupilh>=40){pupilh=0;}
  
  ellipse(150, 250, eyeballw, eyeballh);
  ellipse(240, 250, eyeballw, eyeballh);
  if(eyeballw<30) {eyeballw=eyeballw+1;}
  else if(eyeballw>=30){eyeballw=0;}
  if(eyeballh<30){eyeballh=eyeballh+1;}
  else if (eyeballh>=30){eyeballh=0;}
  

  
  

  
  drawCircle();
}

void drawCircle() {  // This function also does not return a value
  fill(500, 160,90);
  strokeWeight(10);
  line(140, 295, 180, 285);
  line(215, 285, 255, 295);
  line(135, 210, 165,215);
  line(225, 215, 255, 210);
  fill(255,0,0);
  strokeWeight(5);
  rect(170, 300, 50, mouth);
  if (mouth<50) {mouth=mouth+1;}
  else if (mouth<=50) {mouth=10;}
  
 
}
