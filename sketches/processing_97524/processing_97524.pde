
size(400,400);
background(20);
stroke(100);
strokeWeight(5);
 
// draw the y-axis 
line(0,200,360,200);
 
// bars every 45 degrees
for (int n=0; n<=360; n=n+45) {
    println (n);
    line(n,190,n,210); 
  
}
 
// draw cosine
float y;
 
// loop through 0 to 360 and plot each point
for (int x=0; x<360; x = x+1) {
  y = cos(radians(x));
  // map re-calculates a value so that it is now
  // in a different range, x is going from -1,1 to 100,300,
  // to place it into the vertical middle of the screen
   
  point(x,map(y,-1,1,100,300));
}

