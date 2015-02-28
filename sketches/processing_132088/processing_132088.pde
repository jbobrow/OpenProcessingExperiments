
int elCount = 10;
float elWidth = 400;
float elHeight = 300;
int step = 1;
int target = 400;
void setup(){
  size(700, 700);
  noStroke();
  fill(49,176,83);
  
  //Based on this formula
 // (x+= (target - x) * .1)
}



void draw(){
  background(0,7,40);
  for(int x = 0;x < elCount; x++){
   
    ellipse((x+10)*100,350,elWidth,elHeight);
  }
  
   ellipse(350,350,elWidth,elHeight);
   
   //Height
   if(target == 400){
   elHeight += ((target - elHeight) /2.5)* .05;
   }
   else if (target == 300){
    elHeight -=  (abs(target - elHeight)) * .03;
   }
   
   if (elHeight >390){
    target = 300; 
   }
   else if (elHeight < 301){
    target = 400; 
   }
   
   //Width
   
  
}
