
// Rafael Exercicio de Reforço 4 (normal)

size(200, 200);
background(0);
noStroke();

for(int x= 10; x<200; x=x+15){

  fill(0, 180, 70, 115*x/75);
    ellipse(x, 35, 35,50);
 }

for(int y= -200; y<200; y=y+20){

  strokeWeight(15);
  stroke(120, 12, 255);

point(y+100, y*y/75 + 100);
}
