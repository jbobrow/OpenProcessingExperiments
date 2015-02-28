
// Quiz 2011-09-14-B
// 10 points:
// 6 points: A 10x10 grid of down-pointing isosceles triangles are drawn.
// 2 points: A single variable controls the size and spacing of the triangles;
// they are exactly as tall as they are wide, and they are spaced at intervals
// equal to one-and-a-half times their width.
// 2 points: Each row of triangles is a darker and darker gray;
// The top row is exactly white, and the bottom row is exactly black.
// Image: http://cmuems.com/2011/resources/golan-quiz-2011-09-14/quiz-2011-09-14-b.jpg


size(400, 400);
background(255, 255, 255); 
stroke(0, 0, 0); 
smooth(); // a nicety

float w = 20;
for (int i=0; i<10; i=i+1) {
  for (int j=0; j<10; j=j+1) {
    float x = w + w/2 + i*(w * 1.5);
    float y = w +       j*(w * 1.5);

    float myGray = map(j, 0,9, 255,0);
    fill (myGray);
    triangle (x-w/2, y, x+w/2, y, x, y+w);
  }
}
                
