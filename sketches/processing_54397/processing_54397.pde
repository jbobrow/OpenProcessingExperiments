
size(250,250);
background(255);
noStroke();

rectMode(CENTER); //rectangles drawn from centre
fill(50,0,0);

translate(125,125); //shape in center 
for(int x=180; x>0;x-=10){

fill((x-255)*-1,0,0);

rect(0,0,x,x);//rect size

rotate (0.5); // amount to be rotated by
}

                
                                
