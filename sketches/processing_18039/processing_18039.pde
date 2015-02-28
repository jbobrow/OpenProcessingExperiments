
size(250, 250);
smooth();
background(240, 151, 141);
noFill();


for(int i=125; i<250; i+=10){
  stroke(29, 17, 65);
bezier(0, i-130, 10, 30, 200, i, 220, i-50);
}

for(int i=125; i<250; i+=10){
  stroke(149, 15, 67);
bezier(0, i-50, 10, 230, 200, i, 220, i-50);
}

for(int i=125; i<250; i+=10){
  stroke(109, 95, 87);
bezier(0, i+50, 10, 350, 200, i, 220, i-50);
}

for(int i=75; i<200; i+=10){
  stroke(136, 101, 36, 200);
  strokeWeight(1.2);
line(220, i, 250, i);
}

fill(247, 170, 139, 90);
noStroke();
ellipse(110, 100, 200, 300);

fill(255, 255, 255, 20);
noStroke();
ellipse(230, 50, 80, 90);
ellipse(100, 90, 170, 200);
ellipse(185, 50, 150, 75);
ellipse(180, 0, 40, 50);
ellipse(55, 200, 90, 80);
ellipse(185, 185, 130, 120);
ellipse(75, 100, 75, 85);
ellipse(0, 0, 195, 100);




