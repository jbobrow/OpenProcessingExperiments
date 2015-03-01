
int x=100;
int y=10;
int spacing=10;
int endLegs=200;

size(200,200);
stroke(0);
fill(#FFB71A);
while(y<=endLegs) {
  ellipse(200,200,200,200);
  rect(x,y,x,5);
  y=y+spacing;
}
