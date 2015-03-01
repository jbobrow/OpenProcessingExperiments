
// Push the button
// 12.12.2014

/*Aufgabenstellung
Vervollstaendige das Programm so, dass der Button orange wird, sobald sich die Maus ueber ihm befindet. Momentan wird der Button noch orange, wenn sich die Maus irgendwo ueber oder unter ihm befindet. Ansonsten soll er gruen sein. */

void setup(){
size(400,400);
background(0,155,176);
}

void draw(){
fill(0,255,0);
rect(100,100,200,200);
if(mouseX>=100&&mouseX<=300)
if(mouseY>=100&&mouseY<=300){
    fill(255,100,0);
    rect(100,100,200,200);
    }
}
