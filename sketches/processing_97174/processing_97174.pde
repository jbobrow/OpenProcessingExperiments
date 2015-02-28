
size (200, 200);
 background (#363636);
 for (int i=30; i<180; i=i+35) {
 for (int j=45;j<165;j=j+35) {
 if (j>114&&j<116 && i>89&&i<140) {
 fill (#A2CD5A);
  } 
 else {
 stroke(255);
}
 ellipse (i, j, 20, 20);
 stroke(255);
 if (j<140) {
 line (i, j+10, i, j+24);

    }
  if (i<150) {
 line (i+10, j, i+24, j);
 
 
}
}
 }
