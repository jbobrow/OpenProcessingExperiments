
color fnd = color (255);//#f2f1ce ;
color ele = #e08946;
color lin = #2c8445; 
color otr = #2dc78f;

float[] pX;  //posicion en X
float[] pY; // posicion en Y
float[] diam; //diametros
color[] rell; //relleno circulos

int num=10; //cantidad de circulos


int t_circulo=100; //tamaño el circulo
int t_linea=8; //tamaño de la lina

void setup() {
  size(800, 800);
  background(fnd);
  smooth();
  frameRate(2);
  
  pX= new float[num];
  pY= new float[num];
  diam= new float[num];
  rell= new color [num];
}


//--------------------

void draw() {
  background(fnd,255);
  
 
  stroke(lin);
  
 
  
  
  circulos(t_circulo,t_linea);

  
}



//--------------------DAtos de circulos
void datos (int d){ // d = diametro máximo
  
   diam[0]= d;
   pX[0]=mouseX;//width/2;
   pY[0]=mouseY;//height/2;
   rell[0]=otr;
   
   
  float vX=width/2-d*3;   // variacionb de ancho de posicion
  float vY=height/2-d*3;  // variacionb de alto de posicion
   
  for(int i=1;i<num;i++){
      diam[i] = random(d/4,d*3/4);   
      pX[i] = random(vX,width-vX);
      pY[i] = random(vY,height-vY);
      rell[i] = ele;
   }
}


//----------------Lineas
void lineas (int s){  ///tamaño max de la linea
  
  for (int i=0;i<num;i++){
    strokeWeight(random(s/3,s));
     
     int v=(int)random(num);
     line (pX[i],pY[i],pX[v],pY[v]); 
  }
  
}

//------------- dibujo ellipses

void circulos(int dc, int sc){  //dc =diametro del circulo , sc= tam linea
  
  datos (dc);
  lineas(sc);
  
  for (int i=0;i<num;i++){
    fill(rell[i]);
    ellipse(pX[i],pY[i],diam[i],diam[i]);
  }
}




