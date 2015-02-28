
//Click y arrastre de ratón para cambiar la tonalidad del cuadrado principal negro.


float r; //declaramos variable tipo decimal r 
float g;//declaramos variable tipo decimal g 
float b;//declaramos variable tipo decimal b 
float a;//declaramos variable tipo decimal a 
 
float diam;//declaramos variable tipo decimal diam 
float x = 95;    
float y = 90;
float speed = 0; 
float gravity = 0.1;


void setup() {
size(726,800);
background(241,242,234); //color para fondo crudo
noStroke();
}


int value = RGB;


void draw() {
  background(255);
    
  
  r = random (255); 
  g = random(255); 
  b = random (250); 
  a = random(250); 
 
  
  fill(241,169,0); //para un color de relleno amarillo naranja.
  rect(54,415,130,205);
  
  fill(154,65,7); //para un color de relleno marron.
  rect(138,620, 80, 69);
  ellipse(264,573,102,102);
  
  fill(255,255,255);
  ellipse(264,573,69,69);
  
  fill(r,g,b,a); //para un color de relleno azul.
  beginShape(TRIANGLE_FAN);
  vertex(x, y);
  vertex(528, 527); 
  vertex(490,855); 
  vertex(630, 743);
  vertex(528, 527); 
  endShape();
   
  fill(r,g,b,a);
  
  beginShape(TRIANGLE_FAN);
  vertex(x, y);
  vertex(566, 855); 
  vertex(678,707); 
  vertex(710, 743);
  vertex(566, 855); 
  endShape();
  
  fill(value);
  rect(x,y,320,311);
  y = y + speed; 
  speed = speed + gravity; 
  if (y > height) {
    speed = speed * -0.95; 
    
  }
}

void mouseClicked() {
  if(value == 0) {
    value = 255;
  } else {
    value = 0;
  }
}

void mouseDragged() 
{
  value = value + 5;
  if (value > 255) {
    value = 0;
    
  }
}

void keyPressed() {
  if (value == 0) {
    value = 155;
  } else {
    value = 0;
  }
}


 

