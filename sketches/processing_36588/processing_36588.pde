
void setup(){
  setupAudio();
  size(500,500);
}
 
void draw(){
  background(255); 
  smooth();
  // Draw the mouth.
  getVolume(); // this call fetches the mic volume for the current frame.
  
  float Y = map(volume, 0, 50, 10, 40);  // now we can use it for something!


  //fill(255,200,200);
  //ellipse(200,200, 100,Y); 
 
  // The rest of the code just draws the Eye:
  
  background(184, 207, 252);
  smooth();
  
  fill(245, 207, 16);
  noStroke();
  ellipse(250, 250, 400, 400);
  
  rect(50, 250, 400, 300); //body
  
  fill(202, 175, 35);
  rect(335, 250, 100, 500);
  ellipse(385, 250, 100, 220); //darklight
  
  fill(255, 239, 157);
  rect(65, 250, 100, 500);
  ellipse(115, 250, 100, 220); //highlight

  strokeWeight(20);
  stroke(50, 50, 50);
  strokeCap(ROUND);
  line(55, 200, 445, 200); //straps

  strokeWeight(7);
  stroke(130, 130, 130);
  line(60, 197, 440, 197); //straps highlight

  noStroke();
  fill(50);
  ellipse(180, 200, 120+Y, 120+Y);
  ellipse(320, 200, 120+Y, 120+Y); //eyes
  
  fill(255);
  ellipse(180, 200, 90+Y, 90+Y);
  ellipse(320, 200, 90+Y, 90+Y); //eyes
  
  //fill(0, 0, 0);
  //ellipse(180, 200, 20+Y, 20+Y);
  //ellipse(320, 200, 20+Y, 20+Y); //pupils

  fill(50, 50, 50);
  arc(250, 330, 150-Y, 70-Y, 0, PI); //mouth
  
  strokeCap(ROUND);
  stroke(31, 70, 147);
  strokeWeight(6);
  fill(31, 70, 147);
  rect(50, 440, 400, 300); //overalls

  fill(21, 45, 95);
  rect(400, 440, 50, 80); //overalls dark
  
  fill(70, 138, 250);
  rect(50, 440, 50, 80); //overalls light
  
  fill(0);
  noStroke();
  ellipse(100, 470, 30, 30);
  ellipse(400, 470, 30, 30);
  ellipse(250, 483, 30, 30);
  
  stroke(0);
  line(240-Y, 20, 250, 50);
  line(260+Y, 20, 250, 50);
  line(250, 10, 250, 50);
  
//fill(50, 50, 50);
  //arc(250, 330, 70-Y, 70-Y, PI/2, PI);

  //fill(200, 200, 200);
 // arc(250, 330, 70-Y, 70-Y, PI, ((3*PI)/2));
  
 // fill(150, 150, 150);
 // arc(250, 330, 70-Y, 70-Y, ((3*PI)/2), 2*PI);
  
  float ex = 180;
  float ey = 200;
  //fill(255);
  //ellipse(ex,ey, 60,60);
  //fill(0);
  //ellipse(ex,ey, 20,20);

  noStroke();
  fill(0);
  //ellipse(ex, ey, 20+Y, 20+Y);
  
  float fx = 320;
  float fy = 200;
  
  //ellipse(fx, fy, 20+Y, 20+Y); //pupils
 
  
  float dx = constrain((mouseX-ex)/20, -14,14);
  float dy = constrain((mouseY-ey)/20, -14,14);
  ellipse(ex+dx,ey+dy, 40,40);
  
  
  float cx = constrain((mouseX-fx)/20, -14,14);
  float cy = constrain((mouseY-fy)/20, -14,14);
  ellipse(fx+dx,fy+dy, 40,40);
  
}

