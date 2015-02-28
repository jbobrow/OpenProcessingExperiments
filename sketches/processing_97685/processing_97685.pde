

float sz = 20;
int numBoles = 30;
boolean dibuixaCercle = true;

float [] posX = new float[numBoles];
float [] posY = new float[numBoles];
float [] velX = new float[numBoles];
float [] velY = new float[numBoles];


void setup() { 
size(400, 350);
stroke(255, 87,0);

for (int i=0; i<numBoles; i++){
  posX [i] = width/2;
  posY [i] = height/2;
  velX [i]= random (5,10);
  velY [i] = random (5,10);
} 
}

void draw() { 
background(0);

for (int i=0; i<=400; i+=5){

line(200,200, width, i); 
line(200,200, 0,i); 
line(200,200,i,width);
line(200,200,i,0);
}

for (int i=0; i<numBoles; i++) { 
    posX [i] += velX [i];
  posY [i] += velY [i] ;
  
  if(dibuixaCercle){
  fill(0,87,255);
  ellipse(posX[i],posY[i],sz,sz);
    } else {
        fill(0,255,85);
  ellipse(posX[i],posY[i],100,100);
    }
  
 if((posX [i]<0)||(posX [i] >width)){
    velX [i] = -velX[i];
  } 
    //comprovem la posiciÃ³ Y
  if((posY [i]<0)||(posY[i]>height)){
    velY[i] = -velY[i];
  }
  
  ellipse (posX[i],posY[i],sz,sz);
}
}

void mousePressed () {
  dibuixaCercle = !dibuixaCercle;
}



