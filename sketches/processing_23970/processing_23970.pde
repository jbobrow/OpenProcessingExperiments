
int maximus = 1000;

int[] posesX = new int[maximus];
int[] posesY = new int[maximus];

float[] angle = new float[maximus];

int[] sz = new int[maximus];
int[] szFibo = new int [maximus];

int[] rojos = new int[maximus];
int[] verdes = new int[maximus];
int[] azules = new int[maximus];
int[] alfa = new int [maximus];

int[] vel = new int [maximus];

int szGeneral = 8;

int last;

PFont font;

void setup() 
{
  size(800, 600);
  smooth();
  noStroke();
  
  font = loadFont("SansSerif-48.vlw"); 
  
  for (int i=0; i<maximus; i++) {
    angle[i]=0.0;
    alfa[i]=200;
  }
}


void draw() {
  fill(0,0,0,50);
  rect(0,0,width,height);
  
  fill(50);
  textFont(font, 35); 
  text("DRAG IS FUN!", 15, 50);
   
  
   for (int i=0; i<last; i++) {
          
     szFibo[i] = fibonacci(sz[i]);   
     angle[i] = atan2(mouseY-posesX[i], mouseX-posesY[i]);
    
     pushMatrix();
     translate(posesX[i], posesY[i]);
     
     fill(255,255,255,alfa[i]);
     ellipse(0, 0, szFibo[i], szFibo[i]);
     
     rotate(angle[i]);
         
     fill(rojos[i],verdes[i],azules[i],alfa[i]);
         
     ellipse(szFibo[i]/4, 0, szFibo[i]/2, szFibo[i]/2);
         
     alfa[i]--;
      posesY[i]+=vel[i];
     popMatrix();
    
   }
  
}

void mouseDragged() {
  posesX[last] = mouseX;
  posesY[last] = mouseY;
  
  sz[last] = szGeneral;
  
  rojos[last] = (int) random(0,255);
  verdes[last] = (int) random(0,255);
  azules[last] = (int) random(0,255);
  
  vel[last] = (int) random(1,6);
  
  if (last<999) {
    last++;
  }
  
  if (szGeneral<10) {
    szGeneral++;
  } else {
    szGeneral=7;
  }
}

void mouseClicked() {
  posesX[last] = mouseX;
  posesY[last] = mouseY;
  
  sz[last] = szGeneral;
  
  rojos[last] = (int) random(0,255);
  verdes[last] = (int) random(0,255);
  azules[last] = (int) random(0,255);
  
  vel[last] = (int) random(1,6);
  
  if (last<999) {
    last++;
  }
  
  if (szGeneral<10) {
    szGeneral++;
  } else {
    szGeneral=7;
  }
}

//Metodo de fibonacci
int fibonacci (int n) {
  if ((n == 0) || (n == 1)) {
    return 1;
  } 
  else {
    return fibonacci(n-1) + fibonacci(n-2);
  }
}





