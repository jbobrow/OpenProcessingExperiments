
size (350,350);
 
 
for (int x=20; x<width;x+=35)
{
 if(x%2==0) {
  rectMode(CENTER);
 fill (255,0,0);
rect(x,168,25,25); 
  
}
else {
    fill(0,255,0);
 ellipse (x,168,25,25);
  
   
}
}

