
size(829, 628);
background(255);
rectMode(CENTER);

int[] pallete = new int[4];
pallete[0] = color(#d6d6a0);
pallete[1] = color(#adc4be);
pallete[2] = color(#b1b6ba);
pallete[3] = color(#bed7b1);

stroke(#2f2b28);
strokeWeight(5);

for(int i=0; i<200; i++){
  float rectX = random(50, width-50);
  float rectY = random(50, height-50);
  float rectWidth = random(20, 120);
  float rectHeight = random(20, 120);  
  int rectColor = int(random(4));
  fill(pallete[rectColor]);
  
  rect(rectX, rectY, rectWidth, rectHeight);
}

noStroke();
fill(255, 150);
rect(0, 0, width/2, height/2);

fill(255, 150);
for(int i=0; i<100; i++){
  float rectX = random(-100, width+100);
  float rectY = random(-100, 100);
  float rectWidth = random(20, 120);
  float rectHeight = random(20, 120);  
  rect(rectX, rectY, rectWidth, rectHeight);
}
for(int i=0; i<100; i++){
  float rectX = random(-100, 100);
  float rectY = random(-100, height+100);
  float rectWidth = random(20, 120);
  float rectHeight = random(20, 120);  
  rect(rectX, rectY, rectWidth, rectHeight);
}
for(int i=0; i<100; i++){
  float rectX = random(-100, width);
  float rectY = random(height-100, height+100);
  float rectWidth = random(20, 120);
  float rectHeight = random(20, 120);  
  rect(rectX, rectY, rectWidth, rectHeight);
}
for(int i=0; i<100; i++){
  float rectX = random(width-100, width+100);
  float rectY = random(-100, height+100);
  float rectWidth = random(20, 120);
  float rectHeight = random(20, 120);  
  rect(rectX, rectY, rectWidth, rectHeight);
}


