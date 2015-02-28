
size(300,300);

for(int x = 18; x < width; x+=33){
  if(x % 2 <= 0){
    rectMode(CENTER);
    fill(255,0,0);
    rect(x,150,25,25);
  }
  else{
    fill(0,255,0);
    ellipse(x,150,25,25);
  }
}

