
void setup(){

  size(640,480);
  background(255);
  
  rectMode(CENTER);

}

int a = 0;
int b = 0;
int c = 0;
int d = 0;

int i=0;

void draw(){
  
  a = mouseX * 2 -300;
  b = mouseY /3 +100;
  c = mouseX /2;
  d = mouseY;
  line(a,b,c,d);
  i++;
  
}


