
size(400,565);

int eSize = 1;


strokeWeight(1);
background(255,255,255);

for(int i =0; i <= width; i ++){
  stroke(204,135,32,i);
  line(-i,i,400,i);
}

rectMode(CORNER);
noStroke();
fill(255,100);
rect(0,0,400,400);
//background


stroke(242,19,71);
fill(242,19,71);
ellipse(120,150,200,200);
stroke(68,67,67);
fill(68,67,67);
ellipse(300,100,70,70);
stroke(91,89,90);
fill(91,89,90);
ellipse(270,200,50,50);
stroke(109,107,108);
fill(109,107,108);
ellipse(220,280,45,45);
fill(131,118,118);
ellipse(150,330,40,40);
stroke(39,36,36,100);
strokeWeight(18);
fill(242,237,86,130);
ellipse(280,450,200,200);
fill(242,164,86,180);
ellipse(80,500,100,100);
//maru

int a =10;
smooth();
for(int x=0; x<=width; x+=20){
 
  if(x == 300 || x == 565){ 
    fill(255); 
  }
  else{
    fill(0);  
  }
  rect(x, 3*height/4, a, a);
  println("x=" + x); 
}
for(int y=0; y<=height; y+=20){
  if(y == 300 || y == 565){
    fill(240,31,31);
  }
  else{
    fill(0);
  }
  rect(7*width/8,y,a,a);
  println("y=" + y);
}


stroke(129,127,125,200);
strokeWeight(15);
line(-10,370,320,370);
stroke(62,59,59);
strokeWeight(20);
line(-10,550,400,300);
stroke(39,36,36);
strokeWeight(18);
line(-10,490,400,490);

fill(0);
rect(50,400,40,40);
//under

stroke(0);
strokeWeight(10);
line(-10,0,400,0);
line(0,0,0,565);
strokeWeight(15);
line(0,565,400,565);
line(400,0,400,565);









