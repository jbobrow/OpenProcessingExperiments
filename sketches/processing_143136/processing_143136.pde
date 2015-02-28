

/* @pjs preload="skull.jpg"; */ 


  


size(900, 1000); 


background (10); 


PImage img; 


img = loadImage("skull.jpg"); 


  


for (int i=0; i<600; i += 100) { 


  for (int j=0; j<600; j += 50) { 


tint (30, 8*i, 44*i, 100); 


image(img, i ,j); 


  } 


} 


  


for (int i=0; i<600; i += 120) { 


tint (i*i, 250-i, 4*(.05*i), 70); 


image(img, i ,i); 


  


} 



