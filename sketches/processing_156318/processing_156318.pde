
void setup() {  //setup function called initially, only once
  size(500,600);
 
 }
 
void draw() {  
  background(255,0,0); 
  
 
   
  //the left eye
   fill(200,250,250);
  rect(60,50,100,100);

   fill(87,7,87);
  ellipse(109,100,70,70);
 
  
  //the right eye
  fill(200,250,250);
  rect(325,50,100,100);
  
//outline of the suit 
  fill(10,15,23);
  rect(0,375,500,10);
  
  //the beginning of tie
  fill(10,150,33);
  triangle(210, 380, 270, 380,240, 450);
  
  //the middle of the tie
  fill(23,23,79);
  triangle(200,500,270,500,240,450);
  
  //the end of the tie
  fill(250,250,250);
  triangle (200,500,270,500,235,550);
 //the wink
  if (mousePressed){
  fill(0,0,0);
  rect(325,90,100,10);
  
} else {

 fill(87,7,87);
 ellipse(375,100,70,70);
}

//the wink face
if(mousePressed){

 fill(250,250,250);
 ellipse(240,200,70,70);
 } else {
 
 fill(26,54,96);
 rect(170,200,145,10);
 }
}


