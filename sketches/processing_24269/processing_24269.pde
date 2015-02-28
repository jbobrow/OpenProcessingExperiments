
void setup() {
size(500,500);
rectMode(CENTER);
for (int i = 0; i < 500; i = i+30) {  
  strokeWeight(10);  
  line(0, i, 500, i);  
}
}

void draw() {
background(204);
for (int i = 0; i < 500; i = i+30) {  
  strokeWeight(10);  
  line(0, i, 500, i);
}
if (mousePressed == true) {

  fill(238,54,36);  
  ellipse(200,280,200,200);  
  
  fill(0);  
  ellipse(130,250,35,35);  
  
  fill(0);  
  ellipse(230,330,40,40);  
  
  fill(0);  
  ellipse(180,230,40,40);  
  
  fill(0);  
  ellipse(145,310,40,40);  
  
  fill(0);  
  ellipse(240,250,40,40);  
  
  fill(0);  
  ellipse(280,280,35,35);  
  
  fill(0);  
  triangle(225, 185, 150, 365, 195, 380);  
  
  fill(102,102,102);  
  ellipse(225,190,80,80);  
  
  fill(255,255,255);  
  ellipse(215,170,10,10);  
  
  fill(255,255,255);  
  ellipse(243,178,10,10);      
  
  strokeWeight(4);  
  line(210,120,220,150);  
  
  strokeWeight(4);  
  line(275,135,250,160);
  
  fill(0);  
  ellipse(210,115,7,7);  
  
  fill(0); 
  ellipse(278,133,7,7); 
}
}

