
void setup(){
size(500,500);
smooth();
background(255);
}

void draw(){
if(mousePressed) {
float abstand= dist(pmouseX,pmouseY, mouseX,mouseY);
fill(abstand*4);
float dicke = 50-abstand/4;

if (dicke < 1) {
dicke = 1;
}
if (keyPressed) {
    if (key == 'q' || key =='Q') {
      strokeWeight(dicke);
ellipse(mouseX,mouseY,abstand,abstand);
    }
}
strokeWeight(dicke);
rect(mouseX,mouseY,abstand,abstand);

}
}

void mousePressed(){
colorMode(HSB,100);
stroke(random(1,100), random(100,200), random(200,300)); 

}

