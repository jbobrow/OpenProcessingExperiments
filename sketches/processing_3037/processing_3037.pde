
PImage haciatorre;

void setup(){
  size (640, 480);
  haciatorre=loadImage("haciatorre.JPG");
  image (haciatorre,0,0);
  smooth();
  noLoop();
  colorMode(HSB);
  noStroke();
  noStroke();
 
}

void draw(){
  int spacer = 10; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      color c = haciatorre.get(x,y);
      pincelada(x, y, c, spacer);
    }
  }
}

void pincelada(float x, float y, color c, float pam){
  int puntos = round(random(3,30));
  for(int i = 2; i <= puntos; i++){
    float p = hue(c) + random(-5, 5);
    float a = saturation(c) + random(100);
    float m = brightness(c) + random(-5, 5);
    pushMatrix();
    translate(x,y);
    fill(p,a,m);
    float dodo = random(2, pam/2);
    triangle(random(-pam, pam),random(-pam, pam), dodo, dodo,random(-pam, pam),dodo);
    popMatrix();
  } 
}

void keyPressed(){
  redraw(); 
}

