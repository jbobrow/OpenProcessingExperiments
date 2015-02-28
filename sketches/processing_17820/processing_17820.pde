
size(250, 250);
background(0);

smooth();

noFill();

strokeWeight(1);

stroke(#0267E8, 150);

//top left
for(int ex = 10; ex < 150; ex += 20){
  for(int ey = 10; ey < 150; ey += 20){
    ellipse(31.25, 31.25, ex, ey);}
}

for(int ex = 10; ex < 150; ex += 20){
  for(int ey = 10; ey < 150; ey += 20){
    ellipse(125, 31.25, ex, ey);}
}

for(int ex = 10; ex < 150; ex += 20){
  for(int ey = 10; ey < 150; ey += 20){
    ellipse(218.75, 31.25, ex, ey);}
}

//second row
for(int ex = 10; ex < 150; ex += 30){
  for(int ey = 10; ey < 150; ey += 30){
    ellipse(31.25, 125, ex, ey);}
}

for(int ex = 10; ex < 150; ex += 30){
  for(int ey = 10; ey < 150; ey += 30){
    ellipse(125, 125, ex, ey);}
}

for(int ex = 10; ex < 150; ex += 30){
  for(int ey = 10; ey < 150; ey += 30){
    ellipse(218.75, 125, ex, ey);}
}

//third row
for(int ex = 10; ex < 150; ex += 40){
  for(int ey = 10; ey < 150; ey += 40){
    ellipse(31.25, 218.75, ex, ey);}
}

for(int ex = 10; ex < 150; ex += 40){
  for(int ey = 10; ey < 150; ey += 40){
    ellipse(125, 218.75, ex, ey);}
}

for(int ex = 10; ex < 150; ex += 40){
  for(int ey = 10; ey < 150; ey += 40){
    ellipse(218.75, 218.75, ex, ey);}
}


