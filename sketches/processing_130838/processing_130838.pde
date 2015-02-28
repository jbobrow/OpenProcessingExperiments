
size(400,565);

int a = 0;
int b = 10;
int c = 400;
int d = 390;
int e = 565;
int f = 555;

////////setting//////////

background(255,255,235);

rectMode(CENTER);

strokeWeight(1);

//line erea//

line(0,200,400,200);
line(300,0,300,565);
line(0,450,400,450);
fill(255,0,0);
line(50,0,50,565);

//////nostroke set/////// 

noStroke();

//center tri line//

while(c > 200){
  fill(0);
  triangle(c,265,c,275,d,270);
  c = c - 10;
  d = d - 10;
}

while(a < 200){
  fill(0);
  triangle(a,265,a,275,b,270);
  a = a + 10;
  b = b + 10;
}

//center rect//

fill(255,0,0);
rect(200,265,100,200);

//across line//

while(e > 250){
  fill(255,0,0);
  triangle(205,e,195,e,200,f);
  e = e - 10;
  f = f - 10;
}


//side black//

fill(0);
rect(300,100,300,50);

//rect step//

rect(200,565,400,60);
rect(200,500,330,45);
rect(200,450,270,40);
rect(200,400,240,30);
rect(200,350,210,20);

////big sun///

fill(255,0,0);
ellipse(50,50,150,150);
fill(0);
ellipse(50,50,75,75);




