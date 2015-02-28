
void setup(){
 size(500,500);
 background(205, 255, 114);
 smooth();
 frameRate(50);
 noStroke();
 
}

void draw(){
 float a = random(-100,100);
 float i = random(250,450);
 triangle(mouseX+a, mouseY+a,i,i+10,i,i);
 fill(random(50),random(100),20,random(100));
 
  
}
 

