
void setup(){
size (250, 250);
background (#ffbca9);
smooth ();
 
 
//type
PFont font;
font = loadFont ("CenturyGothic-48.vlw");
textFont (font, 160);
}



void draw(){
//top 
fill(120, 60);
background(#ffbca9);
text("2A4 L8E 2A", random(-10), 70);

fill(#947f79,50);
strokeWeight(4);
noStroke();
ellipse(125,125,160,160);
ellipse(125,125,100,100);

//bottom
fill( #C1272D, 30);
text("L8E 2A4 L8E 2A4", random(-5), 230);


}


