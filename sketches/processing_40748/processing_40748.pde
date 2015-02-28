


int hours;
int minutes;
int seconds;

void setup() {
  size(600, 600);
  colorMode(HSB,255);
  background(0);
  smooth();
}

void draw() {
 
   // get system variables
 hours = hour();
 minutes = minute();
 seconds = second();
 
 println(hours + " " + minutes + " " + seconds);
    
    // fix for 24 hour clock
  if(hours > 12) {
   hours -= 12; 
  }
   background(0);
  
  //center
  translate(300,300);
  //if
  
 if (minutes > 1 && minutes < 15){
   arc(0,0, 500, 500, TWO_PI-PI/2, TWO_PI);
   stroke(color (random(150)));
 }
 else if (minutes > 15 && minutes < 30){
 arc(0, 0, 500, 500, 0, PI/2);
  stroke(color (random(150)));
}
  else if (minutes > 30 && minutes < 45){
  arc(0,0, 500, 500, PI/2, PI);
  stroke(color (random(150)));
  }
  
  else if (minutes > 45 && minutes < 59){
    arc(0,0, 500, 500, PI, TWO_PI-PI/2);
  stroke(color (random(150)));
  }

//
noFill();

 //second C
  strokeWeight(14);
  stroke(seconds*4.25,90,220);//second C color change
   pushMatrix();
  scale(radians(6 * seconds));
  ellipse(0,0, 120 ,120);
  scale( 60);
  popMatrix();
  fill(0);
   
   // hour hand
  strokeWeight(6);
  stroke(#a58ade);
  pushMatrix();
  rotate(radians(30 * hours));
  line(0,-100,0,0);
  ellipse(0,-200, 50 ,50);
  popMatrix();
  
  // minute hand
  strokeWeight(7);
  stroke(#8ac3de);
  pushMatrix();
  rotate(radians(6 * minutes));
  line(0,-180,0, 0);
  ellipse(0,-260, 50 ,50);
  popMatrix();
  
  ellipse(0, -200, 20,20); //15
  ellipse(200, 0, 20,20); //30
  ellipse(0, 200, 20,20);//45
  ellipse(-200, 0, 20,20);//60

}

