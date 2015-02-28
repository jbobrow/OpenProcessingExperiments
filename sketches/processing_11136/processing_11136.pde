
void setup() {
  size(800,600);
  background(0);
  smooth();
}

void draw() { 
  //should figure out how to do this more efficiently... 
  float a = random(10,800);
  float b = random(10,800);  
  float c = random(10,800);
  float d = random(10,800);  
  float e = random(10,800);
  float f = random(10,800);  
  float g = random(10,800);
  float h = random(10,800);  
  float i = random(10,800);
  float j = random(10,800);  
  float k = random(10,800);
  float l = random(10,800);
  float m = random(10,800);
  float n = random(10,800);
  float ab = random(0,255);
  float bc = random(0,255);
  float cd = random(0,255);
  stroke(ab,bc,cd);
  //same for this...
  line(400,300,a,b);
  line(400,300,c,d);
  line(400,300,e,f);
  line(400,300,g,h);
  line(400,300,i,j);
  line(400,300,k,l);
  line(400,300,m,n);
}


