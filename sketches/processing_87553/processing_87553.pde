
size(500, 500);
noStroke();
background(250);

float x=40;

for (float i=(x/2); i<=width; i +=x) {
  for (float d=(x/2); d<=height; d +=x) {
    fill (0, 50);
    stroke (255, 100);

    fill(154, 196, 175);
    ellipse(i, d, 40, 40);
   
    fill(215, 255, 85);
    ellipse(i, d+10, 20, 20);
    
     fill(255, 85, 170);
    ellipse(i+25, d*2, 10, 10);
  }
}



