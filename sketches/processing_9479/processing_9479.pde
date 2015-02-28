
void setup () {

size(400,400);

background(0);
frameRate (10);
 

}

void draw () {

smooth();
stroke(255);
strokeWeight(3);
fill(180);

float move1 = random(-5,5);
float move2 = random(-5,5);
float moveheadx = random(-5,5);
float moveheady = random(-5,5);

ellipse(20, 300+random(-5,5), 20, 20);
ellipse(40, 285+random(-5,5), 25, 25);
ellipse(80, 280+random(-5,5), 37, 37);
ellipse(110, 310+random(-5,5), 45, 45);
ellipse(130, 330+random(-5,5), 20, 20);
ellipse(155, 315+random(-5,5), 35, 35);
ellipse(185, 275+random(-5,5), 50, 50);
ellipse(210, 255+random(-5,5), 20, 20);
ellipse(240, 270+random(-5,5), 55, 55);
ellipse(270, 300+random(-5,5), 30, 30);
ellipse(300, 310+random(-5,5), 50, 50);
ellipse(335+move1, 290+move1, 20, 20);
ellipse(330+random(-5,5), 245, 60, 60);

ellipse(350+random(-5,5), 208, 20, 20);

ellipse(310+random(-5,5), 180, 75, 75);
ellipse(260+move2, 160-move2, 20, 20);
ellipse(225+moveheadx, 120+moveheady, 150, 75);

// eyes

ellipse(195, 80+random(-5,5), 30, 30);
ellipse(255, 80+random(-5,5), 30, 30);


noStroke();
fill(0);
ellipse(185+mouseX/20, 83+random(-5,5), 17, 17);
ellipse(245+mouseX/20, 83+random(-5,5), 17, 17);


// mouth

stroke(255);
fill(100);
beginShape();
  vertex(170+moveheadx, 120+moveheady);
  bezierVertex(180+moveheadx, 160+moveheady , 280+moveheadx, 160+moveheady, 290+moveheadx, 120+moveheady);
  vertex(290+moveheadx, 120+moveheady);
  bezierVertex(280+moveheadx, 110+moveheady , 180+moveheadx, 110+moveheady, 170+moveheadx, 120+moveheady);
endShape(CLOSE);
  
// teeth

noStroke();
fill(255);
triangle(200+moveheadx, 112+moveheady, 220+moveheadx, 112+moveheady, 210+moveheadx, 130+moveheady);
triangle(240+moveheadx, 112+moveheady, 260+moveheadx, 112+moveheady, 250+moveheadx, 130+moveheady);

filter( BLUR, random(1,5));


}

