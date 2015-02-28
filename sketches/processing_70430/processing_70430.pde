
size(800, 800);
background(128);
noStroke();

char c = 0x0;
for (int i=0; i<1024; i++) {
  float s = 0;
  for (int j=-2; j<3; j++) {
    s+= (char)((c>>(7-(i+j)%8))&1);
  }

  s = s*255/5;

  fill(int(s), 128);
  ellipse((i % 32)*width/32-width/64, (i/32)*height/32+height/64, width/16, height/32);
  //rect((i2)*width/32-width/64, (i/32)*height/32+height/64, width/16, height/32);

  if ((i%8 == 0)&&(i!=0)) {
    c++;
  }
}

