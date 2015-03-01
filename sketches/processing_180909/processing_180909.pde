
int stepX=25;
int stepY=25;

color c = color(255);

void setup(){
  size(800, 400);
  background(255);
  background(255);
}

void draw(){
   
  background(255);
  pushStyle();
  noStroke();
  colorMode(HSB, width, 100, height);

 
  for (int gridY=0; gridY<height-50; gridY+=stepY){
    for (int gridX=0; gridX<width; gridX+=stepX){
      fill(gridX, 100,height-gridY);
      rect(gridX, gridY, stepX, stepY);
    }
  }
  popStyle();
  
  colorMode(RGB);
  loadPixels();
  if (mousePressed){
   c = pixels[mouseY*width+mouseX];
  }
  
  pushStyle();
  stroke(0);
  fill(c);
  rect(width/2 - stepX, height-35,25,25);
  popStyle();
  
  fill(0);
  text("Rouge :   "+red(c), 250, height-35);
  text("Vert      :   "+ green(c), 250, height-20);
  text("Bleu     :   "+ blue(c), 250, height-5);
  
  
  text("Teinte              :  "+ int(hue(c)) , width/2 + 35, height-35);
  text("Saturation      :  "+ saturation(c), width/2 + 35, height-20);
  text("Luminosite     :  "+ brightness(c), width/2 + 35, height-5);
  

  
}
