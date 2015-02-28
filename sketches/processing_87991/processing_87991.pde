
//transformations
int d=100;
int x=100;
int y=100;
color[] click={#26261F,#A6882E,#D9B23D,#D92D07};

void setup(){
size(600,600);
smooth();
background(click[0]);
rectMode(CENTER);
}

void draw(){
  fill(click[1]);
  rect(x,y,d,d);
 
  translate(200,200);
  fill(click[2]);
  rect(x,y,d,d);
 
 translate(100,100);
 scale(1.5);
 fill(click[3]);
  rect(x,y,d,d);
}
