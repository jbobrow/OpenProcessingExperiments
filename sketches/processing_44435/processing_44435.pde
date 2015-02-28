
int c = 100;
void setup(){
 size (800,600);
 background(1);
 frameRate(5);
 smooth();
 noStroke();
 
}

void draw(){
  
  for (int i=0;i<c;i++){
    fill(random(255),random(255),random(255),random(127));
    triangle(random(height+noise(i)),noise(i+height ),random(width),random(height),noise(c),40);
    translate(width/2, height/2);
    rotate(random(360));
  }
  
}

