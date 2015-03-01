
size(600, 300);
colorMode(HSB,360,100,100,100);
background(0);

for (int k= 10; k <= 300; k+=10) { 
fill(0,0,k,k);
rect(300, 0, 300, k);
}

for (int k= 10; k <= 300; k+=10) {  
  line(150, 150, 300, 150);
  line(150, 75, 150, 150);
  line(150, 75, 225, 75);
  line(225, 75, 225, 95);
  line(225, 95, 170, 95);
  line(170, 95, 170, 130);
  line(170, 130, 200, 130);
  line(200, 130, 200, 115);
  line(200, 115, 280, 115);
  line(280, 115, 280, 25);
  line(280, 25, 245, 25);
  line(280, 25, 245, 25);
  line(245, 25, 245, 40);
  line(245, 40, 150, 40);
  line(150, 10, 150, 40);
  line(150, 10, 80, 10);
  line(80, 10, 80, 40);
  line(80, 40, 130, 40);
  line(130, 40, 130, 75);
  line(130, 75, 105, 75);
  line(105, 75, 105, 105);
  line(105, 105, 45, 105);
  line(45, 105, 45, 200);
  line(45, 200, 150, 200);
  line(150, 300, 150, 200);
  ellipse(150,150,5,5);
  ellipse(45,200,5,5);
  ellipse(245,40,5,5);
  ellipse(225,75,5,5);
  ellipse(190,190,5,5);
  ellipse(85,85,5,5);
  stroke(0,0,100,k); 
  noFill();  
  rect(190, 190, 50, 50);
  rect(180, 180, 70, 70);
  rect(10, 240, 50, 50);
  rect(0, 230, 70, 70);
  rect(20, 250, 30, 30);
  rect(5, 5, 50, 50);
  rect(25, 25, 10, 10);
  rect(55, 160, 30, 30);
  rect(120, 90, 10, 10);
  rect(55, 55, 30, 30);
  rect(260, 260, 10, 10);
  rect(260, 260, 10, 10);
}


for (int k= 10; k <= 1000; k+=10) { 
  stroke(k,k,0,k);
  ellipse(450, 150, k, k);
}

for (int k= 10; k <= 99; k+=10) { 
  stroke(k,k,0,k);
  ellipse(350, 105, k, k); //migi ellipse
  ellipse(405, 250, k, k); //shita  ellipse
  ellipse(495, 50, k, k); //ue ellipse
  ellipse(550, 195, k, k); //migi ellipse
}

for (int k= 10; k <= 66; k+=10) { 
  stroke(k,k,0,k);
  ellipse(420, 50, k, k); //ue small ellipse
  ellipse(480, 250, k, k); //shita small ellipse
  ellipse(550, 120, k, k); //migi small ellipse
  ellipse(350, 180, k, k); //hidari small ellipse
}


