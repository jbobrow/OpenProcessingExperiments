
size(800, 450);
smooth();
background(255);
fill(200, 100, 150, 20);
noStroke();
int d = width/2;

for (int a=d/4; a<=width; a=a+30) {  
  fill(200, 100, 150, 20);
  rect(0, a, a, height);
  for (int c=d/8; c<=height; c=c+10) {
    fill(130, 100, 150, 1);
    rect(0, 0, a, c);
//    quad(width/2,height/2, d/2, a/2, d, a, a, d);
  }
}

