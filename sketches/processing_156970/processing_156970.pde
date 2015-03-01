
float[] xpos = new float[70];
float[] ypos = new float[70];

String[] versions = { 
  "ver1", 
  "ver2", 
  "ver3", 
  "ver4"
};

void setup() {
  size(600, 600);   
  for ( int i = 0 ; i < xpos.length; i++ ) {
    xpos[i] = 0; 
    ypos[i] = 0;
  }
}

void draw() {
  background(0); 


  fill(255); 
  textSize(36); 
  for ( int i = 0; i < versions.length; i++ ) {
    text(versions[i], i*width/4+35, height/2);
  }

  //   for (int i = 0; i < width; i++ ) {
  //   float r = map(i, 0, width, 100, 255);
  //   float g = map(i, 0, width, 200, 150); 
  //   stroke(r,g,100); 
  //   line(i, 0, i, height);
  // } 


  xpos[xpos.length - 1] = mouseX;
  ypos[ypos.length - 1] = mouseY; 

  for ( int i = 0 ; i < xpos.length-1; i++ ) {
    xpos[i] = xpos[i+1];
    ypos[i] = ypos[i+1];
  } 
  noCursor();
  noStroke(); 
  for (int i = 0 ; i < xpos.length - 1; i++ ) {

    if ( mouseX > 0 && mouseX < width/4 ) {
      float b = map(i, 0, xpos.length, 0, 255);
      float sz = map(i, 0, xpos.length, 0, 50); 
      //fill(b); 
      //ellipse(xpos[i], ypos[i], sz, sz); 
      stroke(b);  
      strokeWeight(sz); 
      line(xpos[i], ypos[i], xpos[i+1], ypos[i+1]);
    } 
    else if (mouseX > width/4 && mouseX < width/2) {
      float r = map(i, 0, xpos.length, 0, 255);
      float g = map(i, 0, xpos.length, 100, 200); 
      float b = map(i, 0, xpos.length, 230, 10);
      fill(r, g, b); 
      ellipse(xpos[i], ypos[i], 30, 30);
    } 
    else if (mouseX > width/2 && mouseX < width - width/4) {
      float b = map(i, 0, xpos.length, 0, 255);
      float r = map(i, 0, xpos.length, 100, 200); 
      float g = map(i, 0, xpos.length, 230, 10);
      fill(r, g, b); 
      for (int j = 0; j < 10; j++ ) {
        ellipse(xpos[i]+random(-j, j), ypos[i]+random(-j, j), 1, 50);
      }
    } 
    else if (mouseX > width-width/4 && mouseX < width) {
      float r = map(i, 0, xpos.length, 0, 255);
      float b = map(i, 0, xpos.length, 100, 200); 
      float g = map(i, 0, xpos.length, 230, 10);
      stroke(r, g, b); 
      strokeWeight(i/10); 
      pushMatrix(); 

      float rotation = i;
      
      translate(xpos[i], ypos[i]);
      rotate(radians(rotation));  
      line(-100, 0, 100, 0);
      //      ellipse(xpos[i], ypos[i], 30, 30);  

      popMatrix();
    } 

    //ellipse(mouseX, mouseY, 25, 25);
  } 
}


