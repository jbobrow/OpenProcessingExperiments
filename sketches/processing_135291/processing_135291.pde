
//Control 2 - Repetition
//Exercise #3
/* 3. Combine two relational expressions with a logical operator 
to control the form of a pattern. */

size (300,300);
fill(255);
for (int y = 0; y <= 600; y += 30) {
for (int x = 0; x <= 600; x += 30) {
  
 ellipse(x + y/30 +5, y +5 , 30 , 30);
 ellipse(x+y/30+5, y+5, 10,10);
 rect (x + y/30+5, y+5, y+x/30, y);
}
}


