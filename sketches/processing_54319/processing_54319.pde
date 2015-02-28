
size(250,250);

translate(125,125);
background(#fffdd0);


rectMode(CENTER);
fill(50);
/*noStroke();*/
strokeWeight(3); 
smooth();

for(int x1 = 180; x1 > 0; x1 = x1 - 5){
rect(0, 0 ,x1 ,x1);
rotate(PI/10);
fill(300 - x1, 0,0);
}


