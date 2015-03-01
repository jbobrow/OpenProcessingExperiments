
PImage img1;
PImage img2;
PImage img3;
int m =234 ;
float b = 340.0;//boy's arm

//for Orbit

int i = 0;
int j = 0;
//ball1
int deg = 1;
int radius = 20;
//ball2
int degb = 180;
int radiusb = 20;
//balls on left
int degL = 180;
int radiusL = 20;
int degLb = 180;
int radiusLb = 20;



void setup(){
  size(640,512);
  img1 = loadImage("wave2.png"); 
  img2 = loadImage("robot.png"); 
  img3 = loadImage("wave.png"); 

  
  
}





void draw(){

  
  
background(#ededed);
  

pushMatrix();
noStroke();





fill(#FF9100);
ellipse(150,256,40,150);
fill(#00A8FF);
ellipse(490,256,40,150);
  
popMatrix();
  
  
//-------------------------boy's arm---------------
pushMatrix();
  stroke(#8b8b8b);
  strokeWeight(18);
  
  
  if(abs(mouseY-256)<(mouseX-320)/3 && mouseX< 640 )
  {
    //long arm
    line(320, 256, mouseX, mouseY);  
    line(-20, 256, mouseX-b, mouseY);
  }else{
    
    
  //short arm  
  line(320, 256,320+70*(mouseX-320)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256)),256+70*(mouseY-256)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256)));
  }
  
  strokeWeight(0);
  
  //robot's hands
  
  if(abs(mouseY-256)<(mouseX-320)/3 && mouseX< 640 )
  {
    fill(#b3b3b3);
    ellipse(mouseX,mouseY,15,15);
    ellipse(mouseX-340,mouseY,15,15);
    fill(#363636);
    ellipse(mouseX,mouseY,9,9);
    ellipse(mouseX-340,mouseY,9,9);
    
  }else{
    fill(#b3b3b3);
    ellipse(320+70*(mouseX-320)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256)),256+70*(mouseY-256)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256)),15,15);
    fill(#363636);
    ellipse(320+70*(mouseX-320)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256)),256+70*(mouseY-256)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256)),9,9);
  }
popMatrix();


//   ---------------------------------balls----------------------------------------------

if(abs(mouseY-256)<(mouseX-320)/3 && mouseX< 640 ){
  
  
//--------------------------real ball--------------------  
  //ball1
  pushMatrix();
  float angle = radians(deg);
  float x = mouseX + (cos(angle)*radius);
  float y = mouseY + (sin(angle)*radius);
  deg = deg + 5;
  //rotate(HALF_PI/2);
  translate(x,y);
  fill(#008AFF);
  ellipse(0,0,10,10);
  popMatrix();
  //ball2
  pushMatrix();
  float angleb = radians(degb);
  float a = mouseX + (cos(angleb)*radiusb);
  float b = mouseY + (sin(angleb)*radiusb);
  degb = degb - 5;
  //rotate(HALF_PI/2);
  translate(a,b);
  fill(#FA0505);
  ellipse(0,0,10,10);
  popMatrix();



//------------------balls from orange door---------------------
  pushMatrix();
  float angleL = radians(degL);
  float xL = mouseX-340 + (cos(angleL)*radiusL);
  float yL = mouseY + (sin(angleL)*radiusL);
  degL = degL + 5;
  //rotate(HALF_PI/2);
  translate(xL,yL);
  fill(#008AFF);
  ellipse(0,0,10,10);
  popMatrix();

  //ball2
  pushMatrix();
  float angleLb = radians(degLb);
  float aL = mouseX-340 + (cos(angleLb)*radiusLb);
  float bL = mouseY + (sin(angleLb)*radiusLb);
  degLb = degLb - 5;
  //rotate(HALF_PI/2);
  translate(aL,bL);
  fill(#FA0505);
  ellipse(0,0,10,10);
  popMatrix();
}else{
  
  
  pushMatrix();
  float angle = radians(deg);
  float x = (320+70*(mouseX-320)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256))) + (cos(angle)*radius);
  float y = (256+70*(mouseY-256)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256))) + (sin(angle)*radius);
  deg = deg + 5;
  //rotate(HALF_PI/2);
  translate(x,y);
  fill(#008AFF);
  ellipse(0,0,10,10);
  popMatrix();

  //ball2
  pushMatrix();
  float angleb = radians(degb);
  float a = (320+70*(mouseX-320)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256))) + (cos(angleb)*radiusb);
  float b = (256+70*(mouseY-256)/sqrt((mouseX-320)*(mouseX-320)+(mouseY-256)*(mouseY-256))) + (sin(angleb)*radiusb);
  degb = degb - 5;
  //rotate(HALF_PI/2);
  translate(a,b);
  fill(#FA0505);
  ellipse(0,0,10,10);
  popMatrix();
  
}




//-----------------------Front image-----------------------
  
  
pushMatrix();
noStroke();

fill(#ededed);
//cover blue arm
rect(490,0,640,512);
//cover orange arm
rect(0,0,150,512);
fill(#FF9100);
arc(150,256,40,150,HALF_PI, PI+HALF_PI);
fill(#00A8FF);
arc(490,256,40,150,PI+HALF_PI,TWO_PI);
arc(490,256,40,150,0, HALF_PI);

imageMode(CORNERS);
if(m>186){
  image(img1, 486,m);
  image(img3, 150,m); //
  m=m-1;
}else{
  m=234;
}


image(img2,256,217);
fill(#ffae00);
rect(302,226,26,16,2);
rect(332,226,26,16,2);
fill(#cacaca);
ellipse(150,375,40,6);
ellipse(490,375,40,6);

if(mouseX>600 && mouseY>210 && mouseY<356){
  image(img2,random(254,258),random(215,220));
  fill(random(255),random(255),0);
  rect(302,226,26,16,2);
  rect(332,226,26,16,2);
  
}

popMatrix();

//save("space.png");  
}


