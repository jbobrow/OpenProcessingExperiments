
//huachimingo es la transparencia de los naranjos
float angle = 0.0;
float offset = 200;
float scalar = 30;
float incremento = 0.08;
float transparencia =50;
float huachimingo = 50;

void setup() {
  size(900, 400);
  noStroke();
  smooth();
}

void draw() {
  
  fill(150,0,10,20);
  float x = offset + cos(angle) * scalar;
  float y = offset + sin(angle) * scalar;
  float z =offset + cos(angle) *scalar+100;

 
  
  
  
  //circulos azules
  
  fill(0,0,20,transparencia);
  ellipse(x+250,y-50,20,20);
  if(transparencia <38){
    transparencia = 0;
  }
  ellipse(x+550,y+100,20,20);
  ellipse(x-50,y+100,20,20);
  
  
 // circulos naranjos
  
  fill(186,93,23,huachimingo);
ellipse(x+500,y-200,20,20);
if(huachimingo <20){
    huachimingo = 0;
  }
  
  ellipse(x,y-200,20,20);
  
  fill(186,93,23,huachimingo);
  ellipse(x+250,y+250,20,10);


  scalar+=0.1;
  transparencia-=0.01;
  angle += incremento;
  huachimingo-=0.02;
}
