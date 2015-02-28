
void setup(){

size(500,500);


}
void draw(){
background(0);

noStroke();
pushMatrix();
fill(#ffffff);
ellipse(250,250,400,400);
fill(0);
ellipse(250,250,300,300);
fill(#ffffff);
ellipse(250,250,150,150);



fill(#ffffff);
ellipse(250,250,20,20);

fill(0);
rect(225,50,50,60);
rect(50,225,60,50);
rect(390,225,60,50);
rect(225,390,50,60);
popMatrix();

  translate (width/2, height/2);
  
  float sek = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0, 60, 0, 360);
  float std = map(hour(), 0, 12, 0, 360);
 

 pushMatrix();
  stroke (#4DFF03);
  strokeWeight (1);
  rotate (radians(sek));
  translate (0, -180);
  rect (0, 0, 1, 180);
  popMatrix();
  //Sekunde
  
  pushMatrix();
  stroke (#4DFF03);
  strokeWeight (3);
  rotate (radians(min));
  translate (0, -140);
  rect (0, 0, 1, 140);
  popMatrix();
  //Minute
  
  pushMatrix();
  strokeWeight (5);
  rotate (radians(std));
  translate (0, -75);
  rect (0, 0, 1, 75);
  popMatrix();
  resetMatrix();
  //Stunde 

 
  
 
  

//translate(-250,-250);

}
