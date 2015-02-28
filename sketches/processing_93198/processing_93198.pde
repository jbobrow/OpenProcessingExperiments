
size(450, 450);
background(65,122,178);
fill(200,200,200);
stroke(3);
rect(150,100,200,500);
fill(100,100,100);
rect(0, 480, 500, 20);


for (int i = 40;  i < 350; i = i+5) {
  for (int j = 40; j < 400; j = j+5) {
  rect(i,j,20,20);
  }
}

fill(0,150,0);
rect(0,440,450,10);

stroke(80,83,53);
strokeWeight(4);
line(410,440,410,400);

stroke(80,255,80);
strokeWeight(7);
point(410,400);
stroke(80,255,80);
strokeWeight(7);
point(415,405);
stroke(80,255,80);
strokeWeight(7);
point(405,405);
