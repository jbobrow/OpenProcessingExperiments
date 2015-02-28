
int i = 5;
int eSize = 3;


size (510,510);
background(33,37,39);
fill(84,200,245,60);


for(int y = 3; y <= height; y +=10){
  for(int x = 3; x <= width; x += 10){ 
   line(x, y, 510, y);
   }
}
for(int y = 3; y <= height; y +=10){
  for(int x = 3; x <= width; x += 10){ 
   line(x, 0, x, 510);
   }
}

for(int x = 0; x <= width; x ++){
  stroke(180,200+x,255,20);
  line(0,0,510-x,510);
  
  stroke(180,200+x,255,20);
  line(0,0,510,510-x);
}




fill(240,235,94,65);
noStroke();
ellipse(60,55,70,70);

fill(241,252,94,60);
noStroke();
ellipse(60,55,60,60);

fill(252,252,94,55);
noStroke();
ellipse(60,55,50,50);

fill(252,252,94,50);
noStroke();
ellipse(60,55,40,40);

fill(249,252,94,45);
noStroke();
ellipse(60,55,30,30);

fill(241,250,219,40);
noStroke();
ellipse(60,55,20,20);

//yellow


fill(60,222,96,60);
noStroke();
ellipse(150,120,100,100);

fill(59,216,112,55);
noStroke();
ellipse(150,120,90,90);

fill(55,211,108,50);
noStroke();
ellipse(150,120,80,80);

fill(50,206,103,50);
noStroke();
ellipse(150,120,70,70);

fill(38,196,91,50);
noStroke();
ellipse(150,120,60,60);

fill(30,185,83,45);
noStroke();
ellipse(150,120,50,50);

fill(17,170,69,40);
noStroke();
ellipse(150,120,40,40);

fill(13,157,62,35);
noStroke();
ellipse(150,120,30,30);

fill(8,149,56,30);
noStroke();
ellipse(150,120,20,20);

//green


fill(250,111,160,60);
noStroke();
ellipse(270,230,150,150);

fill(240,46,107,55);
noStroke();
ellipse(270,230,130,130);

fill(242,39,104,50);
noStroke();
ellipse(270,230,110,110);

fill(245,32,100,45);
noStroke();
ellipse(270,230,90,90);

fill(250,111,160,40);
noStroke();
ellipse(270,230,70,70);

fill(247,17,90,35);
noStroke();
ellipse(270,230,50,50);

fill(250,15,90,30);
noStroke();
ellipse(270,230,30,30);

fill(252,13,89,25);
noStroke();
ellipse(270,230,20,20);

fill(255,5,84,20);
noStroke();
ellipse(270,230,10,10);

//red

fill(66,147,250,60);
noStroke();
ellipse(400,380,180,180);

fill(52,137,245,55);
noStroke();
ellipse(400,380,160,160);

fill(38,131,250,50);
noStroke();
ellipse(400,380,140,140);

fill(28,126,250,45);
noStroke();
ellipse(400,380,120,120);

fill(28,114,250,40);
noStroke();
ellipse(400,380,100,100);

fill(28,103,250,35);
noStroke();
ellipse(400,380,80,80);

fill(28,85,250,30);
noStroke();
ellipse(400,380,60,60);

fill(28,77,250,25);
noStroke();
ellipse(400,380,40,40);

fill(28,48,250,20);
noStroke();
ellipse(400,380,20,20);



