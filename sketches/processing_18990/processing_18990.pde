
// Adam Oaks

size(315,315);
smooth();


for(int x=15; x<300; x+=35){
  if(x%2==0){
    fill(0,255,0);
    ellipse(x,height/2,25,25);
  }else{
    fill(255,0,0);
    rectMode(CENTER);
    rect(x,height/2,25,25);
  }
}

