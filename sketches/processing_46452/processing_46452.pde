
// Programa para modificar los valores gráficos de un objeto
// Basado en el codigo de Pablo Arias, Noviembre de 2011.
// modificado para crear botones ON OFF Excluyente
// Modificado de nuevo para crear la interfaz


int con = 9;
float [] x = new float [con];
float [] y = new float [con];

int con2 = 4;
float [] x2 = new float [con2];
float [] y2 = new float [con2];

int diametro=10;
int diametro2=10;

boolean [] click = new boolean[con];
boolean [] encima = new boolean [con];
float [] colors = new float[con];
boolean [] onOff = new boolean[con];

boolean [] click2 = new boolean[con2];
boolean [] encima2 = new boolean [con2];
float [] colors2 = new float[con2];
boolean [] onOff2 = new boolean[con2];

PFont font;
int siz=1;

PImage colores;
color rawr;


void setup(){
  size(600,400);
  ellipseMode(CENTER);
  smooth();
  font=loadFont("AgencyFB-Reg-16.vlw");
  textFont(font,16);
   
  colores=loadImage("data/Colors.png");
    
  for(int i=0; i<con; i++){
    x[i] = width - diametro*2;
    y[i] = diametro*5 + (diametro*2.5)*i;

    encima[i]= false;
    click[i]= false;
    colors[i]=random(1,255);
    
    onOff[i] = false;
  }
  for(int j=0; j<con2; j++){
    x2[j] = width - diametro*5;
    y2[j] = diametro*5 + (diametro*2.5)*j;

    encima2[j]= false;
    click2[j]= false;
    colors2[j]=random(1,255);
    
    onOff2[j] = false;
  }  
}
  
void draw(){
  background(0);  
  image(colores, 0, 0);

  //colores
  color rawr = colores.get(mouseX, mouseY);

  fill(255);
  text("Size",width-diametro*3+1,35);
  text("Shape",width-diametro*6,35);
  for(int i=0; i<con; i++){  
    strokeWeight(2);
    stroke(255-colors[i], 255, 255);  
    if(encima[i]==true){
    }
      if(onOff[i] == true){
        fill(colors[i],136,125);
      }
      else{
       noFill(); 
      }
      // dibujo la interfaz      
      ellipse(x[i],y[i],diametro*2,diametro*2);
    } // fin del for 1
    
  for(int j=0; j<con2; j++){  
    strokeWeight(2);
    stroke(255-colors[j], 255, 255);  
    if(encima2[j]==true){
    //x[i]= x[i] * 0.95 + mouseX *0.05;
   // y[i]= y[i] * 0.95 + mouseY*0.05;
    }
      if(onOff2[j] == true){
        fill(colors[j],136,125);
      }
      else{
       noFill(); 
      }
      // dibujo la interfaz      
      ellipse(x2[j],y2[j],diametro*2,diametro*2);
    } // fin del for 2


    // Tamaños
    if(onOff[0] == true){
      siz=1;
    }
    if(onOff[1] == true){
      siz=2;
    }
    if(onOff[2] == true){
      siz=3;
    }
    if(onOff[3] == true){
      siz=4;
    }
    if(onOff[4] == true){
      siz=5;
    }
    if(onOff[5] == true){
      siz=6;
    }
    if(onOff[6] == true){
      siz=7;
    }
    if(onOff[7] == true){
      siz=8;
    }    
    if(onOff[8] == true){
      siz=9;
    }    
    else {
      }

    //Forma. 0=rect, 1= ellipse, 2=triángulo
    fill(rawr);
    if(onOff2[0] == true){
    rectMode(CENTER);
    rect(width/2, height/2, diametro2*siz, diametro2*siz);    
    } 
    if(onOff2[1] == true){
    ellipseMode(CENTER);      
    ellipse(width/2, height/2, diametro2*siz, diametro2*siz);    
    } 
    if(onOff2[2] == true){
    triangle((width/2)-(diametro2*siz), (height/2), width/2, height/2-(diametro2*siz), (width/2)+(diametro2*siz), height/2);    
    }     
    if(onOff2[3] == true){
    triangle((width/2)-(diametro2*siz), (height/2), width/2, height/2+(diametro2*siz), (width/2)+(diametro2*siz), height/2);    
    }    
    else{
  }    
  }
  
void mousePressed(){
  for(int i=0; i<con; i++){
  if (mouseX > x[i]-diametro && mouseX < x[i]+diametro && 
    mouseY > y[i]-diametro && mouseY < y[i]+diametro) {
    encima[i] = true;  
    
    if(onOff[i] == false){
      for(int k=0; k<con; k++){
       onOff[k] = false;
      }
      onOff[i] = true;      
    }
    else{
      onOff[i] = false;
     }
    }
    else {
    encima[i] = false;
  }

  } //fin for 1
  
  for(int j=0; j<con2; j++){
  if (mouseX > x2[j]-diametro && mouseX < x2[j]+diametro && 
    mouseY > y2[j]-diametro && mouseY < y2[j]+diametro) {
    encima2[j] = true;  
    
    if(onOff2[j] == false){
      for(int k=0; k<con2; k++){
      onOff2[k] = false;
      }
      onOff2[j] = true;      
    }
    else{
      onOff2[j] = false;
    }
   }
    else {
    encima2[j] = false;
  }
 }
 //fin for 2  
}

void mouseReleased(){
 for(int i=0; i<con; i++){
  encima[i] = false;
  }
  
 for(int i=0; i<con2; i++){
  encima2[i] = false;
  }  
  }

