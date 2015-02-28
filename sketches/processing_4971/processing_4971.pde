
float angle = 0.0;
float speed = 0.1;
float rad = 30;





void setup() {
  size(400, 400);
  smooth();

}



void draw() {

  background(0, 247, 20);
  angle = angle + speed;


//circle
float radius = 6;

noFill();
for (int c = 0; c < 100; c += 2) {
    stroke(250, mouseY+10, 200);
    strokeWeight(6);
    ellipse(200, 200, radius, radius);
    radius = radius += 30;
}
  
  fill(230, 0, 0);
  int mx = constrain(mouseX, 173, 188);
  
  
  noStroke();
  ellipse(200 + (sin(angle + PI) * 2), 160, 100, 120); //head

  // R eye
  fill(220, 250, 0);
  ellipse(180  + (sin(angle + PI) * 2), 148, 30, 45); // eye
  fill(0);
  ellipse(mx  + (sin(angle + PI) * 2), 148, 15, 35); // pupil

  // L eye
  fill(220, 250, 0);
  ellipse(220  + (sin(angle + PI) * 2), 148, 30, 45); // eye
  fill(0);
  ellipse((mx + 40) + (sin(angle + PI) * 2), 148, 15, 35); // pupil
   
  
  noStroke(); 
  fill(230, 0, 0);

  //1R tentacle
  ellipse(210 + (sin(angle + PI) * 5), 225, rad, rad);
  rad -= 3;
  ellipse(220 + (sin(angle + HALF_PI) * 5), 255, rad, rad);
  rad -= 3;
  ellipse(230 + (sin(angle + QUARTER_PI) * 5), 285, rad, rad);
  rad -= 3;
  ellipse(240 + (sin(angle + TWO_PI) * 5), 315, rad, rad);
  rad -= 3;
  ellipse(250 + (sin(angle + PI) * 5), 345, rad, rad);
  rad = 30;
  //tentacle

  //2R tentacle
  ellipse(220 + (sin(angle + PI) * 5), 225, rad, rad);
  rad -= 3;
  ellipse(240 + (sin(angle + HALF_PI) * 5), 245, rad, rad);
  rad -= 3;
  ellipse(260 + (sin(angle + QUARTER_PI) * 5), 265, rad, rad);
  rad -= 3;
  ellipse(280 + (sin(angle + TWO_PI) * 5), 285, rad, rad);
  rad -= 3;
  ellipse(300 + (sin(angle + PI) * 5), 305, rad, rad);
  rad = 30;
  //tentacle

  //3R tentacle
  ellipse(230 + (sin(angle - PI) * 5), 220, rad, rad);
  rad -= 3;
  ellipse(260 + (sin(angle - HALF_PI) * 5), 230, rad, rad);
  rad -= 3;
  ellipse(290 + (sin(angle - QUARTER_PI) * 5), 240, rad, rad);
  rad -= 3;
  ellipse(320 + (sin(angle - TWO_PI) * 5), 250, rad, rad);
  rad -= 3;
  ellipse(350 + (sin(angle - PI) * 5), 260, rad, rad);
  rad = 30;
  //tentacle

  //1L tentacle
  ellipse(190 + (sin(angle - PI) * 5), 225, rad, rad);
  rad -= 3;
  ellipse(180 + (sin(angle - HALF_PI) * 5), 255, rad, rad);
  rad -= 3;
  ellipse(170 + (sin(angle - QUARTER_PI) * 5), 285, rad, rad);
  rad -= 3;
  ellipse(160 + (sin(angle - TWO_PI) * 5), 315, rad, rad);
  rad -= 3;
  ellipse(150 + (sin(angle - PI) * 5), 345, rad, rad);
  rad = 30;
  //tentacle

  //1L tentacle
  ellipse(180 + (sin(angle - PI) * 5), 225, rad, rad);
  rad -= 3;
  ellipse(160 + (sin(angle - HALF_PI) * 5), 245, rad, rad);
  rad -= 3;
  ellipse(140 + (sin(angle - QUARTER_PI) * 5), 265, rad, rad);
  rad -= 3;
  ellipse(120 + (sin(angle - TWO_PI) * 5), 285, rad, rad);
  rad -= 3;
  ellipse(100 + (sin(angle - PI) * 5), 305, rad, rad);
  rad = 30;
  //tentacle

  //3L tentacle
  ellipse(170 + (sin(angle + PI) * 5), 220, rad, rad);
  rad -= 3;
  ellipse(140 + (sin(angle + HALF_PI) * 5), 230, rad, rad);
  rad -= 3;
  ellipse(110 + (sin(angle + QUARTER_PI) * 5), 240, rad, rad);
  rad -= 3;
  ellipse(80 + (sin(angle + TWO_PI) * 5), 250, rad, rad);
  rad -= 3;
  ellipse(50 + (sin(angle + PI) * 5), 260, rad, rad);
  rad = 30;
  //tentacle



}


