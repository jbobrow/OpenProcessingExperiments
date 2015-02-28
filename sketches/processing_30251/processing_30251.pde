


int xPos, yPos, hue, alpha;
float length, rot;

void setup() {
	
  size(800, 600);
  frameRate = (120);
  background(0);	
  
  rot = 0;
  length = 0;
  xPos = width / 2;
  yPos = height / 2;

  strokeWeight(1);

  hue = 200;
  alpha = 7;

  colorMode(HSB, 360, 100, 100, 100);

}

void draw() {

  stroke(hue%360, 100, 100, alpha);
  for (int i = 0; i < 200; i++) {
    
    pushMatrix();
    
    translate(xPos, yPos);
    scale((float) 2);
    rotate(radians(rot%360));
			
    line(0, 0, length, length);
			
    length += 0.8;
    rot += 3.144;

    popMatrix();
			
  }

  if(length > width){
    hue+=13;
  length = 0;
  }
	
}

