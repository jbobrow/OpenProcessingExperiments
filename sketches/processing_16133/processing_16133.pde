
float[] x = new float[100];
float[] y = new float[100];
boolean tiraFoto;

void setup(){
  size(screen.width,screen.height);
  tiraFoto = false;
  //size(500,500);
  background(255,255,255);
  smooth();
  for (int i=0;i<100;i++){
    x[i]=0;
    y[i]=0;
  }
}

void draw(){
  //background(0);
  fill(255,255,255,100);
  for (int i=10;i>0;i--){
    figura(x[i],y[i],i+millis()/300.0,1/15.0);
    figura(x[i],y[i],-i-millis()/300.0,1/15.0);
    x[i]=x[i]+(x[i-1]-20-x[i])/20;
    y[i]=y[i]+(y[i-1]-2-y[i])/20;
  }
  figura(x[0],y[0],millis()/300.0,1/15.0);
    figura(x[0],y[0],-millis()/300.0,1/15.0);
  x[0]= x[0]+(mouseX-20-x[0])/50;
  y[0]=y[0]+(mouseY-2-y[0])/50.0;
  
  if (tiraFoto) save(frameCount + ".jpg");

}

void figura(float x, float y, float ang, float tam) {
  pushMatrix();    // abre o "bloco" de transformações de coordenadas e tamanho
  translate(x,y);  // muda posição da figura
  scale(tam);      // muda o tamanho da figura
  rotate(ang);    // rotaciona a figura com angulo ang
  fill(250,0,0);
  stroke(100);
  line(x,y,50,50);
  fill(0);
  rect(-50,-50,100,100);
  fill(200,180,0);
  ellipse(x,y, 100,100);
  fill(255,0,0);
  ellipse(25, 25, 50,50);
  popMatrix();    // fecha o "bloco" de transforações (esquece as transformações)
}

void keyPressed() {
  tiraFoto = !tiraFoto;
}


