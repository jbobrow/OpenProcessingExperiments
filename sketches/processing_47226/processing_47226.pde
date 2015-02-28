
void setup(){
  size (640,360);
  smooth();
  noStroke();
}

void draw(){
  color rouge = color(253,64,43);
  color gris = color(233,222,200);
  background(gris);
  
//Forme Rouge
  fill(rouge);
  beginShape();
    vertex(0,0);
    vertex(0,190);
    vertex(640,70);
    vertex(640,0);
    endShape(CLOSE);
//Rond
  fill(0);
  ellipse(mouseX,mouseY,680,680);
//Cotes pave
  fill(gris);
  beginShape();
    vertex(340,125);
    vertex(385,150);
    vertex(315,325);
    vertex(415,300);
    vertex(490,105);
    vertex(440,80);
    endShape(CLOSE);
//Ligne
  stroke(0);
  strokeWeight(1);
  line(385,150,490,105);
//2d pave gris
  fill(gris);
  beginShape();
    vertex(530,45);
    vertex(535,83);
    vertex(width,62);
    vertex(width,22);
    endShape(CLOSE);
//2d pave rouge
  fill (rouge);
  beginShape();
    vertex(535,84);
    vertex(545,95);
    vertex(width,75);
    vertex(width,63);
    endShape(CLOSE);
  noStroke();
//Cote pave rouge
  fill (rouge);
  beginShape();
    vertex(340,125);
    vertex(250,340);
    vertex(315,325);
    vertex(385,150);
    endShape(CLOSE);
//Triangle
  fill(235,197,111);
  beginShape();
    vertex(165,360);
    vertex(535,270);
    vertex(555,360);
    endShape(CLOSE);
  fill(164,164,153);
  beginShape();
    vertex(555,360);
    vertex(width,height);
    vertex(width,340);
    endShape(CLOSE);


}

