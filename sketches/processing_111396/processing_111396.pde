
size(500,500);
background(0);
smooth();

strokeWeight(1);

for(int i=0; i<510; i=i+30){

  stroke(#284A7E);
     line(500, i, 0, 500);  
 
 fill(0);
     stroke(#008383);
     rect(0, i, 500, 500);
     
     stroke(#008383);
     line(0, i, 250, 350);
  
     stroke(#284A7E);
     line(500, i, 250, 350);
     
     stroke(#284A7E);
     ellipse(500, i, 50, 50);
    
    stroke(#284A7E);
     ellipse(0, i, 50, 50);
 
 }


