
/*@pjs preload="test.png";*/

int eSize = 10;

PImage img1;
 
size(400, 400);
colorMode(RGB, 400);
background(400);
noStroke();
img1 = loadImage("test.png");

for (int y =0; y <=400; y += 10){
  for (int x = 0; x <= 510; x += 10) {
  fill(x, 200-y, 510-y, 100);
  rect(x, y, eSize, eSize);
  
  //fill(400);
  //ellipse(x, y, iSize, iSize);
    
  //fill(x, 200-y, 510-y, 200);
  //ellipse(x, y, eSize, eSize);
  }
}

stroke(400, 400, 400, 127);
strokeWeight(50);
noFill();
ellipse(0, 510, 500, 500);

stroke(400, 400, 400, 127);
strokeWeight(5);
noFill();
ellipse(0, 510, 400, 400);

stroke(400, 400, 400, 127);
strokeWeight(20);
noFill();
ellipse(0, 510, 650, 650);

stroke(400, 400, 400, 127);
strokeWeight(2);
noFill();
ellipse(0, 510, 600, 600);



for (int y =0; y <=510; y += 10){
  for (int x = 0; x <= 510; x += 10) {

  
//fill(x, 200-y, 510-y, 200);
  //(x, y, eSize, eSize);
  }
}

//for (int y =0; y <=510; y += 10){
  //for (int x = 0; x <= 510; x += 10) {
//stroke(x, 200-y, 510-y, 100);
//strokeWeight(3);
//line(470, 0, 470, 510);
//(x, y, iSize, iSize);
  //}
//}




tint(3, 42, 255, 127);
image(img1, 300, 150, 50, 50);

//tint(3, 42, 255, 127);
//image(img1, 300, 150, 50, 50);

stroke(400, 400, 400, 127);
strokeWeight(5);
line(325, 0, 325, 150);

//stroke(400, 400, 400, 127);
//strokeWeight(5);
//line(425, 0, 425, 200);

strokeWeight(2);
for (int y =0; y <=510; y += 10){
  for (int x = 0; x <= width; x +=10) {
  //stroke(21+x,218+x,255);
  //line(x,200-x,x,510);
 
  //stroke(x,70,170);
  //line(y,x,x,y);
  }
}

for (int y =0; y <=510; y += 10){
  for (int x = 0; x <= 510; x += 10) {
  stroke(x, 200-y, 510-y, 30);
  rect(x, y, eSize, eSize);
  
  //fill(400);
  //ellipse(x, y, iSize, iSize);
    
  //fill(x, 200-y, 510-y, 200);
  //ellipse(x, y, eSize, eSize);
  }
}


