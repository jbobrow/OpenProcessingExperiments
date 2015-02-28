
float offset;

void setup() {
  size(400,400);
}

void draw() {
 background(255); 
 int resolution = 64;
 float radius = 100;
 
 // Animations
  offset++;
 // resolution=mouseX;
 // radius=mouseY*0.5;
 
 float circleX = width/2;
 float circleY = height/2;
 
  
  // Shape 1 // Waveshape (Flowershape)
  fill(0);
  stroke(0);
  
  beginShape();
    for ( int i=0; i<resolution; i=i+1) {
      float waveAngle = map(i, 0, resolution, 0, TWO_PI*8);  // * x is the number of waves
      float waveOffset = sin(waveAngle)*30;
      
      float angle = map(i, 0, resolution, 0, TWO_PI);
      float circleOffX = cos(angle) * ((radius) + waveOffset);
      float circleOffY = sin(angle) * ((radius) + waveOffset);

      float x = circleX + circleOffX;
      float y = circleY + circleOffY;
      
   // vertex(x, y);
  }
  endShape(CLOSE);
       
// Shape 2 / Rotation without noise
  radius = 100;
  fill( 0, 0, 0, 90);
  stroke(255);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {

    float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

    float angle = map(i, 0, resolution, 0, TWO_PI*20);
    float circleOffX = cos(angle+offset/100) * (radius);
    float circleOffY = sin(angle+offset/100) * (radius);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    vertex(x, y);
  }
  endShape(CLOSE);
  
  // Shape 3 / Fixed with noise
  radius = 100;
  fill( 0, 0, 0, 90);
  stroke(255);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {

    float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

    float angle = map(i, 0, resolution, 0, TWO_PI*20);
    float circleOffX = cos(angle) * (myPerlin+radius);
    float circleOffY = sin(angle) * (myPerlin+radius);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;



    vertex(x, y);
  }
  endShape(CLOSE);
  
    // Shape 3 / Fixed with resolution cotrolled by x,y mouse coordinates
  radius = 100;
  fill( 0, 0, 0, 90);
  stroke(255);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {
    
     resolution=mouseX;
     radius=mouseY*0.5;

    float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

    float angle = map(i, 0, resolution, 0, TWO_PI*10);
    float circleOffX = cos(angle) * (myPerlin+radius);
    float circleOffY = sin(angle) * (myPerlin+radius);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;

    vertex(x, y);
  }
  endShape(CLOSE);
  
  // Shape 4 / If and else with color change
  radius = 100;
  stroke(255);

  beginShape();
  for ( int i=0; i<resolution; i=i+1) {
    
     resolution=mouseX;
     radius=mouseY*0.5;

    float myPerlin = noise(millis()*0.001+float(i)*100) * 100;

    float angle = map(i, 0, resolution, 0, TWO_PI*10);
    float circleOffX = cos(angle+offset/10) * (myPerlin+radius);
    float circleOffY = sin(angle+offset/10) * (myPerlin+radius);

    float x = circleX + circleOffX;
    float y = circleY + circleOffY;
    
    if (x>resolution/4) {
      fill(24,13,55,50);
      
    }
    
    else {
      fill(54,77,86,30);
    }

    vertex(x, y);
  }
  endShape(CLOSE);
  
  
}
