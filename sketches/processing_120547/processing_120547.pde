
int eSize = 3;
int eSize1 = 25;

size(565, 400);
background(255);
stroke(0);

//haikei
for(int y=0; y<=height; y+=20){
  for(int x=0; x<=282; x+=20){
  
    if(x > 0 && x < 282){
      fill(0);
    }
    else{
      fill(0);
    }
    ellipse(x, y, eSize, eSize);
    println("x=" + x + ", y=" + y);
  }
}

for(int y=0; y<=height; y+=20){
  for(int x=302; x<=width; x+=20){
  
    if(x > 282 && x < 565){
      fill(0);
    }
    else{
      fill(0);
    }
    ellipse(x, y, eSize1, eSize1);
    println("x=" + x + ", y=" + y);
  }
}

//line
stroke(255, 110, 0);
strokeWeight(3);
line(0, 0, 286, 400);
stroke(255, 110, 0);
strokeWeight(3);
line(289, 400, 565, 0);
stroke(255, 110, 0);
strokeWeight(3);
line(0, 158, 565, 158);

//ookii maru
fill(200, 0, 0);
noStroke();
ellipse(290, 88, 140, 140);
//hidariue maru
noStroke();
ellipse(140, 35, 60, 60);
//migi ue maru
fill(255, 110, 0);
noStroke();
ellipse(440, 110, 60, 60);
fill(255, 255, 0);
noStroke();
ellipse(287, 300, 100, 100);
//shita maru
fill(192, 192, 192);
noStroke();
ellipse(360, 194, 70, 70);
noStroke();
ellipse(220, 194, 70, 70);
//hidarishita shikaku
fill(200, 0, 0);
noStroke();
quad(100, 250, 150, 300, 100, 350, 50, 300);
//migishita shikaku
noStroke();
quad(465, 250, 515, 300, 465, 350, 415, 300);






