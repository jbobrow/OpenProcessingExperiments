
int l1 = 50; 
int l2 = 50; 
int w1 = 10; 
float deg1 = 72; 
float rad1 = radians(deg1); 
float deg2 = 75; 
float rad2 = radians(deg2); 
float deg3 = random(60,120); 
float rad3 = radians(deg3);

float flowerRotate = 0;

void setup(){ 
size(600,600); 
frameRate(10); 
background(0); 
}

void draw(){ 


if (mousePressed){ 
    fill(0, 100);
  rect(0,0,width,height);
translate(width/2,height/2); 
flowerRotate = flowerRotate+random(15,75); 
w1 = int(random(7,20)); 
l1 = int(random(10,20)); 
rotate(flowerRotate); //rotates the whole flower 
float leafR = random(3,7);
for (int i = 0; i < leafR; i = i+1) {
  float deg3 = 360 / int(leafR); 
  float rad3 = radians(deg3); 
  rotate(rad3); //scale(1.1); 
  leaf(); //scale(0.9); 
} 

for (int i = 0; i < 5; i = i+1) { 
rotate(rad1); 
petal(); 
} 

for (int i = 0; i < 5; i = i+1) { 
rotate(rad2); 
stigma(); } 
} // Close Mouse Pressed // clear Screen 

if(keyPressed){if(key == ' '){background(255);}} 

}

void stigma() { 
  stroke(0); 
  fill(237,245,164); 
  line(0, 0, l1, l2); 
  noStroke(); 
  fill(255,234,3); 
  ellipse(0,0,25,25); 
  ellipse(l1, l2, w1, w1); 
}

void petal(){ 
  stroke(226,1,123);
  strokeWeight(3);
  fill(237,119,183); 
  bezier(0,0,-7, 342, 345, 6, 0, 0); 
}

void leaf() { 
  stroke(36,145,54);
  strokeWeight(2);
  fill(51,176,72); 
  bezier(0,0,0, 223, 89, 135, 150, 227); 
  bezier(0,0,228, 61, 89, 135, 150, 227); 
}


