
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
    col = #D3FF95;
  }

  void update(){
    float dis = dist(mouseX, mouseY, x, y);
    if (dis <= d/2){
      over = true;
    }else{
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



