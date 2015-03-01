
/*@pjs preload="test.png";*/

int eSize = 10;
int iSize = 20;

PImage img1;
 
size(400, 400);
colorMode(RGB, 400);
background(400);
noStroke();
img1 = loadImage("test.png");

for(int y =0; y <=400; y += 10){
  
  if(y == 0 || y <= 400 || y >= 10){
    fill(y, 200-y, 510-y, 100);
    rect(y, y, eSize, eSize);
  }
}
stroke(348, 371, 400, 400);
strokeWeight(50);
noFill();
ellipse(0, 510, 500, 500);

stroke(348, 371, 400, 400);
strokeWeight(5);
noFill();
ellipse(0, 510, 400, 400);

stroke(348, 371, 400, 400);
strokeWeight(20);
noFill();
ellipse(0, 510, 650, 650);

stroke(348, 371, 400, 400);
strokeWeight(2);
noFill();
ellipse(0, 510, 600, 600);

tint(3, 42, 255, 127);
image(img1, 300, 150, 50, 50);

stroke(400, 348, 400, 400);
strokeWeight(5);
line(325, 0, 325, 150);

for (int y =0; y <=510; y += 10){
  for (int x = 0; x <= 510; x += 10) {
  stroke(x, 200-y, 510-y, 30);
  rect(x, y, eSize, eSize);
  
  }
}

//for(int y = 0; y <= width; y += 20){
  //if(y >= 100 && x <= 300 && y >= 100 && y <= 300) {
    //fill (400);
  //} else {
    //fill(255, 219, 240, 255);
  //}
  
 //ellipse(x, y, eSize, eSize);
 //println(x);
//}



