
int blocksize;

void setup() {

size(505,305);
  blocksize = 10;
  noStroke();
}

void draw() {
  for(int y=0; y<height; y+=blocksize) {
    for(int x=0; x<width;x+=blocksize) {
      if (mousePressed){
        
        //fons rodones
        fill(random(255),random(255), random(255), 80);
        ellipse(x,y,blocksize,blocksize);
        
        //rectangle moviment permanent
        int specialX = mouseX - (mouseX % blocksize);
        int specialY = mouseY - (mouseY % blocksize);
        fill(#ffffff);
        rect(specialX, specialY, blocksize,blocksize);
        
      }else{
        //La gracieta, como no.
        if (keyPressed){
          background (255);
          text("LUIS", random(255), random(255), 90);
          text("MAQUINERO", random(255), random(255), 80);
          textAlign(LEFT);
          textSize(75);
        }
        
        //normal
        fill(random(115),random(0,64), random(223), 30);
        rect(x,y,blocksize,blocksize);
      }
    }
  }
}

