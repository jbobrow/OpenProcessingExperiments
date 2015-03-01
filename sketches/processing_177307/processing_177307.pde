
// Ein Pinguin
// Vorlage von Lukas Grapentin
// 12.12.2014

/*Aufgabenstellung
Schreibe ein Programm, bei dem der Pinguin auf einen Mausklick reagiert, beispielsweise die Flügel hebt oder einen grünen Bauch bekommt.*/
void setup(){
size(500,500);
}
void draw(){
background(150,0,40);


//Körper
fill(0,0,0);
noStroke();
ellipse(250,250,200,250);

//Bauch und Augen
fill(250,250,250);
ellipse(250,300,150,160);
ellipse(240,180,40,60);
ellipse(260,180,40,60);
fill(0,0,0);
ellipse(240,180,10,20);
ellipse(260,180,10,20);
fill(250,230,0);
triangle(240,200,260,200,250,230);
ellipse(210,375,60,25);
ellipse(290,375,60,25);

//Flügel
fill(0,0,0);
triangle(340,200,370,270,340,250);
triangle(160,200,120,270,160,250);
}
