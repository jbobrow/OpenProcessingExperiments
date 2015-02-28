
/* 
David's
Fine
Assortment
Of
Letters
And
Numbers
*/

size(600,600);
background(255);
smooth();


//circular pattern from fig. 6-03 pg. 63 "Processing"
noFill();
for (int d = 600; d > 0; d -= 10) {
  ellipse(300,300,d,d);
}


//ellipse 'shift' from pg. 61 "Processing"
//for (int i = 30; i < 300; i += 30) {
 // ellipse(i, 300, i, 350);
//}


//point-grid, lifted from processing.org reference for 'for'
for (int i = 0; i < 600; i = i+10) {
  for (int j = 0; j < 600; j = j+10) {
    beginShape(POINTS);
    vertex(i, j);
    endShape();
    // instead of 'point', using vertexs for begin shape 
    // in 'points' mode
    
    
    // failed WHILE experiment
    //while(i<500 && j<500) {
    //  rect(300,300,i,j);
    //}
  }
}


//example of embedded 'for' structure
//last on pg. 66 "proccesing"

for (int y = 0; y <= 600; y += 5) {
  for (int x = 0; x <= 600; x += 5) {
    if ((x % 10) == 0) {
      line(x, y, x+5, y-5);
    } else {
      line(x, y, x+5, y+5);
    }
  }
}




// experiment with vertices; triangles fan around centre point
// pg. 72 "Processing"


beginShape(TRIANGLE_FAN);
vertex(300,300);
vertex(300,0);
vertex(450,0);

vertex(300,300);
vertex(450,0);
vertex(600,150);

vertex(300,300);
vertex(600,150);
vertex(600,300);

vertex(300,300);
vertex(600,300);
vertex(600,450);

vertex(300,300);
vertex(600,450);
vertex(450,600);

vertex(300,300);
vertex(450,600);
vertex(300,600);

vertex(300,300);
vertex(300,600);
vertex(150,600);

vertex(300,300);
vertex(150,600);
vertex(0,450);

vertex(300,300);
vertex(0,450);
vertex(0,300);

vertex(300,300);
vertex(0,300);
vertex(0,150);

vertex(300,300);
vertex(0,150);
vertex(150,0);

vertex(300,300);
vertex(150,0);
vertex(300,0);



