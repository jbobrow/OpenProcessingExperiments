
int amp=5;

int cant = amp*400;
float km=0;

float[] X = new float[cant]; 
float[] Y = new float[cant]; 
float[] T = new float[cant]; 
float[] C = new float[cant]; 
float[] Cs = new float[cant]; 
float[] Cb = new float[cant]; 

float Xjug;
float Yjug;
float Tjug = 40;
float Vjug = 0;

float radio;
float angulo;

float Xlun;
float Ylun;
  


PImage choriImagen;

int Z = 20;

float tamanio;

float velY=0;

float vel=-1;
float max=50;
float exp=0.3;



void setup() {

radio=1;
angulo=0;
  
  size(691, 400);
  //size(displayWidth, displayHeight);
  background(0);
  for (int i = 0; i < cant; i++) {
    X[i]=random(width*-amp, width*amp);
    Y[i]=random(0, height);
    T[i]=random(4);
    C[i]=int(random(150, 255));
    Cs[i]=int(random(10, 255));
    Cb[i]=int(random(10, 255));
  }

 Xjug = width / 2;
 Yjug = height / 2;

}

void draw() {
  fill(0); 
  rect(0, 0, width, height);
  fill(255);
  text(vel,20,20);
  text(km,20,40);
  km=km+vel;
  
  for (int i = 0; i < cant; i++) {
    
    
  if (X[i]<km*-1-width*amp){X[i]=km*-1+width*amp;}
    
    if (X[i]>km*-1+width*amp){X[i]=km*-1-width*amp;}
    
    //text(X[i],X[i],Y[i]);
    
    X[i]=X[i]+vel;
    
    planeta(X[i], Y[i], T[i], T[i], C[i], Cs[i], Cb[i],km);
    lineaplaneta(X[i], Y[i],km);

  }
  
  fill(255,200,200);
  noStroke();
  Yjug=Yjug-velY;
 
//  float randY = map(vel,0,max,0,1);
//  
//  Yjug=Yjug+random(-1*randY,1*randY);
  
  ellipse(Xjug-vel*7,Yjug,Tjug,Tjug);  
  
  pushMatrix(); 
  
    translate(Xjug-vel*7, Yjug); 
    rotate(angulo); 
    translate(Tjug, 0); 
    fill(255, 50, 1000); 
    ellipse(Xlun,Ylun,Tjug/5,Tjug/5);

  popMatrix(); //PLANETA 2
  
//  Xlun=(width * 0.5)+radio*cos(angulo);
//  Ylun=(height * 0.5)+radio*sin(angulo);
//  
  angulo = angulo +00.1 * vel/1.2;
  radio *= 1.005;

  vel = vel*0.9999999;
  velY = velY*0.99;

  
}


void keyPressed(KeyEvent e)
{

  if (e.getKeyCode()==39)
  {
    if (vel>-max){vel=vel-exp;}
    //Right arrow key code
  }
  else if (e.getKeyCode()==97)
  {
    if (vel<max){vel=vel+exp;}
    //Left arrow key code
  }
  
  else if (e.getKeyCode()==38)
  {
    if (velY<max){velY=velY+exp*2;}
    //up arrow key code
  }
  else if (e.getKeyCode()==40)
  {
    if (velY<max){velY=velY-exp*2;}
    //down arrow key code
  }

}

  void planeta(float rectX, float rectY, float alto, float ancho, float colorplaneta, float sat, float bri,float kmplaneta) {
    colorMode(HSB);
    noStroke();
    fill(colorplaneta);
    ellipse(rectX+kmplaneta, rectY, alto, ancho);
  }

  void lineaplaneta(float rectX, float rectY,float kmplaneta) {
    noFill();
    stroke(255);
    line(rectX+kmplaneta, rectY, rectX+kmplaneta-vel*2, rectY-velY*2);
  }

