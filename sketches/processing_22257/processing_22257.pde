
float angle = 0.0;


void setup() {
  size(900,650);
  smooth();
}

void draw() {
  translate(mouseX,mouseY);
  rotate(90);

 
 fill(92,161,216,0.9999999999999999999999999999);
  ellipse(random(X),random(Y),random(120),random(120));
  
  fill(250,250,177,0.999999999999999);
  ellipse(random(X),random(Y),random(100),random(100));

fill(250,250,177,0.9999999999999);
ellipse(random(X),random(Y),random(150),random(150));

fill(77,185,165,0.99999999999999999);
ellipse(random(X),random(Y),random(120),random(120));

fill(252,173,54,29);
ellipse(85,100,random(200),random(200));

fill(255,255,108,2);
ellipse(50,75,random(400),random(400));

{
fill(108,277,255,35);
ellipse(random(X),random(Y),random(350),random(250));
}

  angle += 0.1;
}

                
                                
