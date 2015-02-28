
//import processing.pdf.*;


float x = random(350);
float y = random(350);
float color_a =(255);
float count = 10;
// play around with the "times" number to change the amount, size
// and density of the circles.

float times = 170;
 
void setup(){  
  size(300,300);//,PDF,"final6.pdf");

  background(255);
  stroke(255);
  smooth();
  
}

void draw(){
 
while (count<times){

  count = count +1;
 
  float color_b = 100;
   
  fill (color_a,0,0,times/4);
  ellipse(x, y, count, count); 
    x = random(350);
    y = random(350);
   //println("Finished.");
   //exit();

}
}


