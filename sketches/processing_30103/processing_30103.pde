
size(400,400);
colorMode(RGB,255);
background(255,255,255);


int i;
int a;
int b;

strokeWeight(2);
stroke(255,114,86);
for(a=0;a<10;a++){
for(i=0;i<400;i++){
line(0,20+a*40,400,20+a*40);
}
}

noStroke();
for(a=0;a<5;a++){
for(i=0;i<400;i++){
  fill(255,0,0,250-22*i);
  rect(i*40,i*40+a*80,40,40);
}
}

noStroke();
for(a=1;a<5;a++){
for(i=0;i<400;i++){
  fill(255,0,0,250-22*i);
  rect(i*40,i*40-a*80,40,40);
}
}

noStroke();
for(a=0;a<5;a++){
for(i=0;i<400;i++){
    fill(255,0,255,50*i);
  ellipse(20+i*40,60+i*40+a*80,40,40);
}
}

noStroke();
for(a=0;a<5;a++){
for(i=0;i<400;i++){
    fill(255,0,255,50*i);
  ellipse(60+i*40,20+i*40-a*80,40,40);
}
}



