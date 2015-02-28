
size(600,400);
background(#000000);
noFill();
smooth();


for(int y=0; y<=600; y+=40){
  for(int x=20; x<=500; x+=40){
    noStroke();
    colorMode(HSB);
    for(int i=0; i<100; i++){
    float myHue=x*255.0/(2*width);
    fill(myHue, 255, 255);
    rect(x+30, y+10, 20, 20);
    }
  }
}

noFill();
for (int x=0;x<=width; x+=100) {
  for (int y=0; y<=height; y+=100) {
    for (int d=100; d>0; d-=10) {
      ellipse(x, y, d, d);
      stroke(#000000);
      strokeWeight(2);
    }
  }
}




