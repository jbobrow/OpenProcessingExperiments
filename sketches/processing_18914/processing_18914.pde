
size(300,300);
rectMode(CENTER);
for(float x = 18; x < 300; x+=33){
  if( x % 2 ==0){
    fill(255,0,0);
    rect(x,150,25,25);
  }
    else{
      fill(0,255,0);
      ellipse(x,150,25,25);
    }
}

