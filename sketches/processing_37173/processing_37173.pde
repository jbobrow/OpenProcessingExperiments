
size (250, 250); 
background(255);
fill(255,0); 
 
for (int x=1; x<10; x=x+1) {
    for (int y=1; y<10; y=y+1) { 
     float f=x*20; 
     float g=y*20;
     
      fill (0, y*40);
      triangle (f+15,g+30, f+20, g+20, f+10,g+20);  
    }
}
                
