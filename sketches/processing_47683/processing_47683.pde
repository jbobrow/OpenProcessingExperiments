

PImage bild;

int gap = 10;
float gap2;

void setup() {
  size(640,480);
  bild = loadImage("Nelly_side.jpg");
  smooth();
  
}

int cs = 7;



void draw() {
  background(0);
  noStroke();
  
 // image(bild,0,0);

for (int i = 0; i < width/gap; i++) {
  for (int j = 0; j < height/gap; j++) {
  
float val = brightness(bild.get(int(gap*i),int(gap*j)))/2445;
    
   fill (bild.get(int(gap*i),int(gap*j)));
  rect (gap*i,gap*j,cs,cs);
    
if (keyPressed) {
  
  if (key=='1') cs = 2;
  if (key=='2') cs = 8;
  if (key=='3') ellipse (gap*i,gap*j,mouseX*val,mouseY*val);
  if (key=='4') rect (gap*i,gap*j,mouseX*val,mouseX*val);

}

if (mousePressed == true) {

fill (bild.get(int(gap*4),int(gap*20)));
ellipse (gap*i,gap*j,cs,cs);

    }
}
}
}



