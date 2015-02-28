
//Hao-Yun Mei, hmei
//Copyright_ Hao-Yun Mei_Carnegie Mellon University_2013
size(400,400);
background(255,147,0);
//Small Box:
  noStroke();
  fill(255,202,13);
  rect(110,210,180,200);

//Letter H:
noStroke();
fill(180);
rect(110,190,180,20);
rect(80,0,30,400);
rect(290,0,30,400);

//Letter M:
int i=210;
while(i<400){
  strokeWeight(2);
  stroke(255);
  strokeCap(SQUARE);
  line(180,i,220,i);
  i=i+7;
}
i = 210;
while (i<400){
  strokeWeight(2);
line(80,i,110,i);
i=i+7;
}
i = 210;
while (i<400){
  strokeWeight(2);
line(290,i,320,i);
i=i+7;
}
//saveFrame("hw1.jpg");





