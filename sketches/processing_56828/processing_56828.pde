
float speed = 1; 
int diameter = 20; 
float x; 
float y;

void setup(){
size(480, 120); 
background(0); 
smooth(); 
fill(255); 
stroke(102); 
}

void draw(){
  //background(242,129,242);
for (int y = 20; y <= height-20; y += 20) {
for (int x = 20; x <= width-20; x += 20) { 
  ellipse(x, y, 10, 10); 
   fill(random(255),random(255),random(255));

}
}
}


