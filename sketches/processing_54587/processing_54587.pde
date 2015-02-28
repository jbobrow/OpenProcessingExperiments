
background(250);
 
size(500,500);

 background(250,50,50);
translate(250,250);
 
for(float i=0; i<200; i++){
   
  rotate(0.2);
      
       
  noStroke();
      fill(random(0),random(0),random(250));
  ellipse( i,(20),(20),random(20));
  
   
  }

