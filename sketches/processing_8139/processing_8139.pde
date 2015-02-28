
//Un poisson nommé Tantale

void setup(){

background(255);
size(500,500);
smooth();

//gère la vitesse de lecture de la boucle
frameRate(10);
}

void draw(){

strokeWeight(1);  
stroke(0);
line(150, 150, random(150, 250), 350);
line(250, 150, random(150, 250), 350);

strokeWeight(0.1);
line(random(150, 160), 350, random(150, 160), 360);
line(random(240, 250), 350, random(240, 250), 360);

line(random(180, 190), 350, random(180, 190), 355);
line(random(210, 220), 350, random (210, 220), 355);

strokeWeight(0.1);
stroke(255);
line(random(175, 180), 250, random(175, 180), 260);
line(random(225, 230), 250, random(225, 230), 260);
 
}

