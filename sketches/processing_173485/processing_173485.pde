

size (600,600);
background(0);

for(int y=-10; y<700; y=y+35){
 smooth (10);

 
 for(int x=-10; x<700; x=x+35){
   fill(y,y+10,100,0);  
   strokeWeight ((y+11)/40);
   stroke (y/2,y/2,y*600,20);
   ellipse(x,y,250,250);
   
   strokeWeight ((700-y)/20);
  ellipse(x,y,250,250);  
 }
}
