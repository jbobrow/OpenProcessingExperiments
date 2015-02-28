
// Kandinsky Bild

size(1000, 1000);{}
smooth();

// Ring

fill(0);{
ellipse(500,500,900,900);
}

fill(224,223,208);{
ellipse(500,500,820,820);
}

fill(0,133,219,90);
quad(150, 0, 270, 0, 1500, 900, 1000, 900);

fill(160,137,3,90);
quad(1050, 0, 960, 0, 0, 900, 0, 1250);

// Kreise

fill(58,134,100,60);{
ellipse(450,550,270,270);
}

fill(160,11,0,90);{
ellipse(430,490,100,100);
}

fill(3,111,160,90);{
ellipse(360,420,100,100);
}

fill(160,3,116,90);{
ellipse(360,290,220,220);
}

fill(160,3,116,90);{
ellipse(480,160,20,20);
}

fill(160,3,3);{
ellipse(490,600,20,20);
}

fill(160,3,3);{
ellipse(450,700,20,20);
}

fill(160,3,3,90);{
ellipse(360,680,90,90);
}

fill(3,130,160,90);{
ellipse(280,600,80,80);
}

fill(250,0,0,90);{
ellipse(200,450,60,60);
}

fill(3,24,155,90);{
ellipse(700,430,60,60);
}

fill(0);{
ellipse(610,380,30,30);
}

fill(160,142,3,90);{
ellipse(550,730,24,24);
}

fill(0);{
ellipse(410,730,10,10);
}

fill(0);{
ellipse(430,490,30,30);
}

fill(160,11,0,90);{
ellipse(470,350,200,200);
}


fill(219,194,0,90);{
ellipse(370,580,220,220);
}

fill(231,232,0,60);{
ellipse(600,600,150,150);
}

fill(0);{
ellipse(630,650,50,50);
}

fill(170,29,161,80);{
ellipse(750,700,50,50);
}

fill(29,170,169,60);{
ellipse(600,430,230,230);
}

fill(170,29,161,80);{
ellipse(510,780,50,50);
}

fill(222,58,83,95);{
ellipse(200,700,50,50);
}

fill(0,24,139,95);{
ellipse(150,550,20,20);
}

// Line

strokeWeight(3);
line(200, 300, 400, 400);

line(700, 200, 350, 800);

line(200, 600, 550, 435);

line(600, 800, 660, 435);

line(425, 876, 543, 231);

line(566, 243, 843, 456);

// Overlay

PImage img;
img = loadImage("textur.jpg");
image(img, 10000, 10000);
tint(255, 100);  // Apply transparency without changing color
image(img, 0, 0);


