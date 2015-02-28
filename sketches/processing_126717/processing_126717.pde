
class Coisa {
  float xpos,ypos,h;
  color cor;

  Coisa(float x, float y, float alt, color c){
    xpos = x; ypos = y; cor = c; h = alt;
  }

  void desenha(){
    fill(cor);
    ellipse(xpos,ypos,h*2,h);
    fill(255);
    ellipse(xpos-h/2,ypos,h/3,h/3);
    ellipse(xpos+h/2,ypos,h/3,h/3);
    fill(0);
    ellipse(xpos-h/2,ypos,h/9,h/9);
    ellipse(xpos+h/2,ypos,h/9,h/9);
  }
  void olhos(){
    fill(255);
    ellipse(xpos-h/2,ypos,2*h/3,2*h/3);
    ellipse(xpos+h/2,ypos,2*h/3,2*h/3);
    fill(0);
    ellipse(xpos-h/2,ypos,2*h/9,2*h/9);
    ellipse(xpos+h/2,ypos,2*h/9,2*h/9);
  }
  void lingua(){
    fill(255,0,0);
    ellipse(xpos,ypos+h/2,2*h/3/3,2*h/3/2);
  }
};

Coisa[] arrayCoisas = new Coisa[20];
float[][] pos = new float[20][2];
float[] alt = new float[20];
//float d;

void setup(){
  size(400,400);
  for(int i = 0; i <20; i++){
    alt[i] = random(10,50);
    color cor = color(random(0,255),random(0,255),random(0,255));
    pos[i][0] = random(0,400);
    pos[i][1] = random(0,400);
    arrayCoisas[i] = new Coisa(pos[i][0],pos[i][1],alt[i],cor);
  }
}

void draw(){
  background(255);
    if (mousePressed==true){
      for(int i = 0; i< 20; i++){
        arrayCoisas[i].desenha();
        float d = dist(pos[i][0],pos[i][1],mouseX,mouseY);
          if (d < alt[i]){
            arrayCoisas[i].lingua();
            arrayCoisas[i].desenha();
            arrayCoisas[i].olhos();
          }
        }
  } else {
    for(int i = 0; i <20; i++){
      arrayCoisas[i].desenha();
    }
  }
}
