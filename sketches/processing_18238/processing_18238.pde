
size(250,250);
smooth();
background(208,222,216);

fill(106,180,147,70);
noStroke();
rect(0,0,50,50);
rect(0,0,75,75);
rect(0,0,100,100);
rect(0,0,125,125);
rect(0,0,150,150);


stroke(255);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (i, 40, i+60, 80);
}

stroke(0,140);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (i, 60, i+60, 100);
}



stroke(255);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (40,i,80, i+60);
}

stroke(0,140);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (60,i,100, i+60);
}

for(int y=0; y<=250; y+=10){
  for(int x=0; x<=250; x+=10){
    strokeWeight (2);
    point (x,y);
  }
}

noStroke();
fill(106,180,147,70);
rect(100,100,200,200);
rect(130,130,175,175);
rect(160,160,150,150);
rect(190,190,125,125);
rect(210,210,100,100);

stroke(255);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (i, 120, i+60, 160);
}

stroke(0,140);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (i, 140, i+60, 180);
}

stroke(255);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (120,i,160, i+60);
}

stroke(0,140);
strokeWeight (2);
for(int i=20; i<400; i+=20){
  line (140,i,180,i+60);
}


strokeWeight(2);
for(int i=0; i<400; i+=20){
  stroke (0, 140);
  line (i, i+20, 0, 250);
}

strokeWeight(2);
for(int i=0; i<400; i+=20){
  stroke (0, 140);
  line (i+20, i, 250, 0);
}


