
//obtiene la poscion polar para el angulo
//el angulo va disminuyendo
//el factor con el que se calcula tetha disminulle
//el color de los circulos cambia aleatoriamente
//se pone un rectangulo del tamaño de la pantalla con transparencia para dar el efecto de que desaparece

float theta;
float radius;
int factor = 50;

void setup(){  
   size(600, 600);
   smooth();
   
   theta = 0;
   radius = 100;
   background(0);
   fill(random(255),random(255),random(255), 100);
}

void draw(){ 
  // convert to polar
  float x = radius * cos(theta);
  float y = radius * sin(theta);
  
  // draw a circle at the cartesian coordinate
  noStroke();
  ellipse(width/2 + x, height/2 + y, 5, 5);
  
  // draw a line
  stroke(255,255,255,50);
  line(width/2+x, height/2 + y, width/2, height/2);
  
  // increase degrees each frame
  theta+=PI/factor;
  
  if(theta > TWO_PI){
    //draw transparent rect
    fill(0,0,0,20);
    //rect(0,0,height,width);
    rect(0,0,height*2,width*2);
    
    fill(random(255),random(255),random(255), 150);
    theta=0;
    radius-=10;
    factor-=5;
    
    //restart the factor
    if(factor<=0){ factor = 50; }
    
    //restart the radius
    if(abs(radius)>=(width/2)){ radius = width/2; }
  }
}

void mousePressed(){
    fill(0);
     
    //rect(0,0,height,width);
    rect(0,0,height*2,width*2);
}
