
float dm;
void setup() {
  size(700,700);
  smooth();
  colorMode(HSB, 100);
}

void draw() {
  if(mousePressed == true) {
  dm =  dist(pmouseX, pmouseY, mouseX, mouseY);
  if (dm > 20) {
  dm = 20;
  }
  strokeWeight(20-dm);
  line(pmouseX, pmouseY, mouseX, mouseY);
  stroke(random(255),100,100);
}
}

void keyPressed() {
  if(key == 's'){
    println ("Gespeichert");
    saveFrame("screenshot-####.tif");
  }
   if(key == 'b'){
    beginRecord(PDF, "abc.pdf");
    colorMode(HSB, 100);
    background(255);   
}
  if(key == 'e'){
   endRecord();
}
}

