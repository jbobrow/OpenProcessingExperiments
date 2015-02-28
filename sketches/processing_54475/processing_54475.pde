
size (750, 750);
background(255); 

smooth();
fill(0);
//robot head
ellipse(350, 250, 250, 250);  

fill(0);
//robot body
rect(225, 250, 250, 250);

fill(255);
//clock face
noStroke();
ellipse(350, 250, 200, 200);

fill(170);
//long arm
noStroke();
quad(290, 80, 300, 40, 350, 240, 340, 260);

fill(170);
//short arm
noStroke();
quad(355, 245, 490, 225, 510, 270, 345, 265);

fill(80);
// front panel
noStroke();
rect(200, 380, 300, 90);

fill(90);
// front panel groove 1
noStroke();
rect(220, 397, 260, 5);

fill(90);
// front panel groove 2
noStroke();
rect(220, 422, 260, 5);

fill(90);
// front panel groove 3
noStroke();
rect(220, 447, 260, 5);

fill(240);
// bubbles
noStroke();
ellipse(350, 560, 90, 90);
ellipse(265, 550, 45, 45);
ellipse(435, 550, 45, 45);


