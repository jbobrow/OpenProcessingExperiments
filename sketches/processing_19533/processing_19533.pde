
float i =0.0;//defining variable
float j;//j is given a value in the for loop therefore I do not need to give it a value here, just define it

void setup(){
  size(250, 250);
  background(70, 40, 40);
  smooth();
  noStroke();
}

void draw(){
  frameRate(25);
  
   for(j=4.0; j>0; j-=1){//4 rectangles are being made
   expanding_rectangle(i+j*50);
   //all the information 
   //needed to make the recatbgles are 
   //found in "void expanding_rectangle(float i){}
   }
  i+=5;//the rate in which the recangles are increasing
  //NOTE: it's OUTSIDE the for loop
 
 if (i>260){
   background(70, 40, 40);
   i=0.0;
   
 }
}
void expanding_rectangle(float i){
  fill(random(150), 150, 150);//colour of rectangles
    rectMode(CENTER);//rectangle starts from the centre
    rect(125, 125, i, i);
  fill(70, 40, 40);
    rect(125, 125, i-20, i-20);//rectangle the same as background colour
}

