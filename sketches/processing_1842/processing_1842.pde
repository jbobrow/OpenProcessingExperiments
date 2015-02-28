
size(400,400);

int ancho=300;
int alto=350;

background(#72EAE1);
rectMode(CENTER);
translate(width/2, height/2);
fill(#727CEA);
strokeWeight(6);

rect(0, 0, ancho, alto);
ellipse(0, 0, 55, 55);


strokeWeight(6);
line(-150, 0, 150, 0);

strokeWeight(6);
rect(0, -150, 55, 45);

strokeWeight(6);
rect(0, 150, 55, 45);


