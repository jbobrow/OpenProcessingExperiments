
void setup(){
size(250,250);
background(255);
smooth();
createFont("URWEgyptienneT-BoldNarr-48.vlw",10);
frameRate(100);

}

void draw(){
createFont("URWEgyptienneT-BoldNarr-48.vlw",10);
stroke(0);

fill(#7DEA53,80);
text("L5G",mouseY, mouseX);
fill(#246C08,40);
text("3T7", mouseX, mouseY);
fill(255);
noStroke();
ellipse(random(height),random(width),10,10);
}           
