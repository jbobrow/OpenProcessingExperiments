
smooth () ;

size(700,600); 
background(0,0,0); 

for(int i=0; i<20; i=i+1){
  
  noStroke();
  
  fill(255,230,3);
  rect(random(800),random(800),200,200);
}

for(int i=0; i<1000; i=i+1){
  
  noStroke();
  
  fill(random(2),random(207),random(216),80);
  rect(random(800),random(800),40,40);
}


for(int i=0; i<20; i=i+1){
  
  noStroke();
  
  fill(255,230,3);
  rect(random(800),random(800),200,200);
}

saveFrame("layers.jpg");

