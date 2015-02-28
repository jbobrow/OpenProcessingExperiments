
/* When background() is in setup(), the background is only drawn once, so
each square is subsequently drawn on top of the previously drawn square,
making it look as though there is a continuous chain of squares.

By moving background() into draw(), the background is drawn on top of each
previously drawn square, which, therefore, only shows a single square
follwing the cursor.
*/


