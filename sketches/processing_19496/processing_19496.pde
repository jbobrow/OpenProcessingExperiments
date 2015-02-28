
size(300,300);
rectMode(CENTER);
for(int x=0; x<9; x++){
  if(x%2==0){
    fill(225,0,0);
    rect(width/18 + width/9 *x,height/2,25,25);
  }else{
    fill(0,225,0);
    ellipse(width/18 + width/9 *x,height/2,25,25);
  }
}


