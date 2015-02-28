
size(400,400);
rectMode(CENTER);
for(float x = 22; x < 400; x+=35){
  if( x % 2 ==0){
    fill(255,0,0);
    rect(x,height/2,25,25);
  }
    else{
      fill(0,255,0);
      ellipse(x,height/2,25,25);
    }
}

