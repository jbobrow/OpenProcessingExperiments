
size (250,250);
background (0);
smooth ();

//large circles
noStroke();
for (int y=0; y<=250; y+=40){
  for (int x=0; x<=250; x+=40){
fill( #10344B);
    ellipse (x,y, 45, 45);
  }
}

//smaller circles
fill(#17A1FA, 70);
for(int y = 0; y < 280; y += 40) {
  for(int x = 0; x < 280; x += 40) {
    ellipse(x, y, 20, 20);
  }
}

//large circles
stroke (#043D67, 100);
strokeWeight (9);
for (int y=20; y < 280; y+= 100){
  for(int x = 20; x < 280 ; x+= 100){
    ellipse (x,y, 110,110);
  }
}

fill (#ACD7F7, 50);
noStroke();
for (int y=20; y < 280; y+= 100){
  for(int x = 20; x < 280 ; x+= 100){
    ellipse (x,y, 90,10);
  }
}

fill (#ACD7F7, 50);
noStroke();
for (int y=20; y < 280; y+= 100){
  for(int x = 20; x < 280 ; x+= 100){
    ellipse (x,y, 10,90);
  }
}

