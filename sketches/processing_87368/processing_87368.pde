


 
PImage img;         // adidas
PImage img2;       // under armour
PImage img3;      // michael kors
PImage img4;     // nike
PImage img5;    // north face
PImage img6;   // prada
PImage img7;  // puma
PImage img8; // louis vuitton

 
void setup(){
  background(255);
  size(800,600); 
  img = loadImage("adidas.jpg");          // adidas
  img2 = loadImage("armour.jpg");        // under armour
  img3 = loadImage("michael.jpg");      // michael kors
  img4 = loadImage("nike.jpg");        // nike
  img5 = loadImage("northface.jpg");  // north face
  img6 = loadImage("prada.jpg");     // prada
  img7 = loadImage("puma.jpg");     // puma
  img8 = loadImage("vuitton.jpg"); // louis vuitton
}

void draw(){
    stroke(255,100);
  image(img,50*int(random(50)),50*int(random(50))); 
  image(img2,50*int(random(50)),50*int(random(50)));
  image(img3,50*int(random(50)),50*int(random(50)));
  image(img4,50*int(random(50)),50*int(random(50)));
  image(img5,50*int(random(50)),50*int(random(50)));
  image(img6,50*int(random(50)),50*int(random(50)));
  image(img7,50*int(random(50)),50*int(random(50)));
  image(img8,50*int(random(50)),50*int(random(50)));
 
  if (mousePressed == true) { // try to erase away all your desires
}
  line(mouseX, mouseY, pmouseX, pmouseY);
  strokeWeight(200);



}





