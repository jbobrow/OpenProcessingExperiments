
int a=70;
float b=-0.75;
int c=175;

size (250,250);

background(255);
noStroke();
smooth();
translate(width/2, height/2);
rectMode (CENTER);


for (c=175; c>=12; c-=10){
  a+=10;  
  fill(a,17,17);
  rect(0, 0, c, c);
  b-=0.35;
  rotate(PI/b);
}
