
size(300,300);
background(205,205,205);
smooth();


for(float x =24; x<width; x+= 31){
  if(x% 2<= 0){
    rectMode(CENTER); 
    fill(255,0,0); 
    rect(x,height/2,25,25); 

  }else{
      fill(0,255,0); 
    ellipse(x,height/2,25,25);
  
}
}

