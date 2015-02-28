
size(500,500);
background(120,125,26,150);
smooth();
noStroke();
for(int y = 0; y<500; y +=10){
  for(int x = 0; x<500; x +=10){
    fill ((x+y) *0.2);
    rect( x,y, 10,10);
  }
}
smooth();
strokeWeight(1);

fill(87,97,17,100);
int y=130;
int d= 248;

ellipse( 121, y, d,d);
ellipse(371, y, d,d);

int e=y=376;
int s= 248;
ellipse( 121, y, s,s);
ellipse(371, y, s,s);

smooth();
strokeWeight(2);
stroke(206,225,77,120);
for (int i= 0; i<500; i+=8){
  line(i,40, i+60,80);
}

for (int i= 0; i<500; i+=8){
  line(i,40, i-60,80);
}

for (int i= 0; i<500; i+=8){
  line(i,100, i+60,80);
  stroke(223,19,225);
}
for (int i= 0; i<500; i+=4){
  line(i,100, i-70,80);
  stroke(223,19,225,120);
}

for (int i= 10; i<500; i+=4){
  line(i,200, i+70,80);
  stroke(223,19,225,100);
}

for (int i= 10; i<500; i+=4){
  line(i,200, i-70,80);
  stroke(223,19,225,100);
}

    for (int i= 10; i<500; i+=4){
  line(i,300, i-70,80);
  stroke(244,6,202,100);
}
 for (int i= 10; i<500; i+=4){
  line(i,300, i+70,80);
  stroke(244,6,202,100);
}

 for (int i= 10; i<500; i+=4){
  line(i,400, i+70,80);
  stroke(241,10,92,100);
}

for (int i= 10; i<500; i+=4){
  line(i,400, i-70,80);
  stroke(241,10,92,120);
}

for (int i= 10; i<500; i+=8){
  line(i,200, i+70,80);
  stroke(5,223,249,100);
}
for (int i= 10; i<500; i+=8){
  line(i,200, i-70,80);
  stroke(5,223,249,100);
}

