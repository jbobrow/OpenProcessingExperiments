
size(300,300);
for(int x=0; x<width; x+=32){
  if(x%2==0){
    fill(225,0,0);
    rectMode(CENTER);
    rect(x+16,height/2,25,25);
  }else{
    fill(0,225,0);
    ellipse(x+16,height/2,25,25);
  }
  x++;
}


