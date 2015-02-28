
int x;
int y;
void setup (){
  
  size (200,200);
  background (20,152,150);
}

void draw() {
  while (x<80){
    line(10+x,100-10*x/9,20+x,90-10*x/9);
    line(95+x,5+10*x/9,105+x,15+10*x/9);
    x=x+5;
  
  }
  noFill();
  rect(15,95,160,95);
  fill(255);
  rect(110,130,30,30);
  }
