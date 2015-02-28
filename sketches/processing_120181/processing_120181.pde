
void setup() {
  size(500,500);  
}

void draw() {  
  
  background(160);
  
  noStroke();
  
  //führung minute
  fill(255);
    translate(width/2, height/2); 
for (int i=0; i<360; i+=6) { 
pushMatrix();
rotate(radians(i)); 
translate(0, -160); 
ellipse(0, 0, 10, 10);
popMatrix();
}

//führung sekunde
fill(255);
for (int i=0; i<360; i+=6) { 
pushMatrix();
rotate(radians(i)); 
translate(0, -220);
ellipse(0, 0, 10, 10);
popMatrix();  
}
//führung stunde
fill(255);
for (int i=0; i<360; i+=30) { 
pushMatrix();
rotate(radians(i));
translate(0, -100); 
ellipse(0, 0, 10, 10);
popMatrix();  
}
  
  
  float sec = map(second(), 0, 60, 0, 360);
  float min = map(minute(), 0,60,0,360);
  float std = map(hour(), 0,12,0,360);
  
  
 
  noStroke();
  //sekundenanzeige
  pushMatrix();
  fill(0);
 rotate(radians(sec));
translate(0,-220);
  ellipse(0,0,20,20);
 popMatrix();
 
  //minutenanzeige
  stroke(0);
  fill(#5EF011);
  pushMatrix();
  rotate(radians(min));
  translate(0,-160);
  ellipse(0,0,15,15);
  popMatrix();
  
  //stundenanzeige
  pushMatrix();
  fill(0);
  rotate(radians(std));
  translate(0,-100);
  ellipse(0,0,30,30);
  popMatrix();
  
   }

