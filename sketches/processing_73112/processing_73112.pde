
int hours;
int minutes;
int seconds;
float coas;
float angle =0;
float shift=100;
float wut;


void setup() {
    size (600,600);
    
    background(196,225,232);
}

void draw() {
  
  hours = hour();
  minutes = minute();
  seconds = second();
  
   float ang = radians(wut);


  coas = width/2 + (shift * cos(ang));
fill(60);

strokeWeight(3);
  stroke(0, 102, 153);
  ellipse(300, 300, coas,coas);

  wut += seconds*.2;
  
  //minutes
    strokeWeight(6);
  stroke(60, 50, 50);
  pushMatrix();
  translate(300,300);
  rotate(radians(6 * minutes));
  line(0,0,0,-450);
  popMatrix();


//hours
   strokeWeight(8);
  noStroke();
  pushMatrix();
  translate(300,300);
  rotate(radians(-90));
   fill(47,132,154,5);
  arc(0, 0, 700, 700, 0, (hours*TWO_PI/12)); 
  popMatrix();


  fill(60);

strokeWeight(3);
  stroke(0, 102, 153);
  ellipse(300, 300, coas,coas);

  wut += seconds*.2;

  
 coas = width/2 + (shift * cos(ang));
  

 
 if(hours>12) {
   hours -=12;
 }
 
 
 translate (300,300);
 rotate (radians(-90));

 strokeWeight(3);
  stroke(40, 50, 50);
  pushMatrix();
  rotate(radians(6 * seconds));
  line(0,0, -100,0);
  popMatrix();
  
  //inner
  noStroke();
   fill(12,228,244);
  ellipse(0, 0, 130, 130);
  fill(47,132,154);
  arc(0, 0, 100, 100, 0, (seconds*TWO_PI/60)); 
  fill(12,228,244,200);
  arc(0, 0, 100, 100, 0, ((seconds-3)*TWO_PI/60)); 


}
