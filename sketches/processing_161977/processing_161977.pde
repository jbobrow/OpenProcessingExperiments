
void setup(){
size(400, 400);
background(255, 70, 150);  
}


void draw(){ 
//Spiral effect, I thought colors didn't look right on the
//lines so I left them black. 
line(210, 225, random(425), random(500) );
strokeWeight(3);
line(75, 290, 340, 290);
line(120, 120, 15, 160);
line(288, 120, 390, 160);
//top rects
fill(0, 0, 0);
rect(0, 0, 138, 80);
fill(255, 255, 255);
rect(138, 0, 138, 80);
fill(0, 0, 0);
rect(276, 0, 138, 80);
//bottom rects
fill(255, 255, 255);
rect(0, 319, 138, 80);
fill(0, 0, 0);
rect(138, 319, 138, 80);
fill(255, 255, 255);
rect(276, 319, 138, 80);
//top ellipses
fill(255, 255, 255);
ellipse(65, 40, 100, 50);
fill(0, 0, 0);
ellipse(205, 40, 100, 50);
fill(255, 255, 255);
ellipse(340, 40, 100, 50);
//bottom ellipses
fill(0, 0, 0);
ellipse(65, 360, 100, 50);
fill(255, 255, 255);
ellipse(205, 360, 100, 50);
fill(0, 0, 0);
ellipse(340, 360, 100, 50);
//black triangle
fill(0, 0, 0);
triangle(120, 260, 300, 260, 210, 135);
//small turquoise circles
fill(7, 239, 245);
ellipse(85, 170, random(20), random(20));
ellipse(330, 170, random(20), random(20));
ellipse(100, 300, random(20), random(20));
ellipse(300, 300, random(20), random(20));

ellipse(100, 100, random(10), random(10));  
ellipse(30, 230, random(10), random(10));  
ellipse(200, 280, random(10), random(10));   
ellipse(360, 250, random(10), random(10));  
ellipse(250, 100, random(10), random(10)); 
  //white square
fill(255, 255, 255);
rect(170, 190, 80, 70);
fill( 255, 0, 0);
ellipse(210, 226, 50, 50);
//red quads
quad(88, 150, 106, 150, 109, 135, 80, 130);
quad(370, 150, 400, 200, 349, 220, 360, 96)
quad(38, 280, 86, 290, 69, 263, 30, 276);
}
