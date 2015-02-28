
size (200,200); 
background(0); 
stroke(255); 
smooth(); 
noFill();
for (int x=20; x<=180;x+=5) { 
  if (x<=100) {
    line (10,x,x,x);
  } else {
line (100,x,x,180);
}
}


