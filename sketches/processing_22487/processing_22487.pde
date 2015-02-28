


void setup(){
size (480, 720);
background(100,60,20);
smooth();
}


void draw(){
  
  //background 1
  
  
  
  
  
  

for (int p = 0 ; p<height ; p+=5){
  
  stroke(255,20);
  noFill();
  fill(100,60,20);
  rect(p,p,480, 720);
  p= p++;
}



  //background 2
rectMode(CENTER);
for (int l =720; l<0 ; l+=5){
  
  stroke(255,20);
  fill(100,60,20);
  rect(l,l,720,480);
  l= l++;
  
  
  
  
  
  
  
  
  
  
  
  
}
rectMode(CORNER);
//left small squares
for (int r=40; r<height-40; r+=40){
  noStroke();
  fill(255,40);
  rect(40,r, 10,10);
  r= r++;
}
//right small squares
for (int t=40; t<height-40; t+=40){
  noStroke();
  fill(255,40);
  rect(440,t, 10,10);
  t= t++;
}
//top small squares
for (int y=40; y<width-40; y+=40){
  noStroke();
  fill(255,40);
  rect(y,40, 10,10);
  y= y++;
}
//bottom small squares
for (int u=40; u<width-30; u+=40){
  noStroke();
  fill(255,40);
  rect(u,680, 10,10);
  u= u++;
}


//rectangulos verdes

for(int i = 80 ; i<410 ; i += 10){
fill(180,180,20);
rect(i,80,5,570);
i= i++;
}


//rectangulos verdes

for(int o = 80 ; o <660 ; o += 10){
fill(230,180,35);
rect(80,o,325,5);
o= o++;
} 





}

