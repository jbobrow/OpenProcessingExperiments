
size(250, 250);
background(#D5DED9);
smooth();

noFill();

stroke(#547980, 150);
strokeWeight(0.5);
for(int y = 0; y < 250; y+= 30){
  for(int cy1 = 50; cy1 < 300; cy1 += 30){
    for(int cy2 = -50; cy2 < 200; cy2 += 30){
      bezier(0, y, 62.5, cy1, 187.5, cy2, 250, y);}
  }
}
   
stroke(#547980, 150);
strokeWeight(0.5);
for(int x = 0; x < 250; x += 30){
  for(int cx1 = -50; cx1 < 200; cx1 += 30){
    for(int cx2 = 50; cx2 < 300; cx2 += 30){
      bezier(x, 0, cx1, 62.5, cx2, 187.5, x, 250);}
  }
}

strokeWeight(30);
noFill();
//echoes
stroke(#594F4F, 10);
ellipse(125, 125, 240, 240);
stroke(#594F4F, 30);
ellipse(125, 125, 210, 210);
stroke(#594F4F, 60);
ellipse(125, 125, 180, 180);
stroke(#594F4F, 90);
ellipse(125, 125, 150, 150);
//dominant circles
stroke(#594F4F, 120);
ellipse(125, 125, 120, 120);
stroke(#547980, 120);
ellipse(125, 125, 90, 90);
stroke(#45ADA8, 120);
ellipse(125, 125, 60, 60);
stroke(#9DE0AD, 120);
ellipse(125, 125, 30, 30);
stroke(#E5FCC2, 120);
ellipse(125, 125, 0, 0);


