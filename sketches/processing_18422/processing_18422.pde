
size (250,250);
background (0);


stroke (255,140);
for (int y=-20; y <500; y+=10){
  line ( y,0, 0, y);
}

stroke (#5BF702);
smooth ();
for(int i = 3; i< 270; i+= 10){
  for (int y = -10; y < 274; y+=4){
  stroke(i+91, i+247, i+2);
    line(i, y, i+9, i+20);
}
}


