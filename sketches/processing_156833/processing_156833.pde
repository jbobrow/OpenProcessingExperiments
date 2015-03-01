


void setup () {
  size(600, 600);
} 


void draw () { 
  background(0);

  for (int i=0; i < width/2; i+=20) { 
    for (int j = 0; j < height/2; j+=20) {
      float r = map(i, 0, width, 0, 100);
      float g = map(j, 0, height, 0, 255);
      float b = map( mouseX, 0, width, 0, 255); 
      color c = color(r, g, b);
      stroke(c);
      line(i, j, mouseX+sin(radians(frameCount))*100, mouseY+cos(radians(frameCount))*100);
    }
  }

  for ( int i=300; i < 600; i+=30) { 
    for (int j=0; j < 300; j+=30) { 
      float r = map(i, 0, width, 0, 250); 
      float g = map (i, 0, height, 0, 150);
      float b = map(mouseX, 0, width, 0, 250);
      color c = color (r, g, b);
      stroke(c);
      line (i, j, mouseX+cos(radians(frameCount))*100, mouseY);//+sin(radians(frameCount))*100);
    }
  }

  for (int i=0; i < 300; i+=20) {
    for (int j=300; j < 600; j+=30) {
      float r = map(i, 0, width, 100, 255); 
      float g = map(i, 0, height, 50, 255);
      float b = map( mouseX, 0, mouseY, 0, 100);
      color c = color(r, g, b);
      stroke(c); 
      line(i, j, mouseX, mouseY+sin(radians(frameCount))*100);
    }
  }
  for (int i=300; i < 600; i+=20) {
    for (int j=300; j < 600; j+=30) {
      float r = map(i, 0, width, 0, 150); 
      float g = map(i, 0, height, 0, 50);
      float b = map( mouseX, 0, mouseY, 0, 255);
      color c = color(r, g, b);
      stroke(c); 
     line(i, j, mouseX+cos(radians(frameCount))*100, mouseY+sin(radians(frameCount))*100);
    }
  }


}





