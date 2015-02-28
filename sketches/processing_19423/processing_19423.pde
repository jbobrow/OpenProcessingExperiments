
size (250, 250);
background (0, 255, 255,30);
 
 
for(int y=0; y<=250; y+=4){
  for(int x=0; x<=250; x+=4){
    strokeWeight (3);
    {stroke (y+89, 255, 255);
    point (x, y);
  }
 }
}
//background
 //glow
noFill();
stroke (#3BC6EA, 180);
smooth();
strokeWeight (1);
for(int x = 0; x <= 125; x += 20) {
  bezier(0, height / 2, x, (height / 2) + x, x, (height / 2) - x, 250, height / 2);
  bezier(0, height / 2, x, (height / 2) - x, x, (height / 2) + x, 250, height / 2);
}

// beziers
noFill ();
stroke (#A3C439, 100);
strokeWeight(2);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (0, height / 2, iB, (height / 2) + iB, iB, (height / 2) - iB, 250, height / 2);
};

stroke (#F22E3E, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (0, height / 2, iB-50, (height / 2) + (iB / 2), iB, (height / 2) - iB, 250, height / 2);
};
stroke (#C98127, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (0, height / 2, iB + 50, (height / 2) - (iB / 2), iB, (height / 2) + iB, 250, height / 2);
};
stroke (#B3E3FC, 50);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (0, height / 2, iB + 30, (height / 2) - iB, iB - 100, (height / 2) + iB, 250, height / 2);
};
size (250, 250);
background (0, 255, 255,30);
 
 
for(int y=0; y<=250; y+=4){
  for(int x=0; x<=250; x+=4){
    strokeWeight (3);
    {stroke (y+89, 255, 255);
    point (x, y);
  }
 }
}
//background
 //glow
noFill();
stroke (#3BC6EA, 180);
smooth();
strokeWeight (1);
for(int x = 0; x <= 125; x += 20) {
  bezier(0, height / 2, x, (height / 2) + x, x, (height / 2) - x, 250, height / 2);
  bezier(0, height / 2, x, (height / 2) - x, x, (height / 2) + x, 250, height / 2);
}

// beziers
noFill ();
stroke (#A3C439, 100);
strokeWeight(2);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (0, height / 2, iB, (height / 2) + iB, iB, (height / 2) - iB, 250, height / 2);
};

stroke (#F22E3E, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (0, height / 2, iB-50, (height / 2) + (iB / 2), iB, (height / 2) - iB, 250, height / 2);
};
stroke (#C98127, 100);
for (int iB = 0; iB < 150; iB+=20) {
  bezier (0, height / 2, iB + 50, (height / 2) - (iB / 2), iB, (height / 2) + iB, 250, height / 2);
};
stroke (#B3E3FC, 50);
for (int iB = 0; iB < 150; iB+=15) {
  bezier (0, height / 2, iB + 30, (height / 2) - iB, iB - 100, (height / 2) + iB, 250, height / 2);
};


