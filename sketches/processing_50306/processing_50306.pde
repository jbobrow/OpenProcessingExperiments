
// ID2 Week 2 Assignment --asymmetrical face--

size(500, 500);
background(255);
smooth();
stroke(0);


// eyebrows
strokeWeight(3);
line(180, 5, 180, 55);
line(320, 5, 320, 55);
line(50, 55, 180, 55);
line(320, 55, 450, 55);

// eyebrow ellipse
fill(0);
ellipse(50, 55, 10, 10);
ellipse(450, 55, 10, 10);

// eyes
fill(100);
noStroke();
triangle(135,75, 165,75, 150,100);
triangle(335,75, 365,75, 350,100);

// eyes
stroke(0);
strokeWeight(1);
line(50,75, 105,75);
line(105,75, 150,130);
line(150,130, 195,75);
line(195,75, 230,75);
line(270,75, 305,75);
line(305,75, 350,130);
line(350,130, 395,75);
line(395,75, 395,-10);
line(350,75, 350,25);

// nose
line(230,75, 230,260);
line(270,75, 270,260);

// nostrils
fill(100);
noStroke();
triangle(220,255, 240,255, 230,269);
triangle(260,255, 280,255, 270,269);

// tears 
fill(0);
stroke(0);
strokeWeight(1);
line(150, 130, 150, 312);
line(350, 130, 350, 162);
ellipse(350,162, 10, 10);
ellipse(150,312, 10, 10);

// mouth
fill(0);
line(250, 273, 250,488);
quad(230,360, 270,360, 270,375, 230, 375);
quad(230,380, 270,380, 270,400, 230,400);
line(195,380, 305,380);

// outline
line(50,75, 50,160);
line(50,160, 195,160);
line(195,160, 195, 255);
line(195,255, 105,255);
line(105,255, 75, 355);
line(75,355, 250,488);
line(250,488, 420,355);
line(420,355, 395,255);
line(395,255, 305,255);
line(305,255, 305,160);
line(305,160, 420,160);
line(420,160, 420,55);





