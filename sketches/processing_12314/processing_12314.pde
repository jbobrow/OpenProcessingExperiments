
// Assignment # 2
// Name: Ying Ying Sheng (Daisy)
// E-mail: ysheng@brynmawr.edu 
// Date: 16th of September

//values of colors
int redColor=6;
int greenColor=4;
int blueColor=80;
int deltaR=1;
int deltaG=1;
int deltaB=1;

//coordinates of the top left corner <x, y>
float x,y,w,h;
float speed;
float acc;
float move;



void setup() {
  size(800,500);
  frameRate(40);
  smooth();

	x = 110;
	y = 180;
        w = 390;
        h = 110;
        speed=11;
        acc=1;
        move=0;

}

void draw() {

  
  //change in background color
 brightness(85);
 hue(222);
 saturation(75);
 background(redColor,greenColor,blueColor);
  redColor=redColor+deltaR;
  greenColor=greenColor+deltaG;
  blueColor=blueColor+deltaB;

  
  
  if (redColor==255) {
    deltaR=-1;
  }
  if (redColor==0){
    deltaR=1;
  }
  if (greenColor==255){
    deltaG=-1;
  }
  if (greenColor==0){
    deltaG=1;
  }
  if (blueColor==255) {
    deltaB=-1;
  }
  if (blueColor==0) {
    deltaB=1;
  }
  
  //road

  noStroke();
  fill(80);
  rect(0,130,width,200);
  
  noStroke();
  fill(255);
  rect(0,230,width,10);
  rect(0,130,width,10);
  rect(0,330,width,10); 
  
  rect(30,280,70,20);
  rect(270,280,70,20);
  rect(510,280,70,20);
  rect(750,280,70,20);
  rect(990,280,70,20);
  rect(1230,280,70,20);
  
  rect(30,180,70,20);
  rect(270,180,70,20);
  rect(510,180,70,20);
  rect(750,180,70,20);
  rect(990,180,70,20);
  rect(1230,180,70,20);

  
 //draw a car
  //car body
 
  stroke(0);
  strokeWeight(4);
  fill(250,226,10);
  beginShape();
  curveVertex(x+38*w/39,y+h);
  curveVertex(x+w/13,y+h);
  curveVertex(x,y+7*h/11);
  curveVertex(x+2*w/39,y+4*h/11);
  curveVertex(x+2*w/11,y+2*h/11);
  curveVertex(x+17*w/39,y);
  curveVertex(x+29*w/39,y+3*h/11);
  curveVertex(x+38*w/39,y+8*h/11);
  curveVertex(x+w,y+10*h/11);
  curveVertex(x+38*w/39,y+h);
  curveVertex(x+38*w/39,y+h);
  endShape(CLOSE);
  
  //car window1
  stroke(0);
  strokeWeight(4);
  fill(152,240,255);
  beginShape();
  curveVertex(x+15*w/39,y+7*h/11);
  curveVertex(x+10*w/39,y+7*h/11);
  curveVertex(x+3*w/13,y+6*h/11);
  curveVertex(x+3*w/13,y+5*h/11);
  curveVertex(x+10*w/39,y+4*h/11);
  curveVertex(x+w/3,y+3*h/11);
  curveVertex(x+16*w/39,y+3*h/11);
  curveVertex(x+17*w/39,y+4*h/11);
  curveVertex(x+17*w/39,y+6*h/11);
  curveVertex(x+5*w/13,y+7*h/11);
  curveVertex(x+10*w/39,y+7*h/11);
  endShape(CLOSE);
  
  //car window2
  stroke(0);
  strokeWeight(4);
  fill(152,240,255);
  
  beginShape();
  curveVertex(x+2*w/3,y+7*h/11);
  curveVertex(x+20*w/39,y+7*h/11);
  curveVertex(x+19*w/39,y+6*h/11);
  curveVertex(x+19*w/39,y+3*h/11);
  curveVertex(x+2*w/3,y+4*h/11);
  curveVertex(x+2*w/3,y+7*h/11);
  curveVertex(x+20*w/39,y+7*h/11);
  endShape(CLOSE);
  
  //front wheel
  fill(0);
  ellipse(x+31*w/39,y+h,50,50);
  //back wheel
  ellipse(x+10*w/39,y+h,50,50);
  
  //doppler effect
 x=x+speed;
 speed=speed+acc;
 
   if (x >= screen.width/2 && x < screen.width) {
     acc=-0.8;
   } else{
     acc=0.8;
   }
   
   if (x > screen.width) {
     x=-400;  
     speed=11 ;
   }
   
   //girl on the street
   //legs
   stroke(255,222,244);
   strokeWeight(6);
   line(screen.width/2-10,420,screen.width/2-10,450);
   line(screen.width/2+10,420,screen.width/2+10,450);
   
   //body
    noStroke();
   fill(188,9,129);
   beginShape();
   vertex(screen.width/2-20,360);
   vertex(screen.width/2-35,420);
   vertex(screen.width/2+35,420);
   vertex(screen.width/2+20,360);
   endShape(CLOSE);
   
   //hair
   
   fill(0);
   arc(screen.width/2,290,70,70,PI,2*PI);
   beginShape();
   curveVertex(screen.width/2-35,290);
   curveVertex(screen.width/2-35,290);
   curveVertex(screen.width/2-35+move,360);
   curveVertex(screen.width/2+35+move,360);
   curveVertex(screen.width/2+35,290);
   curveVertex(screen.width/2+35,290);
   endShape(CLOSE);
 
   //hair move
   if (x > screen.width/2-100 && x < screen.width/2+100) {
     move=move+5;
   }
     else{
       move=0;
     }
}  


void mousePressed() {
//car stop

 x=0;
 y=95;
 w=300;
 h=85;

}

