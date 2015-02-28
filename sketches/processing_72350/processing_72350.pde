
//Arreglos 

int n=5;  //EL numero de letras
//Los dos arreglos para almacenar las posiciones "x" y "y"
float x [] = new float[n];
float y []= new float[n];

 PFont[] tipos = new PFont[5];
float v=0.05; //Velocidad de las letras.
 //La cariable retra a utilizar
 
void setup(){
  size(800,600);
  
tipos[0] = createFont("Calibri",1);
tipos[1] = createFont("CenturyGothic",1);
tipos[2] = createFont("Garamond",1);
tipos[3] = createFont("LucidaBlackletter",1);
tipos[4] = createFont("Garamond",1);

}

  void draw(){
    //limpia ventana
    background(100);
    
    //Mueve la posicion de la primera letra
    //hacia la posicion del apuntador del ratón.
    
    x[0] +=v * (mouseX - x[0]);
    y[0] +=v * (mouseY - y [0]); 
    
    //mueve cada siguiente letra un poco hacia la posicion de la letra previa
    for(int i=1; i<n; i++){
      x[i] +=v * (x[i-1] - x[i]);
      y[i] +=v * (y[i-1] - y[i]);
    }
    
    //dibuja las letras
    for (int i=0; i <n; i++){
      fill(random(255),random(255),random(255),(255));
      textFont (tipos[i],48);
 
      text("follow me", x[i],y[i]);
      
    }
  }
