
size(320,320);
colorMode(RGB,100);
background(80);

for (int x=20; x < width; x+=35){
  if(x%2==0) {
    fill(255,0,0);
    rectMode(CENTER);
    rect(x,height/2,25,25);
  }
  else{
    fill(0,255,0);
    ellipse(x,height/2,25,25);
  }
}

