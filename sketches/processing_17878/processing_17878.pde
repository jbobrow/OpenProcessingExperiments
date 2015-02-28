
size(250, 250);
background(#DBEA66);
smooth ();
strokeWeight(0.7);
stroke (#860E89);
fill(#5EC1BA, 15);
for(int x = 5; x<220; x +=30) {
  ellipseMode(CENTER);
ellipse(65, 20, 50, x); 
ellipse(65, 20, x, 50); 
noStroke();
rect(0, 0, x, x); 
strokeWeight(0.7);
stroke (#860E89);
ellipse(65, 20, x, x); 
} 
ellipseMode(CORNERS);
for (int y=30; y<240; y+=70){
ellipse (60, 60, y/2.5, y/2.5);
}


