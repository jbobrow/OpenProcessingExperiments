
//規則的、不規則的

int eSize = 10;

size(600,300);
colorMode(RGB,400);
background(255);
noStroke();
fill(0);
rect(0,0,300,300);

for(int x=0; x<=width; x+=40){
 
  if(x < width/2){
    fill(255);
  }
  else{
    fill(0);
  }
  ellipse(x, height/2, eSize, eSize);
  println("x=" + x);
}

//規則的
for(int x =0; x<=400; x+=10) {
for(int y =0; y<=400; y+=10) {
   
  stroke(255-y,x*2,y);
 line(300,0,x*5,y*5);
}
}

line(0,150,300,150);
line(300,40,80,150);
line(300,80,160,150);
line(300,120,240,150);
line(300,260,80,150);
line(300,220,160,150);
line(300,180,240,150);

//不規則
strokeWeight(5);
line(300,0,0,150);
line(0,150,300,300);

stroke(0, 190, 155);
strokeWeight(3);


fill(255,180,203,200);
ellipse(600,160,150,150);

fill(400,110,243,200);
ellipse(420,50,50,50);

fill(420,255,121,200);
ellipse(510,50,80,80);

fill(400,110,243,200);
ellipse(355,80,30,30);

fill(420,255,121,200);
ellipse(330,120,20,20);

for(int x=10; x<=250; x+=10){
 
  stroke(0);
  strokeWeight(3);
  noFill();
  ellipse(430,300,x,x);
}

for(int x=10; x<=200; x+=10){
 
  stroke(0);
  strokeWeight(1.5);
  noFill();
  ellipse(430,230,x,x);
}

for(int x=10; x<=150; x+=10){
 
  stroke(0);
  strokeWeight(0.5);
  noFill();
  ellipse(430,170,x,x);
}


