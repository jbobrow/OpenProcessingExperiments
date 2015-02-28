
PImage img;

//True = positive trees 
//False = negative trees
boolean isTree= true;


void setup() {
  size(600,400);
  img = loadImage("trees1.jpg");


}

void draw() {
  background(255);
  loadPixels();
  img.loadPixels();
  
  
  
  for (int y = 0; y < height; y++) {
    for (int x = 0; x < width; x++) {
      int loc = x + y * width;
      if (random(5) < 4) {
        pixels[loc] = img.pixels[loc];
       
      }
    }
  }
  updatePixels();

}

void mousePressed(){

  if (isTree){
  
    //load negative trees
  img = loadImage("trees0.jpg");
  isTree = (!isTree);
  
 
  
} else{
  //load positive trees
   img = loadImage("trees1.jpg");
   isTree = (!isTree);



}
 
}

