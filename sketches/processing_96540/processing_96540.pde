
size(200,200);
background(255);
 
int x=15;
int y=15;
  
strokeWeight (2);
stroke(0);
for(int i=0 ; i<10 ; i++){
  line (100,y,10,x+y);
  x+=10;
  y+=20;
}
