
void setup() {
size(200,200);
}
 
void draw() {
  for(int x=0; x<=200; x=x+10) {
    for(int y=0; y<=200; y=y+10) { 
    stroke(random(255),random(255),random(255));
    fill(random(255),random(255),random(255));  
    float a=x*random(1); 
    float b=y*random(1); 
    line(a,b,200,200);
    line(10,10,a,b);
    rect(a,b,5,5);
    }
  }
}


