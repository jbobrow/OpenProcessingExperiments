
size(400,400);
colorMode(HSB,360,100,100);
background(50,100,100);
smooth();
strokeWeight(3);
fill(75,100,100);
triangle(20,20,100,20,60,180);


int x=135;
noStroke();
for (int i=25; i<=2550; i+=5){
  fill(i*2.5,130,87,i);
  rect(x,270,250,70);
  x+=20;
}
fill(50,100,100);
strokeWeight(15);
rect(380,270,250,70);
fill(0,0,100);
rect(130,200,50,70);
stroke(176,66,66);
fill(282,36,90);
rect(220,75,55,200);
line(380,340,280,380);
noStroke();
ellipse(248,60,72,60);

int a=140;
for (int i=51; i<=255; i+=51){
  stroke(30,100,100,i);
  line(a, 320, a-20,380);
  a-=25;
}

