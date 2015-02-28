


void setup(){
  setupAudio();
  size(200,200);
}
 
void draw(){
  background(255); 

noStroke();

size(200, 200);
background(0, 0, 0);
strokeWeight (0);
fill(255, 255, 255);


fill(#752d02);
ellipse(110, 85, 88, 130);

fill(#ecb36f);
rect(80, 120, 40, 50);
fill(#752d02);
ellipse(82, 82, 80, 120);
ellipse(100, 85, 80, 100);


getVolume();
float B = map(volume, 0,100, 100,110);
float F = map(volume, 0,100, 106,116);

fill(#fba470);
ellipse(100, 86, 80, 106);
fill(#ecb36f);
ellipse(100, 85, 80, 100);
ellipse(100, 220, 170, 150);

fill(#fba470);
arc(100, 86, 80, F, 0, PI);
fill(#ecb36f);
arc(100, 85, 80, B, 0, PI);

fill(255);
rect(45, 165, 106, 50);
fill(#ecb36f);
arc(100, 165, 106, 20, 0, 180);

fill(255);
ellipse(45, 160, 35, 35);
ellipse(155, 160, 35, 35);


fill(#f99a61);
triangle(98, 75, 93, 100, 105, 100);


fill(#752d02);
ellipse(82, 78, 24, 10);
ellipse(115, 78, 24, 10);
fill(255);
ellipse(82, 80, 23, 10);
ellipse(115, 80, 23, 10);

fill(#752d02);
ellipse(85, 79, 10, 10);
ellipse(115, 79, 10, 10);

strokeWeight(2);
stroke(#660066);
fill(#CCFFFF, 150);
line(92, 87, 105, 87);
line(126, 87, 140, 87);
line(60, 87, 71, 87);

ellipse(82, 87, 25, 12);
ellipse(115, 87, 25, 12);

noStroke();
strokeWeight(1);
fill(#752d02);
arc(55, 38, 70, 110, 0, PI/2);
arc(137, 32, 110, 65, PI/2, PI);

stroke(#996633);
strokeWeight(2);
noFill();
arc(100, 146, 40, 15, 0, PI);
arc(100, 146, 40, 40, 0, PI);
noStroke();
fill(#996633);
ellipse(100, 170, 10, 15);


line(93, 80, 104, 80);
  strokeWeight(1);
  float ex = 75;
  float ey = 70;
  fill(0);
  float dx = constrain((mouseX-ex)/20, -14,14);
  float dy = constrain((mouseY-ey)/20, -14,14);

 
  // Draw the mouth.
  getVolume(); // this call fetches the mic volume for the current frame.
  float Y = map(volume, 0,100, 2,20);  // now we can use it for something!
 
  strokeWeight(0);
  fill(255,200,200);
  smooth();
  ellipse(100, 115, 20,Y); 
 

}

