
background(255);
size (600, 600);
smooth ();
noFill();
stroke (120,30,0);

for (int i=-800; i <2000; i++) {
  bezier( width/2, height/2,
  random (width), random (height),
  random (width),random (height),
  random (width),random (height));  
}

noFill ();
stroke(255);
for (int i=-50; i <400; i++) {
  bezier( width/2, height/2,
  random (width), random (height),
  random (width),random (height),
  random (width),random (height));
  
}

smooth ();
noFill();
stroke(0,30,10);

for (int i=-200; i <0; i++) {
  bezier( width/2, height/2,
  random (width), random (height),
  random (width),random (height),
  random (width),random (height));
  
}

