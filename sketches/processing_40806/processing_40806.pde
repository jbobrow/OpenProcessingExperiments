
int larghezza=50;
int altezza=50;

int posizioneX=0;
int posizioneX1=400;

void setup() {
  size(400, 400);
  background(200);
  smooth();
}

void draw() {
  fill(200, 30);
  rect(0, 0, width, height);

  ellipse(width/2, height/2, larghezza, altezza);
}
  void mouseMoved(){
    larghezza = larghezza+3;
    altezza = altezza+3;
    ellipse(width/2, height/2, larghezza, altezza);
    if (larghezza > 700 && altezza > 700 || posizioneX==width) {
      larghezza=50;
      altezza=50;
     posizioneX=0;
    posizioneX1=400; 
    }
    else{  
      ellipse(width/2, height/2, larghezza-50, altezza-50);
      ellipse(width/2, height/2, larghezza-100, altezza-100);
      ellipse(width/2, height/2, larghezza-150, altezza-150);
      ellipse(width/2, height/2, larghezza-200, altezza-200);
      line(width/2, height/2, mouseX, mouseY);
      
      posizioneX = posizioneX + 5;
      posizioneX1 = posizioneX1 -5;
      ellipse(posizioneX, 50, 50, 50);
      ellipse(posizioneX1, height-50, 50, 50);
    }
  }
