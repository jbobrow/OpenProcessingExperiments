

size(400, 400);



background(255);
stroke(240);
strokeWeight(3);
for(int x = -1; x < 400; x +=10){
 for(int y = -1; y < 400; y +=10){
  line(x, 0, x, 400); 
    line(x, y, 400, y);
}
}
noFill();
stroke(180);
for (int b = 200; b > 0; b -=10){
  ellipse(200, 0, b, b);
  ellipse(200, 400, b, b);
  
}

noFill();
stroke(90);
for (int d = 390; d > 0; d -=8){
  ellipse(400, 400, d, d);
  ellipse(0, 400, d, d);
  ellipse(0, 0, d, d);
  ellipse(400, 0, d, d);
  }



