
void setup(){
size(417, 475);
noStroke();
PImage b;
b = loadImage("nederland.jpg");
background(b);
frameRate(1);
setLocations();
}


int r = 0;
int g = 0;
int b = 0;


void draw(){

stroke(255,0,0);
//fill(r,g,b);

//Noord-Holland - Amsterdam
text("Amsterdam!",140,180);  

//Zuid-Holland - Den Haag
text("Den Haag!",80,235);  

//Zeeland - Middelburg
text("Middelburg!",5,330);  

//Noord-Brabant - Den Bosh
text("Den Bosh!",190,310);  

//Limburg - Maastricht
text("Maastricht!",230,450);  

//Utrecht - Utrecht
text("Utrecht!",180,230);  

//Flevoland - Lelystand
text("lelystad",215,165);  

//Overijssel - Zwolle
text("Zwolle!",290,165);  

//Gelderland - Arnhem
text("Arnhem!",260,260);  

//Drenthe - Assem
text("Assen!",335,80);  

//Groningen - Groningen
text("Groningen!",325,40);  

//Friesland - Leeuwarden
text("Leeuwarden!",230,40);  

setColour();

}

void setColour(){
r = int(random(255));
g = int(random(255));
b = int(random(255));
fill(r,g,b);

}

void setLocations(){

stroke(0);
fill(255);

//Noord-Holland - Amsterdam
ellipse(175,190,10,10);

//Zuid-Holland - Den Haag
ellipse(110,245,10,10);

//Zeeland - Middelburg
ellipse(30,340,10,10);

//Noord-Brabant - Den Bosh
ellipse(220,320,10,10);

//Limburg - Maastricht
ellipse(260,460,10,10);

//Utrecht - Utrecht 
ellipse(200,240,10,10);

//Flevoland - Lelystand
ellipse(235,175,10,10);

//Overijssel - Zwolle
ellipse(310,175,10,10);

//Gelderland - Arnhem
ellipse(280,270,10,10);

//Drenthe - Assem
ellipse(355,90,10,10);

//Groningen - Groningen
ellipse(355,50,10,10);

//Friesland - Leeuwarden
ellipse(260,50,10,10);
}





