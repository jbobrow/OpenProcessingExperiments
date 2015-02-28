
size(500, 500);
smooth();
background(0);
noFill();
stroke(255,50);

rectMode(CENTER);

for (int x =0; x <= width; x+=50){
  
  fill(188,218,137,20);
  rect(width/2,height/2,x,x);

 // rect(0,0,x,x);
  
  fill(98,218,156,20);
 rect(width/2,height/2,2*x,x);
  rect(width/2,height/2,0.5*x,x);
 //fill(178,218,63,20);
  rect(width/2,height/2,x,x*0.4);
  


}


