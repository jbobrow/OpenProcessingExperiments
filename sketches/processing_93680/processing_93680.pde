
size(200,200);
background(135,206,250);
noStroke();
fill(84,139,84);
rect(0,150,width,height);
fill(60);
quad(50,200,180,200,150,180,50,180);
translate(0,-20);
stroke(100);
fill(255,222,173); 
rect(50,50,100,150);
for (int i = 50; i < 190; i = i+10) {
  line(50, i, 150, i);
}
line(50,50,50,200);
line(150,200,150,50);
for (int j = 50; j < 160; j = j+10) {
  line(j, 50, j, 170);
}
fill(200);
rect(80,185,40,15);
