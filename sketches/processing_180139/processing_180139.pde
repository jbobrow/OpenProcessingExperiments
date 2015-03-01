
// Push the button
// 12.12.2014

/*Aufgabenstellung
Entwirf einen rechteckigen Button, der orange wird, sobald sich die Maus über ihm befindet. Ansonsten soll er grün sein. */


void setup(){
size(400,400);
background(0,155,176);
}

void draw(){
fill(188,230,0);
rect(100,100,200,200);


if(mousePosition == Recht){
fill(250,130,10);
rect(100,100,200,200);
}}
