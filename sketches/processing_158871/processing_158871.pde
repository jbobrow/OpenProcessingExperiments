
/* @pjs font="ariali.TTF", "BE05016T.TTF"; preload="parkingroul-1.jpg"; */

PImage parking;
PFont textreg;
PFont textbold;
parking = loadImage("parkingroul-1.jpg");
textreg = createFont("ariali.ttf",220);
textbold = createFont("BE05016T.TTF",220);
float rectw = 300;
float recth = 200;

size(850,950);
background(41,67,230);

image(parking,0,260);

fill(255,225,127);
rect(525,650,rectw,recth);

fill(104,79,72);
textFont(textreg,24);  //setting the type
textAlign(CENTER);
text("Round and Round \nAnd Round They Goes \nAnd Where They Stop \nNobody Knows",680,700);


fill(255);
textAlign(CENTER);
textFont(textbold,72);  //setting the type
text("Introducing \nParking Meter Roulette",width/2,100);
textFont(textreg,32);
textAlign(LEFT);
text("Finding a parking space \nduring a busy day in the \ndowntown area of a major \ncity is like a game of \nroulette. It may take \nalmost an hour to park.",450,300);
textAlign(CENTER);
textFont(textreg,22);
text("Fifteen minutes could save you 15% or more...",width/2,920);


