

size(600, 600);
background(100,200,200);
//stroke(255);
//strokeWeight(5);

for (int i=0; i<=width; i=i+60) {
  for (int j=0; j<=height; j=j+60) {
    fill(255,50);
    stroke(255);
    strokeWeight(4);
    arc(i-20,j-20,160,160,PI/2,PI+PI/2);
  }
}


for (int i=0; i<=width; i=i+60) {
  for (int j=0; j<=height; j=j+60) {
    fill(200,250,190,50);
    stroke(100,200,50);
    strokeWeight(2);
    arc(i-20,j-20,100,100,PI/2,PI);
  }
}




