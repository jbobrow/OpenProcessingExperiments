
//Melania Gonzalez
int cantidad = 20;
float cola[][]= new float[cantidad][6];
float angulo = PI/10;

void setup() {
  size(900, 700);
  background(0);
  //ellipseMode(CENTER);
  smooth();
  frameRate(15);
  for (int i=0; i<cantidad;i++) {
    cola[i][0]= 2;
    cola[i][1]= 1;
    cola[i][2]= random(255);
    cola[i][3]= random(255);
    cola[i][4]= random(255);
    cola[i][5]= angulo;
    for(int j=0; j<i;j++){
      calcFibonacci(j);
    }
  }
  
}

void draw() {
  fill(0, 20);
  rect(0, 0, width, height);
  
  int pos = frameCount%cantidad;
  
  if(cola[pos][5]>TWO_PI){
  calcFibonacci(pos);
  }
  
  for (int i=0; i<cantidad;i++) {
    pintaFibonacci(i); 
  }

  if (cola[pos][0]>width) {
    cola[pos][0]=2;
    cola[pos][1]=1;
    cola[pos][5]=angulo;
  }
}

void calcFibonacci(int pos) {

  float fibonacci = cola[pos][0];
  float fibonacciAnt= cola[pos][1];

  cola[pos][0]= fibonacci+fibonacciAnt;
  cola[pos][1]= fibonacci;
}

void pintaFibonacci(int pos) {

  float fibonacci = cola[pos][0];
  float red = cola[pos][2];
  float green = cola[pos][3];
  float blue = cola[pos][4];
  float ang = cola[pos][5];

  pushMatrix();
  fill(red, green, 255);
  rotate(ang);
  translate(0,0);
  ellipse(0, fibonacci, fibonacci, fibonacci);
  
  int textSize = (int)(fibonacci/5);
  int textValue = (int)fibonacci/10;
  fill(255);
  textSize(textSize);
  text(textValue, fibonacci/2, fibonacci);


  popMatrix();
  
  cola[pos][5]+=angulo;
} 

