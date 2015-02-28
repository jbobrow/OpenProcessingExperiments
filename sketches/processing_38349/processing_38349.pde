
background(0);
size(600,400);
int x=20;
int y=20;

fill(255,0,0);
stroke(0,0);
ellipse(width/2, height/2, 200,200);

fill(255);
stroke(0);
for(int i=20; i<400; i=i+50){
  triangle(i,i, width/2, height/2, width, height);
}

