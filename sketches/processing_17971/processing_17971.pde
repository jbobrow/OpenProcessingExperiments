
size(250,250);
smooth();

background(63,67,64);


strokeWeight(1);

for(int i=-120; i<290; i +=40){
  line (i,0,i+100,250);
  stroke (i,40,120,60);
}

for(int i=-120; i<290; i +=10){
  line (i,250,i+100,0);
  stroke (i,40,120,30);
}

//diagonal lines in background (faded)


for(int i=-120; i<200; i +=6){
  line (10,i,60,i+60);
  stroke (i,40,120);
}

for(int i=-120; i<200; i +=6){
  line (60,i,10,i+60);
  stroke (i,40,120);
}

//gradient lines crossing over (first row)

for(int i=-120; i<160; i +=6){
  line (50,i,70,i+60);
  stroke (250,250,250,100);
}

for(int i=-120; i<160; i +=6){
  line (70,i,50,i+60);
  stroke (250,250,250,100);
}

//white lines crossing over (1st set)

for(int i=-200; i<100; i +=6){
  line (100,i,150,i+60);
  stroke (i,40,120);
}

for(int i=-200; i<100; i +=6){
  line (150,i,100,i+60);
  stroke (i,40,120);
}

//gradient lines crossing over (2nd row)

for(int i=-120; i<140; i +=6){
  line (120,i,140,i+60);
  stroke (250,250,250,100);
}

for(int i=-120; i<140; i +=6){
  line (140,i,120,i+60);
  stroke (250,250,250,50);
}

//white lines crossing over (middle)



