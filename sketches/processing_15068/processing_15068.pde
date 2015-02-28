
size(300,300);
background(0,255,150);
strokeWeight(0.2);
for( int x=0; x<=300; x=x+1){
  line(0,x,300,random(300));
  line(x,0,random(300),300);
}
                
                                
