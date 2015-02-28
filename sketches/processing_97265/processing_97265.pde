
//Reforço4
//Giovanna DallaCruz
size(200, 200);
background(0);
noStroke();
for (int i=10;i<35;i+=5) {
  for (int y=3;y<200;y+=5) {
    fill(255, 0, 0);
    ellipse(i*5, 100, 34, 34);
    fill(0, 255, 0);
    ellipse(y+100, y*y/100+100, 5, 5);
    fill(0, 0, 255);
    ellipse(-y+100, y*y/100+100, 5, 5);//Parábola invertida
  }
}
