
//yi-ting sie
//課程練習
//畫面中的紅色線條在每次開啟時會自行改變
//Sheng-Fen Nik Chien (2011), Wiggle Lines, http://www.openprocessing.org/visuals/?visualID=44031 


size(500, 500);
background(255);
strokeWeight(5);
smooth();

//斜線
stroke(200);
line(50, 50, 450, 450);

//變動的斜線
stroke(190,50,30);

float xstep = 15;
float ystep = 15;
float lastx = 50;
float lasty = 50;
float y = 50;

for (int x=50; x<=450; x+=xstep) { 
  
ystep = random(50)-10;
y += ystep;

line(x,y, lastx, lasty); 

lastx = x;
lasty = y;

}



