
size(300,300);
background(0);
rectMode(CENTER);

for (int x = 25; x <=width; x += 25) {  //set variable for offset 1/2 of rect size
  for (int y = 50; y <= height; y+=50){  //set variable for full offset of rect size
  noStroke();
  fill(x,x,0);  
  rect(x, x , 50, 50);  //creates diagonal line that overlaps 1/2 in both x & y axis 
  rect(x-y, x+y, 50,50);  //fills in pattern below 
  rect(x+y, x-y, 50, 50);  //fills in pattern above
  }
}

