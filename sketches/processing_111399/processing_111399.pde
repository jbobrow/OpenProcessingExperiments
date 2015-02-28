
size(500,500);
background(0);

for(int i=0; i<520; i=i+58){
  for(int j=0; j<520; j=j+58){
    
    strokeWeight(.5);
    fill(94,206,227,80);
    ellipse(i+25, j+25, 10, 10);
    fill(137,199,211,100);
     ellipse(i+30, j+30, 10, 10);
    
    strokeWeight(1);
    stroke(255,80);
    point(i,j);
    
    stroke(255,80);
    point(i+5,j+5);
    
     strokeWeight(2);
    stroke(195, 198, 188);
    point(i+10,j+10);
    
    stroke(195, 198, 188);
    strokeWeight(5);
    point(i+15,j+15);
    
  }
  
}    
  


