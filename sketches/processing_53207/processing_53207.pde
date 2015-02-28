
size(250,250);
background(255);
translate(125,125);
rectMode(CENTER);
noStroke();
/*Start x at 180, and as long as x is greater than 0, we will subtract 10*/
for(int x=180; x>0;x-=10){
  triangle(0,0,x,x,100,0);
  rotate(PI/0.6);
  fill(0,255-x,189);
}
                
                
