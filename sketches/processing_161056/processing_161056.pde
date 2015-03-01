
size (200, 200);
smooth ();
background (100);
noFill ();
for (int s = 5; s < 200; s += 5) {
  for (int f = 10; f < 200; f += 10) {
    if (s < 100) {
    stroke (#A176C6);
    rect (0, s, 200, s);
    } else {
    stroke (#76AEC6);
  line (f, 0, f, 200);
  }
}
}



