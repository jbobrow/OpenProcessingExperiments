
int counter=0;
PImage myImagea;
PImage myImageb;



void setup() {
  size(800,800);
  background(255);
  myImagea = loadImage ("dog.png"); //loading image of dog
  myImageb = loadImage ("cat.png"); //loading image of dog
  strokeWeight(5);
  strokeCap(PROJECT);
  line(300,40,300,725);
  line(550,40,550,725);
  line (40,260,775,260);
  line (40,510,775,510);
}

void draw() {
  
println(counter);

}

void mousePressed() {
  counter++;
   if ((counter % 2) == 1) {
   imageMode(CENTER);
      image(myImagea,mouseX,mouseY);
   }else {
    image(myImageb,mouseX,mouseY);
  }
  
  if (counter == 10) {
     println("DONE");
      background(255);
      strokeWeight(5);
      strokeCap(PROJECT);
      line(300,40,300,725);
      line(550,40,550,725);
      line (40,260,775,260);
      line (40,510,775,510);
      counter=0;
  }
}



