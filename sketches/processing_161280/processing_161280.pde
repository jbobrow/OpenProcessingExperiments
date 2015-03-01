
int n = 0;

void setup() { 
  size(500,500);
  background(255);
  frameRate(5);
  noStroke();

}

void draw() {
  
  background(255);
  
  if(n % 5 == 0) {
    fill(25,125,175);
    rect(0,0,width/2,100);
  }
  
   if(n % 5 == 1) {
     fill(75,125,175);
    rect(0,100,width/2,100);
  }
  
   if(n % 5 == 2) {
     fill(125,125,175);
    rect(0,200,width/2,100);
  }
  
   if(n % 5 == 3) {
     fill(175,125,175);
    rect(0,300,width/2,100);
  }
  
     if(n % 5 == 4) {
     fill(225,125,175);
    rect(0,400,width/2,100);
  }
  
  
  
  n++;
}
