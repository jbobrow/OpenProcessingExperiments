

size(350,350);




for (int x=35; x<350; x+=35) 
{
  if(x%2==0) {
    fill(0,255,0);
    ellipse(x,height/2,width/12,height/12);
  }
  else {

    rectMode(CENTER);
    fill(255,0,0);
    rect(x,height/2,width/12,height/12);
  }
}


