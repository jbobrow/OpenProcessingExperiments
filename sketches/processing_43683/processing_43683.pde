
//Rayniel Estrella | Midterm - "From geometric to organic"
//Nick Lally | Math, Programming, and Art

float x,y, angle;
 
void setup(){
  size(700,700);
  colorMode(HSB,360,100,100);
  noStroke();
  smooth();
}
 
void draw(){
  background(255);

//Top Center
  beginShape();
  for(int i=0; i<=360; i+=360/angle*5){
      x = cos(radians(i)) * 150 +width/2;
      y = sin(radians(i)) * 150 +height/3;
      fill(random(360),100,100);
      float ellSize = sin(y*x+angle)*25;
      ellipse(x,y,ellSize,ellSize);
  }
  endShape();
  beginShape();
  for(int i=0; i<=360; i+=360/angle*5){
      x = cos(radians(i)) * 130 +width/2;
      y = sin(radians(i)) * 130 +height/3;
      fill(random(360),100,100);
      float ellSize = sin(y*x+angle)*25;
      vertex(x,y);
  }
  endShape();
  
  
//First Row
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +250;
      y = sin(radians(i)) * 25 +50;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +180;
      y = sin(radians(i)) * 25 +120;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +140;
      y = sin(radians(i)) * 25 +210;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +150;
      y = sin(radians(i)) * 25 +300;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +200;
      y = sin(radians(i)) * 25 +380;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +200;
      y = sin(radians(i)) * 25 +380;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +280;
      y = sin(radians(i)) * 25 +430;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +370;
      y = sin(radians(i)) * 25 +440;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +455;
      y = sin(radians(i)) * 25 +430;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +525;
      y = sin(radians(i)) * 25 +380;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +555;
      y = sin(radians(i)) * 25 +300;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +550;
      y = sin(radians(i)) * 25 +210;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +510;
      y = sin(radians(i)) * 25 +120;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*3){
      x = cos(radians(i)) * 25 +450;
      y = sin(radians(i)) * 25 +50;
      fill(0);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
//Second Row
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +170;
      y = sin(radians(i)) * 25 +40;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +105;
      y = sin(radians(i)) * 25 +140;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +80;
      y = sin(radians(i)) * 25 +265;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +125;
      y = sin(radians(i)) * 25 +375;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +205;
      y = sin(radians(i)) * 25 +460;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +322;
      y = sin(radians(i)) * 25 +495;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +435;
      y = sin(radians(i)) * 25 +495;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +530;
      y = sin(radians(i)) * 25 +460;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +600;
      y = sin(radians(i)) * 25 +375;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +612;
      y = sin(radians(i)) * 25 +265;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +590;
      y = sin(radians(i)) * 25 +140;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
 
  beginShape();
  for(int i=0; i<=360; i+=360/angle*1){
      x = cos(radians(i)) * 25 +535;
      y = sin(radians(i)) * 25 +40;
      fill(random(360),100,100,100);
      float ellSize = sin(y*x+angle)*10;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
  
  //Bottom Row
  beginShape();
  for(int i=0; i<=360; i+=360/angle){
      x = cos(radians(i)) * 100 +width/50;
      y = sin(radians(i)) * 100 +height/1;
      fill(0);
      float ellSize = sin(y*x+angle)*25;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();

  beginShape();
  for(int i=0; i<=360; i+=360/angle){
      x = cos(radians(i)) * 100 +185;
      y = sin(radians(i)) * 100 +650;
      fill(0);
      float ellSize = sin(y*x+angle)*25;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();

  beginShape();
  for(int i=0; i<=360; i+=360/angle){
      x = cos(radians(i)) * 100 +350;
      y = sin(radians(i)) * 100 +700;
      fill(0);
      float ellSize = sin(y*x+angle)*25;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();

  beginShape();
  for(int i=0; i<=360; i+=360/angle){
      x = cos(radians(i)) * 100 +520;
      y = sin(radians(i)) * 100 +650;
      fill(0);
      float ellSize = sin(y*x+angle)*25;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();

  beginShape();
  for(int i=0; i<=360; i+=360/angle){
      x = cos(radians(i)) * 100 +700;
      y = sin(radians(i)) * 100 +700;
      fill(0);
      float ellSize = sin(y*x+angle)*25;
      ellipse(x,y,ellSize,ellSize);
      vertex(x,y);
  }
  endShape();
 
 
       fill(360);
for(int x = 0; x < width; x+=20){
  for(int y = 0; y < height; y+=10){
    float ellSize = sin(y*x+angle);
    ellipse(x,y,ellSize,ellSize);
    
  }
}
 
angle+=.1;
}

