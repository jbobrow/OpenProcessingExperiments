
//Clay B. Block 8 Repeating pattern
size(500,500);
 background(0,0,0);
noFill();
smooth();
stroke(68,216,20);
strokeWeight(1.99999);
int x = 0;
while( x < 500)
{
   
  fill(250,250,250);
  x = x + 10;
  ellipse(x,250,80,80);
  stroke(232,19,22);
  rect(x,100,60,60);
  rect(x,400,60,60);
  
}  



