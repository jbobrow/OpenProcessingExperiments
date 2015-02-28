
//Matthew Iannacci
//Problem Set 1
//Question 6

void setup() {
  size(200,200);
  smooth();
  }


void draw() {
  background(255,255,255);

for(int x=0; x<=200; x=x+25) {
for(int y=0; y<=200; y=y+25) {

if((x+y)%10==0) { 
   fill(255);    
}
  else  { 
   fill(0); 
  }
rect(x,y,100,100);

}
}
}

