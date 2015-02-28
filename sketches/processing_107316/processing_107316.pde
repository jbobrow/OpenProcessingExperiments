
void setup(){

  size(600,600);
  noStroke();
  frameRate(60);
}


void draw(){
  background(255);
  //blanco = !blanco;
  tablero();
}

boolean blanco = true;
float rotateSpeed = 0.01;
float rad = 0;

void tablero(){
    
    
    int cuantos = 8;
    
    int w = width/cuantos;
    int h = height/cuantos;
    for (int i=0; i<cuantos; i++){
          for (int j=0; j<cuantos; j++)
          {  
             fill( blanco ? 255 : 0);
             if (!blanco){
               pushMatrix();
               rectMode(CENTER);
               translate( i * w + (w/2), j * h + (h/2));
               rotate(rad);
               rect(0,0, w, h);
               popMatrix();
             }
//             else{
//               rectMode(CORNER);
//               rect(i * w, j * h, w, h);
//             }
             blanco = !blanco;
          }
          blanco = !blanco;
    }
    
    rad += rotateSpeed;
    if (rad > TWO_PI)
      rad = 0;
}

void mousePressed(){
   rotateSpeed = -rotateSpeed; 
}


