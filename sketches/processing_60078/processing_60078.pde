
void setup(){
smooth();
size(1000,500);
noCursor();
}

void draw(){
  frameRate(10);
  
  //Definition einer Variable vom Typ "float" = Kommazahl
  float b=random(5,300);

//Farbe der Ellipsen ist abhängig von der Mausposition
if(mousePressed){
    fill(255, mouseX/3.92, mouseY/1.96);
    }

else{}

  stroke(255, mouseX/3.92, mouseY/1.96);
  ellipse(mouseX, mouseY, b,b);

//Verblassen des Bildes durch Überlagerung mit transparenter Box
  noStroke();
  fill(240, 50);
  rect(0, 0, width, height);

}

