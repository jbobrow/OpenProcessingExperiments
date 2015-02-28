
size(400, 600);
int x = 300;
point(x,300);

background(255);

smooth();
beginShape();  //body
fill( 200);
quad(10, 10, 390, 10, 370, 390, 30, 390);
endShape(CLOSE);

fill(255);   //eyes
ellipse(125, 100, 100, 100);
ellipse(275, 100, 100, 100);

fill( 0, 0, 255); //pupils

ellipse(125, 100, 50, 50);
ellipse(275, 100, 50, 50);

fill(255);


fill(0);
ellipse(275, 100, 30, 30);
ellipse(125, 100, 30, 30);
fill(100); //nose
ellipse(200, 180, 50, 50);

line(100, 240, 300, 240); //mouth
fill(255);// teeth
triangle(100, 240, 120, 240, 110, 260);
triangle(300, 240, 280, 240, 290, 260);


fill(0); //body
quad(10, 300, 390, 300, 370, 500, 30, 500);

fill(255); //tie

triangle( 80, 320, 185, 370, 80, 400);
triangle(310, 320, 310, 400, 210, 370);

ellipse(200, 370, 30, 40);

