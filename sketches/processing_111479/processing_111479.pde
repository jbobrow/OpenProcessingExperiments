
size(500, 500);

background(0);
strokeWeight(1);
noFill();



for (int x = 0; x <= width; x+=30) {
  bezier( x, 490-x, 450, 490, 490, 490, 490-x, x);
  float r = random (0,100);
  stroke(255,50);
}


for (int x = 0; x <= width; x+=30) {
  bezier(490-x, x, 450, 490, 490, 490, x, 490-x);
}



//for (int y = 0; y <= height; y+=30) {
//bezier( y, 490-y, 490, 30, 490, 490, y, 490-y);
//}

for (int x = 0; x <= width; x+=30) {
  float r = map(x/30, 0, width, 0,255);

}

for (int x = 0; x <= width; x+=30) {
  bezier( x, 490-x, 50, 30, 30, 50, 490-x, x);
}


