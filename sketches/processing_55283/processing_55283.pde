
//* By Erika with help from JoyceDang 
//*http://www.openprocessing.org/sketch/53192

//unchanging elements
size(250,250);
background(1,0,70);
smooth();
noStroke();
 
//rectangles drawn from the center
rectMode (CENTER);
translate(160,140);
 
//this defines the loop, where x is greateer than 0, x decreases by 10
for(int x=880; x>0;x-=10){
   
  fill((x-275)*-0.75,0,70);

  rect(0,0,x,x);
 
  rotate (0.75);
}


