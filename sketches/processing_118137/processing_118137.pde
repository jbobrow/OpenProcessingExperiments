
size(510,510);
background(2,2,48);
colorMode(RGB);
smooth();
noFill();

for(int w = 0; w <50; w++){
rotate(PI/18);
stroke(255,w,0);
line(0,0,200,200);

rotate(PI/2);
stroke(100,0,0);
ellipse(50,50,25,25);
rotate(PI/3);
stroke(255,50,0);
ellipse(100,100,50,50);
rotate(PI/2);
stroke(255,100,0);
ellipse(150,150,25,25);
}

for(int i = 0; i <400; i++){
for(int s = 0; s <=255; s++){
rotate(PI/30);
stroke(i,255,0);
line(i,500-i,500-i,i);
}
}

for(int a = 0; a <=200; a++){
  for(int b=0; b<=200; b++){
rotate(PI/180);
stroke(100+a,50+a,255-b);
//line(200-a,200-a,a,a);
line(450+a,450+a,600,600);
//rotate(PI/360);
//line(100,50,100,200);
}
}

for(int c = 0; c <=200; c++){
rotate(PI/30);
stroke(255,255-c,0);
ellipse(0,0,700-c,700-c);
}

for(int d = 0; d <=255; d++){
for(int e = 0; e <=40; e++){
rotate(PI/45);
stroke(0,150-d,255);
ellipse(400,400,40-e,40-e);
}
}
for(int d = 0; d <=255; d++){
for(int e = 0; e <=40; e++){
noStroke();
rotate(PI/90);
fill(0,255,90);
ellipse(360,360,15,15);
fill(90,0,180);
ellipse(440,440,15,15);

rotate(PI/180);
fill(0,230,255);
ellipse(375,375,10,10);
fill(45,0,255);
ellipse(425,425,10,10);

}
}


