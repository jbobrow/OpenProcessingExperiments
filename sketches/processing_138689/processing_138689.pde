
/*felix anderson
homework assignment 2
creative computing B
benjamin bacon 
*/

size(600,600);

int x = 25;
int y = 25;
int h = 20;

/*Variables up above.*/


rect (x, y, 300, h);
x = x + 100;
rect (x, y + h, 300, h);


strokeWeight (0);
fill (100,100,50);
rect (x-100, x, y+70, h+500);
triangle (x, x, x +200, y +100, y, y + 200);
triangle (x, x, x +200, y +500, y, y + 200);
fill (0);
triangle (x - 300, x+700, x +700, y +600, y-400, y + 400);
fill (0);
strokeWeight (5);
ellipse (x - 2, x, y, y);

/*I'm just testing out how to make variables. I still
don't have a clear idea of how it works but I'm starting
to get a hang of it.*/


  








