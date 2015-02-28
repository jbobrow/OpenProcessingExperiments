
size(400,400);
background(255);

float x=10;
float y=10;

fill(0);

rectMode(CENTER);
fill(0);
float w=20;

for (int i=0; i<100; i++) {
  w = sin( (200-x)/100)*10+20;
  for (int j=0; j<20; j++) {
    y=j*15+20;
    rect(x,y,w,20);
  }
  x=x+w+10;
}




ellipseMode(CENTER);
fill(255);
noStroke();
ellipse(180,210, 280,280);





w = 6;
ellipseMode(CENTER);
noStroke();
for(int i=0; i<17; i++) {
  x = i * 14;
  //w = sin( map(i, 0, 17, 0, PI) ) * 10 + 4;
  w = sin( i / 17.0 * PI ) * 10 + 4;
 
  if (x>10) {
    fill(200);
  } else {
    fill(255);
  }
 
  
  for (int j = 0; j<20; j++) {
    y= j * 15;
    if (dist(x+60, y+40, 180,210) < 140) {
      ellipse(x+60,y+40,w,w);
    }
  }
}

fill(0);
rect(140,400,9,150);
ellipse(140,320,42,40); 

fill(0);
rect(181,400,12,100);
ellipse(181,350,32,32); 

rectMode(CENTER);
rect(115,400,29,300);
ellipse(115,250,120,120);

rectMode(CENTER);
fill(20);
rect(40,400,20,400);
ellipse(40,160,90,90);

fill(0);
rect(240,400,9,150);
ellipse(240,320,42,40); 

fill(0);
rectMode(CENTER);
rect(380,400,35,400);
ellipse(380,170,80,80);

fill(40);
rect(350,400,20,300);
ellipse(350,240,60,60);

fill(0);
rect(140,400,9,150);
ellipse(140,320,42,40); 

fill(30);
rectMode(CENTER);
rect(115,400,29,300);
ellipse(115,250,120,120);

rectMode(CENTER);
fill(40);
rect(40,400,20,400);
ellipse(40,160,90,90);


rectMode(CENTER);
fill(30);
rect(300,400,20,450);
ellipse(300,140,115,115);


fill(60);
rect(200,400,16,300);
ellipse(200,265,90,90);
