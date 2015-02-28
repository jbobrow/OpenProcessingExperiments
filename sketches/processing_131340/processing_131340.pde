
size(504, 504);
background(230,220,180);

//background squares

  rectMode(CORNER);
  int x = 1;
  int y = 1;
  noStroke();
  while (y<510) {
    x=x%504;
    if ((x%30)==0) {
      float yel2 = random(220,255);
      float yelran = random(225);
      fill(255,yel2,180,yelran);
      rect(x,y,30,30);
    }
    if (x==0) {
      y+=30;
    }
    x++;
  }

//rectangles/lines
  float rec1 = random(500);
  float rec2 = random(500);
  float rec3 = random(rec1/1.5,rec1*1.5);
  float rec4 = random(rec2/1.5,rec2*1.5);
  float rec5 = random(400,500);
  float rec6 = random(400,500);
  
  strokeCap(SQUARE);
  strokeWeight(80.0);
  stroke(25,0,0,255);
  
//black lines
  line(rec3+30,-20,rec4,542);
  strokeWeight(50.0);
  line(rec3,-20,rec4/2.5,542);
  line(-20,rec5+20,542,rec6-30);
  
//startingline
  stroke(135,0,0,150);
  strokeWeight(80.0);
  line(rec1,-20,rec2,524);
//groupedline1
  strokeWeight(60.0);
  line(rec3,-20,rec4,542);
//opposite prev
  strokeWeight(80.0);
  line(rec3*2,-20,rec4/2,542);
  line(-20,rec5,542,rec6);
  
//thin lines
  strokeWeight(5.0);
  stroke(220,220,0);
  line(0,rec5,524,rec6);
  line(0,rec5+10,524,rec6+10);
  
//ellipses
  noStroke();
  ellipseMode(CENTER);
//white ellipse
  fill(255,255,255,235);
  ellipse(rec2,400,210,210);
//black ellipse
  fill(0,0,0,180);
  ellipse(rec4,470,55,55);
//red ellipse
  fill(135,0,0,230);
  ellipse(rec3/2,420,90,90);

//triangles
  
  int ta1 = ((rec2+rec1)/2);
  int ta2 = (524-2)/2;
  int tb1 = ((rec2+rec1)/2)+40;
  int tb2 = (524-50)/2;
  int tc1 = ((rec2+rec1)/2)+50;
  int tc2 = (524+50)/2;
  
  int td1 = ((rec4+rec3)/2);
  int td2 = (524-2)/2;
  int te1 = ((rec4+rec3)/2)+40;
  int te2 = (524-50)/2;
  int tf1 = ((rec4+rec3)/2)-50;
  int tf2 = (524+50)/2;
  
  fill(0,0,0,90);
  noStroke();
  triangle(ta1,ta2,tb1,tb2,tc1,tc2);
  fill(255,235,200,200);
  triangle(ta1,ta2-50,tb1+30,tb2-180,tc1+80,tc2-50);
  fill(0,0,0,150);
  triangle(td1+40,td2-150,te1+30,te2-40,tf1+20,tf2+180);

/*
This composition was inspired by Laszlo Moholy-Nagy's work, 
especially Composition A XXI (1925) and A19 (1927). I created this
piece to emulate Moholy-Nagy's style of shape and composition as well
as his color palette of the time. This piece features randomization
of all major elements and the use of restricting some randomized 
parameters to group the elements in Moholy-Nagy's style. Emphasized
here are white space and shape while still attempting to get a number
of different shapes into the composition. Reference images retrieved
from http://moholy-nagy.org/art/
*/


