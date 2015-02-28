
//Processing Sketch by Karen Vertierra//

size(250, 250);
translate(125, 125);
background(255);
rectMode(CENTER);
fill(138, 20, 76);
stroke(232, 130, 174, 98);
smooth();
 
for(int x=360; x>0;x=x-5){
  rect(2,2,x,x);
  fill(280-x, 0, 100);
  rotate(PI/9);
}



