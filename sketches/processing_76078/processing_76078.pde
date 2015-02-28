
float noiseval;
float xpos;

float angle;


void setup(){
  

  size(400,400);
  noiseval=0;
  xpos=10;
}



void draw() {
  //background(0)
  noiseval+=0.1;
  xpos++;
  
  
  ellipse(xpos, sin(noiseval)*100+100,noise(noiseval)*20,noise(noiseval)*20);
  
}

//circunferencia con auimento constante en x, el seno en y y el noise determina el radio
//circulo, tiene tres variables uqe definen su comportamiento
//diametro el diamtro esta variando por el noise
//comportamieno de x e y
// el seno se aplica sin)
//despllazamiento x (++)


//la circunferencia psasa un apura vez yy se va
