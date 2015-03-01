
size(400,400);
background(199,97,20);
for(int i=0;i<=400;i+=40) {
  for(int j=0;j<=400;j+=40) {
    stroke(205,104,137,i*3);
    strokeWeight(2);
    line(i+16,j+2,i+16,j+16);
    line(i+18,j,i+18,j+20);
    line(i+20,j,i+20,j+20);
    line(i+22,j+2,i+22,j+16);
    line(i+2,j+16,i+16,j+16);
    line(i,j+18,i+20,j+18);
    line(i,j+20,i+20,j+20);
    line(i+2,j+22,i+16,j+22);
    fill(205,104,137);
    ellipse(i+10,j+10,5,5);
  }
}
stroke(0);
strokeWeight(5);
fill(0);
line(315,280,315,200);
line(275,240,275,160);
line(275,160,315,200);
line(315,200,310,100);
line(293,120,333,160);
line(293,120,285,100);
line(333,160,341,180);
ellipse(310,100,30,30);
ellipse(285,100,10,10);
ellipse(341,180,10,10);
for(int g=40;g<400;g+=40) {
    strokeWeight(7);
    stroke(178,34,34);
    line(g,g,g+40,g);
    //stroke(0,197,205);
    //point(g+20,g+20);
    //noFill();
    //strokeWeight(1);
    //ellipse(g+20,g+20,20,20);
}
for(int i=40;i<400;i+=40) {
  float r=random(400);
  float s=random(400);
  float t=random(400);
  float u=random(400);
  float q=random(250);
  stroke(252,220,59);
  strokeWeight(2);
  line(i,0,i,400);
  fill(0,197,205,q);
  ellipse(i,r,20,20);
  ellipse(i,r,10,10);
  fill(248,117,49,q);
  ellipse(i,s,20,20);
  ellipse(i,s,10,10);
  fill(205,104,137,q);
  ellipse(i,t,20,20);
  ellipse(i,t,10,10);
  fill(178,34,34,q);
  ellipse(i,u,20,20);
  ellipse(i,u,10,10);
}

