
size(250,250);
background(255); //background is white
noStroke();
rectMode(CENTER); //rectangle start from centre

fill(50,0,0); // bottom square is dark red
translate(125,125); // move origin to middle

for(int x=180; x>0;x-=10){ // variable x starts at 180, decrements by 10

fill((x-255)*-1,0,0); //colour changes value from dark to light

rect(0,0,x,x); // position stays the same, but size decreases by x
rotate (0.5); //shape rotates by radians 0.5
}
                
                
