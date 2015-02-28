
/*
Jaeseong Yi
 March 16 2014
 Creative Computing Section B
 assignment 2 & 3
 Benjamin Bacon
 */


void setup(){
size(800, 800);
background(255);
frameRate(9);
smooth();
}

void draw(){
int c1 = int(random(0,255));
int c2 = int(random(0,255));
int c3 = int(random(0,255));
int t1 = int(random(0,100));
int direction1 = 10;
int i = 90;
while ( i <= 700 ) {  // outter
  int j = 90;
  while ( j <= 700 ) {  // inner
    stroke(c1, c1, c1);
    fill(c1, c2, c3, t1);
    rect(j, i, 10, 10);      
    j = j + 10;
  }
  i = i + 10;
  
  
  c1=c1+direction1;
  if (c1>255) {
    direction1=-10;
  }
  else if (c1<0) {
    direction1=10;
  }
}
}


