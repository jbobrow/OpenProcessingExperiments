
//Angeline Chen, angelinc, Angeline Chen August 2013, Pittsburgh, PA//

size(400, 400);

background(183, 229, 32);

//A1
fill(49, 46, 62);
noStroke();
quad(30, 80, 35, 360, 215, 330, 110, 85);

fill(183, 229, 32);
noStroke();
quad(50, 100, 73, 280, 110, 200, 80, 105);

fill(183, 229, 32);
noStroke();
triangle(80, 355, 170, 360, 127, 240);

//C
fill(49, 46, 62);
noStroke();
quad(150, 80, 350, 30, 350, 330, 230, 330);

fill(183, 229, 32);
noStroke();
quad(370, 80, 190, 100, 270, 300, 380, 240);

//flatQuad
noFill();
stroke(255);
strokeWeight(2);
quad(25, 300, 70, 50, 290, 120, 370, 370);

//longQuad
noFill();
stroke(255);
strokeWeight(2);
quad(15, 90, 20, 380, 340, 320, 380, 30);

line(130, 70, 227, 340);

saveFram("hw1.jpg");


