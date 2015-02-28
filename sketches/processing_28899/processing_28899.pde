
float grados;
float radio, radio2;
float gIni, gFin;

// tipografia
PFont font;


void setup(){
  size(600,600);
  smooth();
  grados = 0.0;
  radio = 200;
  radio2 = 250;
  gIni = 60-300;
  gFin = 60;
  
  font = loadFont("SansSerif-24.vlw");
  textFont( font, 18);
}

void draw(){
  background(128);
  
  fill(255,128);
  noStroke();
  ellipse(width/2, height/2, 500,500);
  
  
  float radianes = radians(grados);
  fill(128,0,0);
  
  float angulo1 = grados + 180 - 30;
  float angulo2 = grados + 180 + 30;
   
  beginShape();
   vertex(300+cos(radianes)*radio, 300+sin(radianes)*radio);
   vertex(300+cos(radians(angulo1))*radio/5, 300+sin(radians(angulo1))*radio/5);
    vertex(300+cos(radians(angulo2))*radio/5, 300+sin(radians(angulo2))*radio/5);
  endShape(CLOSE);
  
  // tornillo
  fill(255);
  ellipse(width/2, height/2, 10,10);
  
  dibujaLasMarcas();
  
  // texto
  fill(255,128);
  textAlign(CENTER,CENTER);
  text("press 'a' or 'z' - drag the mouse", width/2, height-24);
}

void keyPressed(){
  if(key == 'a'){
    grados -= 2;
  }
  
  if(key == 'z'){
    grados += 2;
  }
  
  if(key == 'q'){
   saveFrame("agujas.png");
  }
}

void dibujaLasMarcas(){
  int intervalo = 5;
  stroke(128);
  strokeWeight(3);
  
  for(float g = gIni; g<=gFin; g+=intervalo){
    // angulo expredado en "radianes" 180º = 3,14
    float rad = radians(g);
    float x1 = width/2 + cos(rad)*radio2;
    float y1 = height/2 + sin(rad)*radio2;
    float x2 = width/2 + cos(rad)*(radio2-10);
    float y2 = height/2 + sin(rad)*(radio2-10);
    line(x1,y1,x2,y2);
  }
}

void mousePressed(){
  giraLaAguja();
}

void mouseDragged(){
  giraLaAguja();
}

void giraLaAguja(){
  float nuevoAngulo = atan2(mouseY-height/2, mouseX-width/2);
  grados = degrees(nuevoAngulo);
}

