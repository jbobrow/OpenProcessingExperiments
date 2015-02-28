
//for loop example

size(400, 400); 
smooth(); 
background (255);
strokeWeight(2); 
stroke (20, 200, 60);
for (int i = 30; i < 400; i += 20) {
  fill(150, 60, 190);
  rect(i, 0, i*1.5, i);
}


