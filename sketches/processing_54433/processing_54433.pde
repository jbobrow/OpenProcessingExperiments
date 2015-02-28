
size(500,500);
background(#ffffff);
translate(250,250);
noStroke();
smooth();
for(float i=0; i<200; i++){
 
    

  fill(random(255),random(0),random(0));
  rotate(0.2);
  ellipse(i,0,10,15);
 

  
}

for(float i=0; i<200; i++){
  fill(random(255),random(0),random(0),random(5));
  rotate(0.2);
  ellipse(i,0,330,330);
  
  
}

