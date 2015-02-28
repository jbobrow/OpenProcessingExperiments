
void setup() {
size(400, 400);
background(255);
}

void draw() {
fill(#802A2A); //body
ellipse(200, 500, 400, 400);

fill(#8BA870); // bow tie
triangle(190, 380, 150, 365, 150, 415);
triangle(210, 380, 250, 365, 250, 415);
ellipse(200, 380, 40, 40);

fill(#802A2A); //ears
ellipse(110, 160, 60, 60);
ellipse(290, 160, 60, 60);

fill(#ff69b4); // inner ears
ellipse(110, 160, 45, 45);
ellipse(290, 160, 45, 45);

fill(#802A2A); //head
ellipse(200, 250, 250, 250);
ellipse(200, 310, 110, 110); // snout
curve(175, 320, 180, 330, 220, 330, 225, 320); //smile

fill(255); //eyes
ellipse(150, 220, 40, 80);
ellipse(250, 220, 40, 80);

fill(0); //inner eye
ellipse((144 + mouseX/32), (210 + mouseY/12), 20, 20);
ellipse((244 + mouseX/32), (210 + mouseY/12), 20, 20);
triangle(175, 275, 225, 275, 200, 300); //nose
textSize(96);
text("bear", 50, 80); 
}
