
int eSize = 10;

size(400, 400);
background(255);
smooth();

fill(0);

for(int y = 0; y <=height; y +=10){
 for(int x = 0; x <=width; x +=10){
  noStroke();
  fill(300,x,x);
  rect(x,y,10,10);
 stroke(400,x,60,30);
  line(0,200,200, x);
  line(25,210,200, x);
  line(50,220,200, x);
  line(75,230,200, x);
  line(100,240,200, x);
  line(125,250,200, x);
  line(150,260,200, x);
  line(175,270,200, x);
  line(200,280,200, x);
  line(225,270,200, x);
  line(250,260,200,x);
  line(275,250,200, x);
  line(300,240,200, x);
  line(325,230,200, x);
  line(350,220,200,x);
  line(375,210,200, x);
  line(400,200,200,x);
  
  line(0,200,200, x);
  line(25,190,200, x);
  line(50,180,200, x);
  line(75,170,200, x);
  line(100,160,200, x);
  line(125,150,200, x);
  line(150,140,200, x);
  line(175,130,200, x);
  line(200,120,200, x);
  line(225,130,200, x);
  line(250,140,200,x);
  line(275,150,200, x);
  line(300,160,200, x);
  line(325,170,200, x);
  line(350,180,200,x);
  line(375,190,200, x);
  line(400,200,200,x);
}
}


  



