
size (800, 800);
smooth ();
background (0);
stroke (255);

for (int y=10; y<800; y+=20) { 
  for (int x=10; x<800; x+=20) {
    point(x, y);
  }
}

for (int y=15; y<800; y+=15) { 
  for (int x=15; x<800; x+=15) {
    point(x, y);
  }
}


