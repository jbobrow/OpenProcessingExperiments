
//Name:isakv
//Date:07/01/14
//project:Traffic Light

void setup() {  //setup function called initially, only once
  size(250, 250);
  
}

void draw() {  //draw function loops 
  fill(0,0,0);                 //color black
  rect(90,30,70,180);         //box for traffic light
  
  fill(255,0,0);             //color red
  ellipse(127,65,45,45);    //first light
  
  fill(244,243,111);       //color yellow
  ellipse(127,125,45,45)   //second light
  
  fill(0,255,0);          //color green
  ellipse(127,185,45,45); //third light
  
  }
 
  
