
int hello =10;
int goodbye=100;
int y=0;

void setup() {
  
  size(500,500);
  background(255);
  smooth();
  stroke(255);
  fill(0,0,0,35);
 
  frameRate(3);
}

void draw() {
  
  while(goodbye>400){
    
  }
  
  line (goodbye,0,goodbye,500);
  line(0,goodbye,y,goodbye);

ellipse(250,250,goodbye,goodbye);
goodbye=goodbye+40;

ellipse(125,125,goodbye,goodbye);
ellipse(375,375,goodbye,goodbye);

if(hello>500) {
  y=y+100;
  hello=0;
}
  
}


