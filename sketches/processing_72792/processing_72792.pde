
size(490,810);
background(#ff3456);

for(int y=100; y<=760; y+=80){
  for(int x=80; x<=450; x+=80){
    noStroke();
    colorMode(HSB);
    for(int i =0; i<width;i++){
    float myHue=x*250.0/(1*width);
    fill(myHue, 220, 220);
    ellipse(x+40, y+20, 80, 80);
    }
  }
}

noFill();
for (int x=0;x<=width; x+=80) {
  for (int y=0; y<=height; y+=80) {
    for (int d=160; d>0; d-=10) {   
      rect(x, y, d, d);
      strokeWeight(3);
      stroke(#BBF207);
    }
  }
}


