
int mouseClick = 0;
 
float dotX = 250, dotY = 250;
float dotTX = 250, dotTY = 250;
 
void setup() {
  size(600,600);
  background(255);
  frameRate(50);
}
 
 
 


void draw () {
 

  
  if (mouseClick==0) {
    drawSomething01 ();
  } else if (mouseClick==1) {
    drawSomething02 ();
  } 
  
  
 for (int i=0; i<2; i++) {
    if (mouseClick==i) {
    
     fill(0,0,0);
    } else {
    fill(100,100,100);
    }
    stroke(5);
    
    rect(20+i*100,480,60,20);
     
  }
  
  float distance = sqrt((dotX-mouseX)*(dotX-mouseX) + (dotY-mouseY)*(dotY-mouseY));
  if (distance<50) {
    dotTX = random(500);
    dotTY = random(500);
    fill(255,255,255);
  } else {
    fill(10,90,255);
  }
  dotX = dotX + (dotTX-dotX)*0.1;
  dotY += (dotTY-dotY)*0.1;
  ellipse(dotX,dotY,200,200);
  
}
 

 
 
void mousePressed() {
   
  for (int i=0; i<2; i++) {
    if ((mouseX>20+i*100) && (mouseX<80+i*100) && (mouseY>480) && (mouseY<500)) {
      mouseClick = i;
   }
   }
  

}
 
void drawSomething01 () {

fill(100,100,100);
quad(160,40,240,0,260,40,180,80);

quad(100,100,300,180,220,380,20,300);
quad(420,60,480,40,500,100,440,120);
 
fill(130,130,130);
quad(300,220,460,140,540,300,380,380);
rect(160,420,380,100);
rect(20,480,60,20);

fill(200,200,200);
quad(20,320,60,280,80,300,40,340);
quad(40,360,120,320,140,360,60,400);
quad(220,220,400,160,420,220,240,280);
quad(300,300,540,220,560,280,320,360);
 
}
 
void drawSomething02 () {
 
fill(0,0,0);
quad(20,320,60,280,80,300,40,340);
quad(40,360,120,320,140,360,60,400);
quad(220,220,400,160,420,220,240,280);
quad(300,300,540,220,560,280,320,360);

   
}
 

