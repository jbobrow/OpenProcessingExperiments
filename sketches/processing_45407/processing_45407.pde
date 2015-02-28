
size (650, 650);

background (0);

strokeWeight (1);    

stroke(2);
fill (182,62,234,45);
for (int i=0; i<325; i+= 25){
ellipse (325,325,325,i);    
}


stroke(118,10,124);
strokeWeight (2); 
beginShape (); 
for (int i=0; i<650; i+= 10){ 
  line (325,i,i,325);     
}

stroke (118,10,124);
fill (220,92,227,25);
triangle (50,50,325,0,0,325);

stroke (118,10,124);
fill (220,92,227,25);
triangle (600,600,325,650,650,325);

