
void setup(){
size (500,500);
  background(0);

}


void draw(){
}

void mousePressed(){
  background(0);
smooth();
  stroke(255,0,0);
  
float z = random(10,30);
float w = random(10,50);


for(int x= 10; x<width; x+=z){
  for(int y = x^2; y<height; y+=w)
  line(x,y,y,random(200));
    stroke(random(255),random(255),random(255));
}
}


