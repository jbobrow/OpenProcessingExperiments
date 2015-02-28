
int x = 370;
int y = 310;
int a = 580;
int b = 570;


void setup() {
 size (600,600);
smooth();
}

void draw() {
fill(255);
stroke(120);
strokeWeight(18);
ellipse(400,400,965,965);

stroke(30);
strokeWeight(18);
ellipse(400,400,945,945);

stroke(100);
strokeWeight(80);
ellipse(400,400,810,810);

stroke(150,190);
strokeWeight(65);
ellipse(400,400,700,700);

float n=dist(a,b,mouseX,mouseY);
if(mousePressed==true&&  n < 125) {
  
  background(222,245,180);
  
  fill(222,245,180);
  stroke(34,240,228,100);
  strokeWeight(18);
  ellipse(400,400,965,965);

  stroke(34,240,228,70);
  strokeWeight(18);
  ellipse(400,400,945,945);

  stroke(34,240,228);
  strokeWeight(80);
  ellipse(400,400,810,810);

  stroke(34,240,228,150);
  strokeWeight(65);
  ellipse(400,400,700,700);
}
  
stroke(180,170);
strokeWeight(20);
ellipse(370,310,200,200);

stroke(120,200);
strokeWeight(20);
ellipse(370,310,180,180);

fill(124,11,15);
stroke(124,11,15);
strokeWeight(1);
ellipse(370,310,140,140);

float d=dist(x,y,mouseX,mouseY);
if(mousePressed==true&&  d < 70) {
 background(222,245,180);
  
  stroke(240,39,39,170);
  strokeWeight(20);
  ellipse(370,310,200,200);

  stroke(245,79,79,200);
  strokeWeight(20);
  ellipse(370,310,180,180);
    
}

 fill(120);
stroke(100);
strokeWeight(0);
rect(490,200,40,200);

fill(140,160);
stroke(160);
rect(510,60,60,200);

fill(20,150);
stroke(60,200);
quad(140,80,600,400,600,420,140,100);


fill(255,100);
stroke(30);
quad(340,-40,580,140,360,320,220,200);

fill(140);
stroke(140);
triangle(200,180,220,180,220,250);

fill(140,150);
stroke(140,150);
triangle(160,180,200,160,160,220);

fill(170,200);
stroke(170);
rect(100,400,60,20);

fill(125,210);
stroke(125,210);
quad(60,460,140,420,160,460,80,500);

fill(50,180);
stroke(50,180);
quad(-40,600,160,500,200,580,0,680);

fill(140,100);
stroke(200);
quad(120,560,340,460,400,580,180,680);

fill(15,211,210,230);
stroke(170,230);
ellipse(580,570,250,250);

fill(255,0);
stroke(210,230);
strokeWeight(30);
ellipse(580,570,260,260);

if(keyPressed==true) {
  fill(255);
  stroke(34,240,228,100);
  strokeWeight(18);
  ellipse(400,400,965,965);

  stroke(34,240,228,70);
  strokeWeight(18);
  ellipse(400,400,945,945);

  stroke(34,240,228);
  strokeWeight(80);
  ellipse(400,400,810,810);

  stroke(34,240,228,150);
  strokeWeight(65);
  ellipse(400,400,700,700);
}

 if(keyPressed==true) {
  stroke(240,39,39,170);
  strokeWeight(20);
  ellipse(370,310,200,200);

  stroke(245,79,79,200);
  strokeWeight(20);
  ellipse(370,310,180,180);
   }

if(keyPressed==true)
{
  fill(178,250,45,200);
  stroke(178,250,45,200);
  rect(100,400,60,20);

  fill(178,250,45,210);
  stroke(178,250,45,210);
  quad(60,460,140,420,160,460,80,500);

  fill(178,250,45,180);
  stroke(178,250,45,180);
  quad(-40,600,160,500,200,580,0,680);

  fill(178,250,45,100);
  stroke(178,250,45,100);
  quad(120,560,340,460,400,580,180,680);
}
}

