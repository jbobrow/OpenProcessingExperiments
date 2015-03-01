
float noise_val=0.0;
float noise_val2=0.0;
float noise_val3=0.0;
float div=1;
float mult=250;

void setup(){
  frameRate(30);
  size(500,500);
  noStroke();
  rectMode(CENTER);
}

void draw(){
  int mouse=mouseY/3;

  noise_val = noise_val + (0.01/div);
  noise_val2 = noise_val2 + (0.015/div);
  noise_val3 = noise_val3 + (0.02/div);
  float my_noise1 = noise(noise_val) * map(mouseY,0,height,50+mult,50);
  float my_noise2 = noise(noise_val2) * map(mouseY,0,height,50+mult,50);
  float my_noise3 = noise(noise_val3) * map(mouseY,0,height,50+mult,50);
  
  fill(255,255,255, 50);
  rect(width/2,(height/2), 200, 450);
  fill(20,100,180, 50);
  beginShape();
  vertex(150, 300+mouse-my_noise1);
  vertex(350, 300+mouse-my_noise2);
  vertex(350, 475);
  vertex(150, 475);
  endShape(CLOSE);
  
  beginShape();
  vertex(150, 300+mouse-my_noise2);
  vertex(350, 300+mouse-my_noise3);
  vertex(350, 475);
  vertex(150, 475);
  endShape(CLOSE);
  
  beginShape();
  vertex(150, 300+mouse-my_noise3);
  vertex(350, 300+mouse-my_noise1);
  vertex(350, 475);
  vertex(150, 475);
  endShape(CLOSE);
/* 
  if (mousePressed == true) {
    div=2;
    mult=0;
  } else {
    div=1;
    mult=250;
  }*/
}

