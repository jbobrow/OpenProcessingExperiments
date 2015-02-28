
size(200,200);
background(#3A3481);
noStroke();

fill(#F5F2BC);
ellipse(10,10,200,200);
fill(0);
arc(137, 50, 60, 55, -PI,0);
rect(100,50,75,150);
fill(#F7F170);
arc(130,50,30,30,-PI,0);

int x;
int y;
for(x=110;x<150;x+=30){
  for(y=90;y<200;y+=30){
fill(#F7F170);
  rect(x,y,10,10);
  }

}
  


