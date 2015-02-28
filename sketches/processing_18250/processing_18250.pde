
//int [] distance[10];
int taille=500;
float [] X = new float[taille];
float [] Y = new float[taille];


float [] zx =new float[taille];
float [] zy =new float[taille];

//float C;


void setup() {
  size (800,600);
  smooth();
  noStroke();
  
 
 
  
  for(int i=0;i<taille;i++) {    
    zx[i] = random(100);
    zy[i] = random(100);
    
  //    C = sqrt(sq(Y[i]-mouseY)+sq(Y[i]-mouseY));
    
  }

  
}

void draw() {
  
 // background(255);
 

  
 // fill (random(20),C);
  
  for(int i=0;i<X.length;i++) {    
    X[i] = (mouseX-X[i])/zx[i] + X[i];
    Y[i] = (mouseY-Y[i])/zx[i] + Y[i];
    ellipse(X[i],Y[i],1,1);
    
    if (mousePressed){
    background(200);
    
    
    }
  }
  
  
}

