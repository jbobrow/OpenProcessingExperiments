

                

void setup () {
  size (600, 600);
}

void draw () {

  float vx= 10; 
  float vy = 12;
  float r=random (0, 255); 
  float g=random (0, 255);
  float b=random (0, 255);
  float trans =  map(mouseX, 0, width, 0, 255);

  int margin = 9; 
  smooth ();


  background(255); 
  noStroke(); 


  for (int i = margin; i < height-margin; i += vy) {
    if (vx > 0)
    {

      for (int j = margin; j < (width-margin)/6; j+= vy) {
        fill(255, 0, 0, 255-trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+(width-margin)/6; j < 2*(width-margin)/6; j+= vy) {
        fill(255, 125, 0, 255-trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+2*(width-margin)/6; j < 3*(width-margin)/6; j+= vy) {
        fill(255, 255, 0, 255-trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+3*(width-margin)/6; j < 4*(width-margin)/6; j+= vy) {
        fill(0, 147, 10, 255-trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+4*(width-margin)/6; j < 5*(width-margin)/6; j+= vy) {
        fill(0, 0, 255, 255-trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+5*(width-margin)/6; j < 6*(width-margin)/6; j+= vy) {
        fill(125, 2, 188, 255-trans);
        ellipse(j, i, vx, vx);
      }

// random color circles
      for (int j = margin; j < (width-margin)/6; j+= vy) {
        fill(random(0,255), random(0,255), random(0,255), trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+(width-margin)/6; j < 2*(width-margin)/6; j+= vy) {
        fill(random(0,255), random(0,255), random(0,255), trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+2*(width-margin)/6; j < 3*(width-margin)/6; j+= vy) {
        fill(random(0,255), random(0,255), random(0,255), trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+3*(width-margin)/6; j < 4*(width-margin)/6; j+= vy) {
        fill(random(0,255), random(0,255), random(0,255), trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+4*(width-margin)/6; j < 5*(width-margin)/6; j+= vy) {
        fill(random(0,255), random(0,255), random(0,255), trans);
        ellipse(j, i, vx, vx);
      }
      for (int j = margin+5*(width-margin)/6; j < 6*(width-margin)/6; j+= vy) {
        fill(random(0,255), random(0,255), random(0,255), trans);
        ellipse(j, i, vx, vx);
      }


      fill (255);
    } 
    else {
      fill (0, 0, 0);
    }
    vx = vx - 0.2;
  }
}

