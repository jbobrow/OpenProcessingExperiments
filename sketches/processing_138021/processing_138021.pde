
PImage lineas;

void setup(){
  size (1200,600);
  frameRate(5);
}

void draw(){
  lineas = loadImage("caratula.jpg");
  image(lineas, 0,0, 1200, 600);
  for ( float i = 0; i < 600; i = i + 20){
    if (mousePressed){
      noFill();
      stroke( 0, 100, 100);
      strokeWeight(random(6));
      //line(0,i,1200,i);
      beginShape();
      curveVertex( 0, i+5);
      curveVertex( 0, i);
      curveVertex( 300, mouseY+i/2);
      curveVertex( mouseX, i);
      curveVertex( 900, i);
      curveVertex( 1200, mouseY+i);
      curveVertex( 1200, i);
      endShape();
    }
  }
}

void keyReleased(){
 
  if (key == 's' || key == 'S') saveFrame ("screenshot.png");
  
}

