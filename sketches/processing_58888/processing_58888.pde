
PImage face;
PImage bees;
PImage legs; 
int [] array1 = new int [height*width];
int increment = 2; 

void setup() {
  size(500, 717); 
  face = loadImage("eroticphoto.jpg"); 
  bees = loadImage("beeswarm.jpg"); 
  legs = loadImage("stocks.jpg"); 
  face.mask(bees); 
  image(face, 0, 0); 
  image(face, 0, 0); 
  blend(bees, 0, 0, 500, 717, 0, 0, 500, 717, LIGHTEST); 
  blend(face, 0, 0, 500, 717, 0, 0, 500, 717, ADD);
  blend(legs, 0, 0, 500, 717, 0, 0, 500, 717, BURN);
  blend(bees, 0, 0, 500, 717, 0, 0, 500, 717, ADD);
  blend(legs, 40, 30, 500, 717, 0, 0, 500, 717, BURN);
  blend(face, 0, 0, 500, 717, 0, 0, 500, 717, ADD);  
  loadPixels();
  int from = int(color(255, 0, 0));
  int to = int(color(200, 40, 40));
  int a = int(color(0, 0, 102));
  int b = int(color(0, 179, 255));
  color lerper  = lerpColor(from, to, .1);
  color bluShift =  lerpColor(a, b, .1);
  for(int i=0; i<pixels.length; i++){
    if (pixels[i]== color(lerper)){
      pixels[i] = color(bluShift);
    } 
  }
  updatePixels(); 
}

