
PImage paisajista;

void setup(){
 background(255,255,255);
  paisajista = loadImage("paisajista.jpg");
  size(paisajista.width, paisajista.height); 
  noStroke();
  noLoop(); 
  ellipseMode(CORNER);
 }

color pal(PImage paisajista, int x, int y){
  color foto = paisajista.get(x,y);
  return foto;
}

void draw(){
  int spacer = 5; 
  for(int y = 0; y < height; y += spacer){
    for(int x = 0; x < width; x += spacer){
      fill(pal(paisajista, x, y));
      ellipse(x,y,round(random(1,15)),10);
    }
  }
}


