
int numNodos = 4;
int vertices;
boolean vis = true;
Nodo[] nodos;
PFont pixel;
float m = 100.0;
void setup(){
  vertices = 0;
  pixel = loadFont("pixel.vlw");
  nodos = new Nodo[numNodos];
  textFont (pixel, 8);
  textAlign(CENTER);
  ellipseMode(CENTER);
  size(800, 600);
  smooth();

  // construya todos los nodos indicados
  for(int i = 0; i < numNodos; i++){
    String numero = nfs(i, 0); // transforme 'i' en un string con cero decimal  
    nodos[i] = new Nodo(m+random(width-(2*m)), m+random(height-(2*m)), numero);
  }
}

void draw(){
  background(255);
  texto();
  
  noFill();
  strokeWeight(3);
  stroke(0);
  
  beginShape();
  
  //vertex(nodos[0].x, nodos[0].y); // el punto ancla inicial
  
  for (int i = 0; i < numNodos; i++){
    curveVertex(nodos[i].x, nodos[i].y);
  }
  endShape();


  for(int i = 0; i < numNodos; i++){
    nodos[i].render();
  }
}

void texto(){
  fill(0);
  text("curveVertex", width/2, 20); 
  String t = "presione 'a' para aumentar nodos, 'z' para disminuir número de nodos y ESPACIO para ocultarlos";
  text(t, width/2, height-25);
  fill(#FF7040);
  text(numNodos +" nodos"  , width/2, height-10);
}


void keyPressed(){
  
  if (key == 'a'){
    numNodos ++;
    setup();
  }
  
  if (key == 'z' && numNodos > 2){
    numNodos --;
    setup();
  }
  
  if (key == ' '){
    vis = !vis;
  }
}

class Nodo{
  float x, y;
  float d = 19.0;
  String num;
  boolean over;
  color col;

  Nodo(float _x, float _y, String _num){
    x = _x;
    y = _y;
    num = _num;
    over = false;
    col = color(255,150);
  }

  void update(){
    float dis = dist(mouseX, mouseY, x, y);
    if (dis <= d/2){
      over = true;
    }
    else{
      over = false;
    }
  }

  void draw(){
    if (over) {
      strokeWeight(3);
      stroke(0);
    }
    else{
      stroke(100);
      strokeWeight(1);
    }
    fill(col);
    ellipse(x,y, d, d);
    fill(0);
    text(num, x, y+4);
  }

  void render(){
    update();
    if(vis){
      draw();
    }
  }
}

void mouseReleased(){
  for(int i = 0; i < numNodos; i++){
    nodos[i].over = false;
  }
}

void mouseDragged(){
  for(int i = 0; i < numNodos; i++){
    if (nodos[i].over == true){
      nodos[i].x = mouseX;
      nodos[i].y = mouseY;
      for(int j = 0; j < numNodos; j++){
        if (j != i){
          nodos[j].over = false;
        }
      }
    }
  }
}




