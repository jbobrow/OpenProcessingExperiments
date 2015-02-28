
int x, y;
int vx, vy;




///////////
float[] xBall;
float[] yBall;
color[] cBall;
int numberOfBalls = 50;
int radius=5;


///////////


void setup() {
  size(600, 600);
 x=0 ;
y=250 ;
  vx=3;
  vy=2;
  
  

  ///////
smooth();
 xBall = new float[numberOfBalls];
 yBall = new float[numberOfBalls];
 cBall = new color[numberOfBalls];
 for(int i=0;i<numberOfBalls;i++){
   xBall[i] = random(radius,100);
   yBall[i] = random(radius,100);
   cBall[i] = color(#B2EAFF);
 }


   



//////  
}





void draw() {
  background(#A2E7FF);


if (mousePressed) {
  

   background(#929EA2);
   

//////////


//  for(int i=0;i<numberOfBalls;i++){
 //  moveBall(i);
 //  drawBall(i);
   
   
   
   
 //}
 
//////////
   pushMatrix();
 scale(2);
  stroke(#D1D1D1);
  fill(#D1D1D1);
  
  
  ellipse(30, 30, 30, 20);
  ellipse(30, 70, 30, 20);

  ellipse(50, 35, 30, 20);
  ellipse(50, 65, 30, 20);

  ellipse(10, 35, 30, 20);
  ellipse(10, 65, 30, 20);

  ellipse(0, 50, 30, 20);
  ellipse(60, 50, 30, 20);

  ellipse(30, 50, 30, 20);
  
  
 //2
 ellipse(50, 130, 30, 20);
  ellipse(50, 170, 30, 20);


  ellipse(70, 135, 30, 20);
  ellipse(70, 165, 30, 20);

  ellipse(30, 135, 30, 20);
  ellipse(30, 165, 30, 20);

  ellipse(20, 150, 30, 20);
  ellipse(80, 150, 30, 20);

  ellipse(50, 150, 30, 20);

//2
 
 ellipse(250, 180, 30, 20);
  ellipse(250, 220, 30, 20);


  ellipse(270, 185, 30, 20);
  ellipse(270, 215, 30, 20);

  ellipse(230, 185, 30, 20);
  ellipse(230, 215, 30, 20);

  ellipse(220, 200, 30, 20);
  ellipse(280, 200, 30, 20);

  ellipse(250, 200, 30, 20);
  
  //2
 ellipse(250, 40, 30, 20);
  ellipse(250, 80, 30, 20);


  ellipse(270, 45, 30, 20);
  ellipse(270, 75, 30, 20);

  ellipse(230, 45, 30, 20);
  ellipse(230, 75, 30, 20);

  ellipse(220, 60, 30, 20);
  ellipse(280, 60, 30, 20);

  ellipse(250, 60, 30, 20);

  
  
 


popMatrix();



pushMatrix();

scale(3);
  stroke(#E3E3E3);
  fill(#E3E3E3);


ellipse(130, 130, 30, 20);
  ellipse(130, 170, 30, 20);

  ellipse(150,135, 30, 20);
  ellipse(150, 165, 30, 20);

  ellipse(110,135, 30, 20);
  ellipse(110, 165, 30, 20);

  ellipse(100, 150, 30, 20);
  ellipse(160, 150, 30, 20);

  ellipse(130, 150, 30, 20);
  


popMatrix();




}







  chara(x, y);

  x=x+vx ;
  y= y + vy ;


  if (x>500)vx = -vx ;
  if (x<0)vx = -vx ;

  if (y>500)vy = -vy ;
  if (y<0)vy = -vy ;


  //kao


 if (mousePressed) {
rain(x,y);
//chara3(x,y);
 }

chara3(x,y);


}




void chara(int a, int b) {
  pushMatrix();
  translate(a, b);
  scale(map(a, 0, 700, 1, 2));
  
 ////////////////////
 
  
  
  strokeWeight(1);
  fill(225);
  stroke(0);


 strokeWeight(1);
  stroke(0);


  //kao


  stroke(0, 0, 0);
  fill(255,128,0);
  //fill(mouseX, mouseY, 0);
 // fill(map(a, 0, 600, 0, 255), map( b, 0, 600, 0, 255), 0);
  ellipse(50, 50, 50, 50);
  
  
stroke(0, 0, 0);
  fill(0, 0, 0);

  ellipse(35, 50, 10, b/80);
  ellipse(65, 50, 10, b/80);
  line(55, 45, 60, 42);

  

  noFill();
  fill(255, 214, 240);
  triangle(45, 60, 52, 63, 55, 59);
  
  
    
 //yellow 
if (mousePressed) {
    fill(#FCF500);
    ellipse(50, 50, 50, 50);
    
    stroke(0, 0, 0);
  fill(0, 0, 0);

  ellipse(35, 50, 10, b/80);
  ellipse(65, 50, 10, b/80);
  line(55, 45, 60, 42);

  //mayu
  line(49, 45, 49, 47);
  line(51, 44, 51, 47);

 
 //kuti
  noFill();
  fill(255, 214, 240);
 // triangle(45, 60, 52, 63, 55, 59);
  
  
    rect(40, 60, 20, 4);
  }


  //ellipse(50,50,65,65);

  pushMatrix();
  translate(50, 50);
  scale(map(a, 0, 700, 1, 3));
  rotate(map(b, 0, 600, 0, radians(200)));

  fill(a, 128, 0);
  triangle(-5, -45, 0, -30, 5, -45);
  triangle(-5, 45, 0, 30, 5, 45);
  triangle(-45, -5, -45, 5, -30, 0);
  triangle(45, -5, 45, 5, 30, 0);
  triangle(45, -5, 45, 5, 30, 0);
  //arc(35,35,35,35,radians(-20),radians(20));
  fill(250, b, 0);
  triangle(-30, -37, -37, -30, -22, -22);
  triangle(30, -37, 37, -30, 22, -22);
  triangle(-30, 37, -37, 30, -22, 22);
  triangle(30, 37, 37, 30, 22, 22);




  popMatrix();

  popMatrix();
}










void moveBall(int idx){
  yBall[idx] += idx;
  if( yBall[idx] - radius > width){
    yBall[idx] = -radius; //gamen no hidari hashi ni idou
  }
}
void drawBall(int idx){
   stroke(cBall[idx]);
   fill(cBall[idx]);
   ellipse(xBall[idx],yBall[idx],2*radius,2*radius);
}






void chara3(int a, int b) {
  pushMatrix();
  translate(mouseX-100, mouseY-100) ;
   scale(map(a, 0, 700, 1, 2));
  strokeWeight(1);
  stroke(0);
  
 
 scale(2);
  stroke(#F2F2F2);
  fill(#F2F2F2);
  ellipse(50, 30, 30, 20);
  ellipse(50, 70, 30, 20);


  ellipse(70, 35, 30, 20);
  ellipse(70, 65, 30, 20);

  ellipse(30, 35, 30, 20);
  ellipse(30, 65, 30, 20);

  ellipse(20, 50, 30, 20);
  ellipse(80, 50, 30, 20);

  ellipse(50, 50, 30, 20);




stroke(0, 0, 0);
 fill(0, 0, 0);

////////
ellipse(36,48,2,15);
ellipse(64,48,2,15);

noFill();
  fill(255, 214, 240);
  
 rect(40, 60, 20, 4);





///////////////////



 if (mousePressed) {

   
   
 stroke(#F2F2F2);
  fill(#F2F2F2);
  ellipse(50, 30, 30, 20);
  ellipse(50, 70, 30, 20);


  ellipse(70, 35, 30, 20);
  ellipse(70, 65, 30, 20);

  ellipse(30, 35, 30, 20);
  ellipse(30, 65, 30, 20);

  ellipse(20, 50, 30, 20);
  ellipse(80, 50, 30, 20);

  ellipse(50, 50, 30, 20);





    stroke(0, 0, 0);
    fill(0, 0, 0);

////////
ellipse(36,48,2,15);
ellipse(64,48,2,15);

  
   
   
    
noFill();
fill(255,214,240);
triangle(45, 60, 52, 63, 55, 59);
  
line(55,38,60,35);
    
    
 }    





/*if (mousePressed) {
  
ellipse(35, 50, 10, b/80);
ellipse(65, 50, 10, b/80);
line(55, 45, 60, 42);


ellipse(35, 50, 10, mouseY/80);
ellipse(65, 50, 10, 5);

    //mayu

line(55, 44, 60, 43);
line(60, 43, 62, 43);

line(45, 44, 40, 43);
line(40, 43, 38, 43);


}
*/



  
  
  
  
  
  
  popMatrix();
}





void rain(int a, int b) {
  pushMatrix();
  translate(mouseX-50, mouseY+10) ;
   scale(map(a, 0, 700, 1, 2));
  strokeWeight(1);
  stroke(0);


  // scale(map(mouseX, 0, 700, 1, 3));

  for (int i=0;i<numberOfBalls;i++) {
    moveBall(i);
    drawBall(i);
  }
  popMatrix();
}



