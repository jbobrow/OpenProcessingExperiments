
float posX;
float counter;
float waveSize;


void setup () {
  size(600, 600);
  background(255);

  counter = 0;
  waveSize = 150;
  posX = width/2;
}

void draw () {
  counter += 0.05;
  waveSize = 300;

  background(255); 


  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50; 
    float r = map(i, 0, width, 100, 255);
    float g = map(i, 0, height, 50, 255);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill(c); 
    ellipse (posX+mySin, i, 10, 10);
  }

  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50; 
    float r = map(i, 0, width, 100, 0);
    float g = map(i, 0, height, 50, 50);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill (c); 
    ellipse (posX-50+mySin, i, 10, 10);
  }

  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50;  
    float r = map(i, 0, width, 100, 255);
    float g = map(i, 0, height, 50, 255);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill(c); 
    ellipse (posX+50+mySin, i, 10, 10);
  }

  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50; 
    float r = map(i, 0, width, 100, 0);
    float g = map(i, 0, height, 50, 50);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill (c);  
    ellipse (posX-100+mySin, i, 10, 10);
  }

  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50;  
    float r = map(i, 0, width, 100, 255);
    float g = map(i, 0, height, 50, 255);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill(c); 
    ellipse (posX+100+mySin, i, 10, 10);
  }
  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50; 
    float r = map(i, 0, width, 100, 0);
    float g = map(i, 0, height, 50, 50);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill (c);  
    ellipse (posX-150+mySin, i, 10, 10);
  }

  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50; 
    float r = map(i, 0, width, 100, 255);
    float g = map(i, 0, height, 50, 255);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill(c);  
    ellipse (posX+150+mySin, i, 10, 10);
  }

  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50;  
    float r = map(i, 0, width, 100, 0);
    float g = map(i, 0, height, 50, 50);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill (c); 
    ellipse (posX-200+mySin, i, 10, 10);
  }

  for (int i = 0; i < height; i+=80) {  
    float mySin = sin(mouseX*0.02+i)*50;
    float r = map(i, 0, width, 100, 255);
    float g = map(i, 0, height, 50, 255);
    float b = map( mouseX, 0, mouseY, 0, 100);
    color c = color(r, g, b);
    fill(c);   
    ellipse (posX+200+mySin, i, 10, 10);
  }

  for (int i = 0; i < width; i += 10) {
    rectMode(CENTER);
    float sz = waveSize + (sin(counter * 0.8 +i*8) * waveSize);
    float b = map(sz, 0, waveSize * 2, 0, 255);
    fill(b);
    rect(i, height/2, 10, sz);
  }
}



