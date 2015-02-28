
int size = 50;
float n = 0;
int mx = 0, my=0;
void setup()  {
  size(600,600);
  background(#ced404);
  rectMode(CENTER);
  noFill();
  stroke(250);
  
}

void draw()  {
  translate(size/2, size/2);
  stroke(#000000);
  
//  if(mousePressed && mouseButton == LEFT) 
    strokeWeight(size*mouseX/width);
  for(int i = 0; i < height; i+=size)
  {
    for(int j = 0; j < width; j+=size){
     // if(mousePressed && mouseButton == LEFT)
        my = mouseY;
      fill(my*255/height, noise(j+n)*255, noise(j+n)*255);
      n += 0.00005;
      rect(j,i,size,size);
    }
  }
}
