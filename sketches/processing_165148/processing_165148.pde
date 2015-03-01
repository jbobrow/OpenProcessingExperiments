
float i=1;
float a;
float ballX = 500;
float ballY = 500;
float h = 50;
float speedY = 2;
int brush =1;
color brushcolor;
float stweight = 10;
float e=100;
float d=100;
float z=0;
float q=0;
color c=get(25,25);
float ani =0;
float ceiling = 10000;
float value = 100;
float str = 5;


void setup(){
  size(500, 500);
  colorMode(RGB);
  //background(255);
  
  //smooth();
}

void draw(){
  if (mousePressed == true) {
    if (mouseButton == LEFT){
     
      if (brush == 1) {

        frameRate(2000);
        stroke(190,250,15);
        strokeWeight(stweight);
        strokeCap(ROUND);
        //fill(brushcolor);
        line (pmouseX, pmouseY, mouseX, mouseY);};
    
   if (brush ==2) {
      frameRate(25);
      noStroke();
      fill(random(190), random(100),random(100),100-random(10));
      translate(mouseX-100,mouseY-100);
      scale(random(.9));
ellipse(mouseX, -random(ballY), h,h);
ellipse(-mouseX, random(ballY), h,h);
ellipse(mouseX, random(ballY), h,h);
ellipse(-mouseX, -random(ballY), h,h);
speedY = speedY + 0.5; 
   
  ballY = ballY + speedY;
   if (ballY > height - h) {
    ballY = height - h;

    speedY = speedY * -0.9;
  }
  else if (ballY <= 0) {
    speedY = -speedY;
  }
    }
    
if (brush ==3){
  frameRate(75);
  stroke(0);
  strokeWeight(random(6-str));
    if(e>1){
      e=e-1;
      
      d=d-1;
      noFill();
   ellipse(pmouseX,pmouseY,e,d);}
   else if (e<=1 && z<=100){
     z=z+1;
      
      q=q+1;
      noFill();
   ellipse(pmouseX,pmouseY,z,q);}
   //else {ellipse (pmouseX,pmouseY,x,y);}
 
  
   
   
     

}
  
}}};
       
void mouseReleased(){
  if(e<100){
  e=100;
d=100;
z=0;
q=0;}
}        
        
void keyReleased(){
  if (key == '1'){ brush = 1;}
  if (key == '2'){ brush =2;}
  if (key == '3'){brush =3;}
}
  
 


