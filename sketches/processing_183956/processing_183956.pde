
//Variables
float mida = 15;
int Bolas = 50;


//Matrius
float[] posiciox = new float[Bolas];
float[] posicioy = new float[Bolas];
float[] velocidadx = new float[Bolas];
float[] velocidady= new float[Bolas];

void setup(){
  size(400,300);
 
  
  for(int i = 0; i<Bolas; i++){
    posiciox[i] = width/2;
    posicioy[i] = height/2;
    velocidadx[i] = random(1,3);
    velocidady[i] = random(1,3);
  }
}

void draw(){

  for(int i = 0; i<Bolas; i++){
    posiciox[i] += velocidadx[i];
    posicioy[i] += velocidady[i];
  
  //Rebote
    if((posiciox[i]-mida/2<0)||(posiciox[i]+mida/2>width)){
      velocidadx[i] = -velocidadx[i];
    } 
  
    if((posicioy[i]-mida/2<0)||(posicioy[i]+mida/2>height)){
      velocidady[i] = -velocidady[i];
    } 
  }
 
 
  fill(255);
 //Elipse
  for(int i = 0; i<Bolas; i++){
    fill(random(255),random(255),random(255));
    ellipse(posiciox[i],posicioy[i],mida,mida);
  }
}

void mousePressed(){
  background(random(255),random(255),random(255));
  mida= random(15,45);
  fill(random(255),random(255),random(255));
}
