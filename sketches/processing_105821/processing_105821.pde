
void setup() {
  size(800, 800);
  colorMode(HSB);

  fill(0, 0, 50);
}

void draw() {
  background(255);
  for (float i = 0; i <= 6; i++) {
  
    float coordX = i*100+100;
    // float coordX = i*100+100;
    float hue;
    PVector v1;
    PVector v2;
    float startY = 100;
    float radius = 50;
    boolean hover = false;

    v1 = new PVector(coordX, startY);
    v2 = new PVector(mouseX, mouseY);

//    if (v1.dist(v2)<=radius/2) {
//      hue = ((float)i/6)*255;
//      fill(hue, 255, 200);
//    } 
//    else {
//      fill(255);
//    }
//
//    ellipse(coordX, startY, radius, radius);


      //ellipse(startY+g, coordX+i, radius, radius);
      
    
    for (float g = 0; g <= 600; g +=100) {
      
      PVector v3 = new PVector(startY+g, coordX);
      
      if (v3.dist(v2)<=radius/2) {
        hue = ((float)g/600)*255;
        fill(hue, 255, 200);
        radius += 10;
        hover = true;
      
      } 
      else {
        fill(255);
        hover = false;
      }
      
      ellipse(startY+g, coordX+i, radius, radius);
      if (hover==true){
        radius -=10;}

    }
  }
}
