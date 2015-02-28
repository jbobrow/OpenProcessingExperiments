

/*alexandra merski amerski@andrew.cmu.edu 
copyright alexandra merski*/


size(400, 400);
background(156,227,205);

noFill();
stroke(193,245,229);
beginShape(TRIANGLE_FAN);
vertex(75, 50);
vertex(57.5, 15); 
vertex(92, 79); 
vertex(57.5, 100); 
vertex(22, 90); 
vertex(57.5, 15); 
endShape();

noFill();
beginShape(TRIANGLE_FAN);
vertex(300, 370);
vertex(280, 300);
stroke(213, 240, 231);
vertex(150, 330); 
stroke(193,245,229);
vertex(300, 220); 
vertex(260, 300); 
vertex(310, 250); 
endShape();

beginShape(TRIANGLE_STRIP);
vertex(300, 260);
vertex(340, 220);
vertex(350, 300);
vertex(360, 320);
vertex(370, 375);
vertex(380, 320);
vertex(365, 375);
endShape();

beginShape();
vertex(370, 20);
vertex(340, 20);
vertex(340, 40);
vertex(390, 40);
vertex(300, 60);
vertex(320, 60);
endShape(CLOSE);

beginShape();
vertex(330, 55);
vertex(300, 80);
vertex(300, 90);
stroke(213, 240, 231);
vertex(360, 70);
vertex(270, 30);
vertex(2900, 70);
endShape(CLOSE);

smooth( );
noStroke( );
fill(255,255,255);
triangle(80, 400, 0, 220, 150, 350);
fill(156,227,205);
triangle(90, 395, 10, 230, 140, 360);

fill(255,255,255);
triangle(9, 330, 80, 290, 35, 330);
triangle(120, 260, 130, 120, 135, 270);

fill(213, 240, 231);
triangle(130, 120, 200, 180, 170, 170);

fill(255,255,255);
triangle(200, 180, 225, 90, 210, 85);

fill(213, 240, 231);
triangle(225, 90, 250, 150, 245, 210);








