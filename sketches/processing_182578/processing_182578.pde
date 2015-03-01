
size(400,400);
background(199,97,20);

for(int i=0;i<=400;i+=40) {
  for(int j=0;j<=400;j+=40) {
    stroke(252,220,59);
    strokeWeight(2);
    line(i+16,j+2,i+16,j+16);
    line(i+18,j,i+18,j+20);
    line(i+20,j,i+20,j+20);
    line(i+22,j+2,i+22,j+16);
    line(i+2,j+16,i+16,j+16);
    line(i,j+18,i+20,j+18);
    line(i,j+20,i+20,j+20);
    line(i+2,j+22,i+16,j+22);
    fill(255);
    ellipse(i+10,j+10,5,5);
  }
}
stroke(0,197,205);
strokeWeight(3);
line(100,20,300,20);
line(100,50,300,50);
line(100,80,300,80);
line(100,110,300,110);
line(100,140,300,140);
for(int i=100;i<=300;i+=10) {
  for(int j=20;j<=140;j+=30) {
    stroke(205,104,137);
    strokeWeight(2);
    line(i,j,300,j+30);
  }
}
stroke(0,197,205);
strokeWeight(3);
line(100,220,300,220);
line(100,250,300,250);
line(100,280,300,280);
line(100,310,300,310);
line(100,340,300,340);
for(int i=100;i<=300;i+=10) {
  for(int j=220;j<=340;j+=30) {
    stroke(205,104,137);
    strokeWeight(2);
    line(i,j,300,j+30);
  }
}
fill(178,134,71);
noStroke();
rect(300,0,100,400);
stroke(0,197,205);
strokeWeight(4);
line(300,0,300,400);
stroke(199,97,20);
strokeWeight(7);
fill(0,197,205);
ellipse(400,125,160,90);
fill(255);
noStroke();
ellipse(400,125,140,65);
fill(0);
ellipse(400,125,80,65);
fill(0,197,205);
ellipse(400,125,35,35);
fill(178,34,34);
ellipse(400,125,15,15);
stroke(178,34,34);
strokeWeight(9);
line(320,45,400,70);
stroke(0);
fill(0);
ellipse(400,210,30,30);
strokeWeight(35);
line(320,310,400,280);
stroke(178,34,34);
strokeWeight(7);
line(320,310,400,280);

