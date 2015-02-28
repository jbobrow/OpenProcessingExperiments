
float x1= 280;  
float y1=300; 
float x2= 280;  
float y2=200; 
float speed = 15;
float speed2 = -15;



 
 
void setup() {
  frameRate (10); 
  size (500, 500);
}
void draw () {
  background (101,97,97);
  move1 (); 
  move2 (); 
  bounce (); 
  bounce2 (); 


  drawCar (x1, y1, 100, color (255, 40, 200)) ;
  drawCar (x2, y2, 50, color (80, 200, 200)) ;

 
 

  noStroke();
  fill (100,255,0);
  for(int h=16; h<=height; h+=30) {
    rect(h,250,15,3);
  }
  rectMode(CENTER);
  fill (255,164,100);
  rect(width/2,0,width,290);
 
  rect(width/2,500,width,290);
      stroke(0);
      fill(101,97,97);
    rect( 250,0,150,1000);
    noStroke();
    fill( 55,234,7);
    rect( 250,0,5,40);
    rect( 250,50,5,20);
    rect( 250,100,5,20);
    rect( 250,150,5,20);
    rect( 250,200,5,20);
    rect( 250,250,5,20);
    rect( 250,300,5,20);
    rect( 250,350,5,20);
    rect( 250,400,5,20);
    rect( 250,450,5,20);
    rect( 250,500,5,20);
    rect( 250,550,5,20);
    fill( 200,30,120);
    fill(120,120,225);
    rect(215,250,40,60);
    fill(241,250,3);
    rect(205,220,15,5);
    rect(225,220,15,5);
    fill(0);
    rect( 190,235,10,15);
    rect( 190,275,10,15);
    rect( 240,275,10,15);
    rect( 240,235,10,15);
    fill(255,255,60);
    rect(260,160,70,40);
    fill(40,180,200);
    rect(215,160,20,25);
    fill(0);
    rect( 240,135,15,10);
    rect( 240,185,15,10);
    rect( 280,135,15,10);
    rect( 280,185,15,10);
    fill(3,250,29);
    rect(215,350,40,60);
    fill(241,250,3);
    rect(205,320,15,5);
    rect(225,320,15,5);
    fill(0);
    rect( 190,330,10,15);
    rect( 190,370,10,15);
    rect( 240,370,10,15);
    rect( 240,330,10,15);
    fill(250,3,7);
    rect(215,450,40,60);
    fill(241,250,3);
    rect(205,420,15,5);
    rect(225,420,15,5);
    fill(0);
    rect( 190,435,10,15);
    rect( 190,475,10,15);
    rect( 240,475,10,15);
    rect( 240,435,10,15);
    fill(255,10,255);
    rect(290,60,40,60);
     fill(241,250,3);
     rect(280,90,15,5);
     rect(300,90,15,5);
    fill(0);
    rect( 265,40,10,15);
    rect( 265,80,10,15);
    rect( 315,80,10,15);
    rect( 315,40,10,15);
    
   
}
 
 

void move1 () {
  x1 = x1 +speed; 
}
 
void move2 () {
  x2 = x2 +speed2; 
}
 
void bounce () {
  if ((x1>width+100) || (x1<-100)) {
    speed = speed * -1;
  }
}
 
void bounce2 () {
  if ((x2>width+100) || (x2<-100)) {
    speed2 = speed2 * -1;
  }
}
void display () {
  drawCar (x1, y1, 64, color (200, 200, 0)) ;
  drawCar (x2, y2, 64, color (200, 200, 0)) ;

}
 
 
void drawCar (float x, float y, float thesize, color c) {
  float offset = thesize/4; 
  rectMode (CENTER);
  stroke (0);
  fill (c); 
  rect (x, y, thesize, thesize/3);

  fill(0);
  rect (x-offset, y-offset, offset, offset/2);
  rect (x+offset, y-offset, offset, offset/2);
  rect (x-offset, y+offset, offset, offset/2);
  rect (x+offset, y+offset, offset, offset/2);
  
 
}
