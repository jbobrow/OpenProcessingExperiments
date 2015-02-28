
/**
 * Shape Primitives. 
 * 
 * The basic shape primitive functions are triangle(),
 * rect(), quad(), ellipse(), and arc(). Squares are made
 * with rect() and circles are made with ellipse(). Each 
 * of these functions requires a number of parameters to 
 * determine the shape's position and size. 
 */

size(500, 500);
background(#D8FFF4);
noStroke();

fill(#62FFBF);
ellipse(250, 250, 70, 70);

fill(#4BFFEE);
triangle(250, 50, 260, 210, 240, 210);
triangle(250, 450, 260, 290, 240, 290);
triangle(50, 250, 210, 240, 210, 260);
triangle(450, 250, 290, 240, 290, 260);

fill(#FF7686);
triangle(273, 216, 285, 230, 400, 100);
triangle(273, 284, 285, 270, 400, 400);
triangle(227, 216, 215, 230, 100, 100);
triangle(227, 284, 215, 270, 100, 400);

fill(#8BEDFF);
quad(267, 213, 263, 140, 325, 75, 323, 163);
quad(287, 235, 340, 180, 425, 170, 365, 240);
quad(287, 265, 365, 262, 425, 320, 347, 330);
quad(267, 287, 263, 370, 320, 427, 327, 342);
quad(233, 287, 237, 370, 180, 427, 177, 340);
quad(213, 265, 135, 262, 75, 320, 153, 330);
quad(213, 235, 160, 180, 75, 170, 135, 240);
quad(233, 213, 237, 140, 175, 75, 177, 163);


