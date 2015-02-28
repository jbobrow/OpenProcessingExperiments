
PImage bild;

float gap = 10.0;
 
void setup (){
  size (480,480);
  bild = loadImage("CIMG9487.JPG");
  smooth();
}
 
 
 
void draw (){
   
  background(0);
  strokeWeight(1);
  stroke(255,10,200);
  
  gap = 10+mouseX/10;
   
  for (int i = 0; i< width/gap; i++){
    for (int j = 0; j< width/gap; j++){
    fill (bild.get(int(gap*i),int(gap*j))); 
    ellipse (gap*i, gap*j,gap,gap);
   
  }
  }
}

