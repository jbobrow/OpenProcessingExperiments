
//this is a single line comment

//parameters

//control+t cleans up text

size(300, 300);
smooth();

//display color 0 (black) -> 255 (white)
background(222,87,199);

stroke(200);
//1 value is bw
//2 value is bw w/ alpha
//3 rgb
//4 rgb w/ alpha

//same with stroke, fill, background

fill(200,50,25,90);

smooth();

//line x1 y1, x2 y2);
line(10,200,110,130);

line(0, 30, 100, 30);
//(top left corner x y, side)
rect(110, 30, 30, 30);
fill(44,237,242,95);
quad(140,70, 140,91, 110,130, 110,70);
fill(255,80);

line(130,0,  120, 280);
triangle(10, 200, 10, 280, 120, 280);
//(centerpoint,   diameter)
ellipse(110,200, 50,50);
fill(255,90);
stroke(0);
point( 110,155);




