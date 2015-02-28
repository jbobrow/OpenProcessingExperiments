
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/17485*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
void setup() {
  
  size(200,200);
  background(131,174,16);
  noStroke();
  smooth();
}

//change background color

void keyPressed(){
  colorMode(HSB,359,100,100,100);
  background(random(359),random(25,100),random(45,100));
}


void draw(){
  
  //wall stripes, move mouse left and right to add lines, 
  //move mouse up and down to increase and decrease brightness
  
  colorMode(HSB,359,100,100,100);
  noStroke();
  fill(random(60,240),100,mouseY+25);
  rect(pmouseX,100,.5,200);
  colorMode(RGB,255,255,255);
  noStroke();
  smooth();
  
  //ground
  
  fill(87,116,11);
  rectMode(CENTER);
  rect(100,175,200,65);
  fill(20);
  rect(100,140,200,3);
  
   //black monster body outline
   
  fill(0);
  ellipse(100,94.586,138.17,138.199);
  rectMode(CENTER);
  rect(100,129.553,138.17,83.738);
  ellipse(100,162.304,164.457,61.125);
  
  
  //monster body outline, color
  
  smooth();
  fill(109,144,14);
  ellipse(100,94.586,130.199,130.199);
  rectMode(CENTER);
  rect(100,129.553,130.199,75.738);
  ellipse(100,162.304,156.457,53.125);
  
  //monster body
  
  fill(167,221,21);
  ellipse(100,94.586,121.199,121.199);
  rectMode(CENTER);
  rect(100,129.553,121.199,66.738);
  ellipse(100,162.304,147.457,44.125);
  
  //left monster eye
  
  //colored outline
  
  fill(109,144,14);
  ellipse(81.361,81.998,52.767,52.767);
  
 //eyeball
 
 fill(0); 
 ellipse(81.361,81.998,43.767,43.767);
 fill(255);
 ellipse(81.361,81.998,34.767,34.767);
 fill(0);
 ellipse(81.361,81.998,25.587,25.587);
 fill(255);
 ellipse(81.361,81.998,20.587,20.587);
 fill(0);
 ellipse(81.361,81.998,15.587,15.587);
 
 //highlights
 
 fill(255);
 ellipse(83.554,78.614,2.955,2.955);
 ellipse(86.507,81.154,1.483,1.483);
 
 //right monster eye
 
 //colored outline
 
 fill(109,144,14);
 ellipse(121.76,73.7,39.299,39.299);
 
 //eye
 
 fill(0);
 ellipse(121.76,73.7,30.299,30.299);
 fill(255);
 ellipse(121.76,73.7,22.299,22.299);
 fill(0);
 ellipse(121.76,73.7,12.299,12.299);
 
// highlight

 fill(255);
 ellipse(124.232,71.682,2,2);
 
 //monster mouth outline
 
 noFill();
 strokeWeight(15);
stroke(109,144,14);
bezier(64.689, 125.919, 84.588, 140.286, 117.074,110.964,135.153,120.834);

//monster mouth

 noFill();
 strokeWeight(5);
stroke(0);
bezier(64.689, 125.919, 84.588, 140.286, 117.074,110.964,135.153,120.834);

//add depth and definition to bottom of monster

noFill();
 strokeWeight(5);
stroke(109,144,14);
arc(100, 156, 110, 30, PI/2, PI);
arc(100, 156, 110, 30, 0, PI/2);

}




