
size(250,250);
smooth();

background(162,185,32);

strokeWeight(4);
stroke(250, 20);
for(int y = 0; y < 260; y += 40) {
  for(int x = 0; x < 260; x += 40) {
  fill(255,20);  
  ellipse(x, y, 10, 10);}
}


//white circles



strokeWeight(1);

for(int i=-100; i<70; i +=6){
  line (i,0,i+80,80);
  stroke (250,250,250,80);
}

for(int i=85; i<250; i +=6){
  line (i,0,i+80,80);
  stroke (250,250,250,110);
}

//first row of diagonal lines

for(int i=-100; i<80; i +=6){
  line (i,160,i+80,90);
  stroke (250,250,250,130);
}

for(int i=90; i<250; i +=6){
  line (i,160,i+80,90);
  stroke (250,250,250,150);
}

//second row of diagonal lines leaning right

for(int i=-100; i<90; i +=6){
  line (i,170,i+80,240);
  stroke (250,250,250,170);
}

for(int i=105; i<250; i +=6){
  line (i,170,i+80,240);
  stroke (250,250,250,200);
}

//third row of diagonal lines leaning left



