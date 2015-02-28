
void setup(){
  
  size(800,800);
smooth();
background(0);
strokeWeight(5);

}

void draw(){
  cursor(CROSS);
  float y1 = random(0,700);
float y2 = random(100,height);
  stroke(random(0,255),random(0,255),random(0,255),10);
  line(width,700,width/2,y1);
  line(0,700,width/2,y1);
  line(width,100,width/2,y2);
  line(0,100,width/2,y2);
}

void mousePressed(){
  background(random(0,255),random(0,255),random(0,255),20);
}


