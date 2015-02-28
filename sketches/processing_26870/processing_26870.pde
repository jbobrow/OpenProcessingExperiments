
import processing.pdf.*;


PFont font;

int tamanio ;
void setup() 
{
  background(255);
  frameRate(50); // Run slow...
  size(800 ,500);
  smooth();
  tamanio = width/20;

//cargar fuente
  font = createFont("AvantGarde-Bold", 48);
  textAlign(CENTER);
  float tam = random(50);
  textFont(font);
  cursor(CROSS);
  //descomentar las siguientes limeas para ver tipos que se pueden usar
 //String[] fontList = PFont.list();
 //println(fontList);

}

//la linea que va hasta el centro
void draw(){
 dibujarLinea();
  
  //para hacer el fade
   fill(#FFFFFF, 50); 
  rect(-1,-1,900,800);

}


//PARA EXPORTAR A PDF
void keyPressed() {
  switch(key) {

  case 's': 
    println("BEGIN RECORD");
    textFont(font);
    beginRecord(PDF, "Lines.pdf"); 
    textFont(font);
    break;
  
    case 'q': 
   println("endRecord");
   endRecord();

 textFont(font);
 break;
   
   
  }
}

void mouseDragged() {
  println("ddddm:"+tamanio);
 
  dibujarPalabras();
}

void dibujarLinea(){
   stroke(#000000);
   line(mouseX,mouseY,width/2,500);

  }

//el texto en tamanio aleatorio
void dibujarPalabras(){
  
  text("CHAN" , mouseX, mouseY);
  fill(devuelveColor());
  textSize(random(50));


}
color devuelveColor(){
  float rojo = random(150,255);
  float verde = 0;
  float azul = 0;
  return color(rojo,verde,azul);
  }


