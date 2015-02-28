
void setup(){
size (300, 300);
}
void draw(){
int x = 100;
int y = 60;
background(164, 186, 216);
if (x<200){
  noStroke();
  if (mouseY<30){
  fill(211, 92, 13);    //circle top left 
  }
  else if(mouseY>50){
    fill(164, 186, 216);
  }
  
  ellipse(10, 10, 150, 150);
}

if ( x < 50){
ellipse( 100, 50, 20, 70);
//false
}
if (mouseY <= 280 ){
fill (211, 92, 13, mouseY-50);
ellipse(300, 300, 200, 200);
}

if ( mouseY < 200 ){
  fill(211, 92, 13, mouseY-50);
  ellipse(300, 300, 300, 300);
}

if ( mouseY < 150 ){
  fill(211, 92, 13, mouseY-50);
  ellipse(300, 300, 400, 400);
}
 
 if (x>50) {
   if (mouseY<100){
   fill(211, 92, 13, mouseY-50);
   ellipse(300, 300, 500, 500);
 }
 
 if (x > 50) {
 if (mouseY<80){
   fill(211, 92, 13, mouseY-20);
   ellipse(300, 300, 600, 600);
 }
 
  if (x > 50) {
 if (mouseY<60){
   fill(211, 92, 13, mouseY-20);
   ellipse(300, 300, 700, 700);
 }
 
 
 
 if(mouseY>280){    //bottom line
 stroke(60);
 strokeWeight(12);
   line(0, 260, 300, 350);  
 }
 
if( x <=120 ){   
  if (mouseY>200){
  stroke(80);
  strokeWeight(8);
    line(0, 200, 300, 190);
 } 

 
if((x<50) || (y > 30)){   //second line from bottom
  if (mouseY>150){
  stroke(100);
  strokeWeight(6);
  line( 40, 150, 260, 130);
}

 
 
 if (y > 40 ){
   if ( mouseY>100){
   stroke(140);
   strokeWeight(4);
   line( 50, 125, 200, 70);
 }

 
if (x >50){
  if (mouseY>80){
  stroke(160);
  strokeWeight(2);
  line (60, 100, 150, 50);
}


if ((x>10) && (y>20)){
  if (mouseY>60){
  stroke(200);
  strokeWeight(1);
  line (60, 80, 100, 40);
}

if ((x >40) || (y>=60)){   //top line
  if (mouseY>40){
  stroke(230);
  strokeWeight(.5);
  line( 40, 60, 60, 30);
}
}
}
}
}
}
}
}
}
}
}


