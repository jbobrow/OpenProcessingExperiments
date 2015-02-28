
void setup(){

  size(640,480);
  background(255);
  
  rectMode(CENTER);

}

int a = 0;
int b = 0;
int c = 0;
int d = 0;

int leTemps=0;

void draw(){
  
  /*
  a = mouseX * 2 -300;
  b = mouseY /3 +100;
  c = mouseX /2;
  d = mouseY;
  */
  
  translate(mouseX,mouseY);
  rotate(radians(leTemps));
 // fill(random(255),random(0),random(30));
  rect(50,0,40,40);
  line(0,0,100,100);
  leTemps++;
  
}


