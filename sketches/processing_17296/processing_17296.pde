
//Isaac OrtegaAlvarado ITCR-IDI-DVII- Homework #2- Interactive Moire Pattern-
import processing.pdf.*;//Importa la biblioteca PDF
Button bpdf;//Declar un botón de la clase button.
PFont font;//Clase par fuentes
Check check1,check2,check3,check4,check5,check6,check7,check8;//Declara los botones de la clase Check.
float x,y,w,s,sa,encender1,encender2,encender3,encender4,encender5,encender6,encender7,encender8,baseGray;// Declara las variables continua.
Scrollbar bar,bar1,bar2,bar3;//Declara los sliders de la clase Scrollbar
  Radio[] buttons = new Radio[2];// Declara la creacion de dos botones de la clase Radio.
  Nellipse h1 = new Nellipse(0);//Declara una nueva figura de la clase Nellipse
  Nellipse h2 = new Nellipse(40);
  Nellipse h3 = new Nellipse(80); 
  Nellipse h4 = new Nellipse(120); 
  Nellipse h5 = new Nellipse(160);
  Nellipse h6 = new Nellipse(200);
  Nellipse h7 = new Nellipse(240); 
  Nellipse h8 = new Nellipse(280); 
  Nellipse h9 = new Nellipse(320);
  Nellipse h10 = new Nellipse(360);
  Nellipse h11 = new Nellipse(400); 
  Nellipse h12 = new Nellipse(440);
  Nellipse h13 = new Nellipse(480); 
  Nellipse h14 = new Nellipse(520); 
  Nellipse h15 = new Nellipse(560);
  Nellipse h16 = new Nellipse(600);
  Nellipse h17 = new Nellipse(640); 
  Nellipse h18 = new Nellipse(680); 
  Nellipse h19 = new Nellipse(720);
  Nellipse h20 = new Nellipse(760);
  Nellipse h21 = new Nellipse(800); 
  Nellipse h22 = new Nellipse(840);
  Nellipse h23 = new Nellipse(880); 
  Nellipse h24 = new Nellipse(920); 
  Nellipse h25 = new Nellipse(960);
  Nellipse h26 = new Nellipse(1000);
  Nellipse h27 = new Nellipse(1040); 
  Nellipse h28 = new Nellipse(1080); 
  Nellipse h29 = new Nellipse(1120);
  Nellipse h30 = new Nellipse(1160);
  Nellipse h31 = new Nellipse(1200); 
  Nellipse h32 = new Nellipse(1240);
  Nellipse h33 = new Nellipse(1280); 
  Nellipse h34 = new Nellipse(1320); 
  Nellipse h35 = new Nellipse(1360);
  Nellipse h36 = new Nellipse(1400);
  Nellipse h37 = new Nellipse(1440);
void setup() 
{  
  buttons[0] = new Radio(595, 55, 10, color(255), color(0),0, buttons);//Declara las caracteristicas del boton
  buttons[1] = new Radio(545, 55, 10, color(255), color(0),1, buttons);//Declara las caracteristicas del boton
  bpdf = new Button(580, 630, 15,color(102), color(#f1e31d), color(102));//Declara las caracteristicas del boton
  check1 = new Check(90, 90, 10);//Declara las caracteristicas del boton
  check2 = new Check(90, 610, 10);//Declara las caracteristicas del boton
  check3 = new Check(610, 90, 10);//Declara las caracteristicas del boton
  check4 = new Check(610, 610, 10);//Declara las caracteristicas del boton
  check5 = new Check(350, 90, 10);//Declara las caracteristicas del boton
  check6 = new Check(350, 610, 10);//Declara las caracteristicas del boton
  check7 = new Check(610, 350, 10);//Declara las caracteristicas del boton
  check8 = new Check(90, 350, 10);//Declara las caracteristicas del boton
  bar = new Scrollbar(100, 630, 100, 10, #ffffff, #000000);//Declara las caracteristicas del slider
  bar1 = new Scrollbar(300, 630, 100, 10,0,255);//Declara las caracteristicas del slider
  bar2 = new Scrollbar(100, 650, 100, 10, 0.1, 18);//Declara las caracteristicas del slider
  bar3 = new Scrollbar(300, 650, 100, 10, 0, 10);//Declara las caracteristicas del slider
  size(700, 700);//Indica el tamano de la ventana
  frameRate(30);//Indica el número de cuadros por segundo
  }
void draw(){
  int x = int(bar.getPos());//indica que la variable toamara un valor que esta entre el minimo y el maximo dentro de los limites del slider.
  int y = int(bar1.getPos());//indica que la variable toamara un valor que esta entre el minimo y el maximo dentro de los limites del slider.
  int z = int(bar2.getPos());//indica que la variable toamara un valor que esta entre el minimo y el maximo dentro de los limites del slider.
  int w= int(bar3.getPos());//indica que la variable toamara un valor que esta entre el minimo y el maximo dentro de los limites del slider.
  
  background(x);//indica que el fondo toma como valor x.
  if (encender1==1){
    circulos(100,100,y,z,w);}// si la variable encender tiene valor se llama a la funcion ciruculos en una posición dada.
  if (encender2==2){
    circulos(100,600,y,z,w);}
  if (encender3==3){
    circulos(600,100,y,z,w);}
  if (encender4==4){
    circulos(600,600,y,z,w);}
  if (encender5==5){
    circulos(350,100,y,z,w);}
  if (encender6==6){
    circulos(350,600,y,z,w);}
  if (encender7==7){
    circulos(600,350,y,z,w);}
  if (encender8==8){
    circulos(100,350,y,z,w);}    
   fill(#000000);//indica que el marco de la ventana tendra color negro.
  noStroke();//indica que el marco de la ventan no tendra delineado
  rectMode(CORNER);//indica que las partes del marco de la ventana toman sus posiciones a partir de la la esquina superior derecha
  rect(0,0,100,700);//parte del marco de la ventana
  rect(0,0,700,100);//parte del marco de la ventana
  rect(600,0,100,700);//parte del marco de la ventana
  rect(0,600,700,100);//parte del marco de la ventana
  check1.display1();//dibuja el check
  check2.display2();
  check3.display3();
  check4.display4();
  check5.display5();
  check6.display6();
  check7.display7();
  check8.display8();
  buttons[0].display();//dibuja el Radio Button
  buttons[1].display();
  bar1.update(mouseX, mouseY);//carga la posicion de los elementos del slider
  bar1.display();//dibuja el slider
  bar2.update(mouseX, mouseY);
  bar2.display();
  bar.update(mouseX, mouseY);
  bar.display();
  bar3.update(mouseX, mouseY);
  bar3.display();
  font = loadFont("DIN-48.vlw"); //carga la fuente
  textFont(font, 14); //indica la altura de la fuente
  fill(#f1e31d);//indica el color de la fuente
  text("color fondo", 205, 640);//indica posición y el texto
  text("color línea", 405, 640);
  text("grosor línea", 205, 660);
  text("velocidad", 405, 660);
  text("PDF", 575, 660);
  textFont(font, 48);
  text("moiré", 100, 60);
  noFill();//indica que los siguientes elementos no tienen relleno
  stroke(#f1e31d);//
  strokeWeight(2);
  rect(565,40,20,20);//dibuja un rectangulo para 
  ellipse(525,50,20,20);
  bpdf.update();//carga el estaod del boton
  bpdf.display();//dibuja el boton
}
void mousePressed() {//Contiene las instrucciones que deben ser llamadas segun cada clase cuando se hace click con el boton principal del mouse
  check1.press(mouseX, mouseY);
  check2.press(mouseX, mouseY);
  check3.press(mouseX, mouseY);
  check4.press(mouseX, mouseY);
  check5.press(mouseX, mouseY);
  check6.press(mouseX, mouseY);
  check7.press(mouseX, mouseY);
  check8.press(mouseX, mouseY);
  bar.press(mouseX, mouseY);
  bar1.press(mouseX, mouseY);
  bar2.press(mouseX, mouseY);
  bar3.press(mouseX, mouseY);
  bpdf.press();
  buttons[0].press(mouseX, mouseY);
  buttons[1].press(mouseX, mouseY);
}
void mouseReleased() {//Contiene las instrucciones que deben ser llamadas segun cada clase cuando el mouse no sobre un elemento que responde al mouse
  bar.release();
  bar1.release();
  bar2.release();
  bar3.release();
  bpdf.release();
}
class Check {// clase para generar botones del tipo check... tomado del Libro de Ben Fry... modificado para este caso.
  int x, y;
  int size; 
  float baseGray=255;
  boolean checked = false;
  Check(int xp, int yp, int s) {
  x = xp;
  y = yp;
  size = s;
}
  void press(float mx, float my) {
    if ((mx >= x-(size/2)) && (mx <= x+(size/2)) && (my >= y-(size/2)) && (my <= y+(size/2))) {
    checked = !checked;
  }
  }
  void display1() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender1= 1;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender1=2;}
  }
  void display2() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender2= 2;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender2=9;}
  }
  void display3() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender3= 3;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender3=9;}
  }
  void display4() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender4= 4;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender4=9;}
  }
  void display5() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender5= 5;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender5=9;}
  }
  void display6() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender6= 6;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender6=9;}
  }
  void display7() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender7= 7;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender7=9;}
  }
  void display8() {
    stroke(0);
    strokeWeight(1);
    fill(baseGray);
    ellipse(x, y, size, size);
    if (checked == true) {
    encender8= 8;
    strokeWeight(1);
    stroke(0);
    ellipse(x, y, size, size);
    fill(0);
    ellipse(x,y,size-5,size-5);
    }else{encender8=9;}
  }
}

void circulos(float x,float y,float s, float sa, float v){//función para generar circulos o cuadrados concentricos... de mi autoria.
  h1.update(x,y,s,sa,v); 
  h2.update(x,y,s,sa,v); 
  h3.update(x,y,s,sa,v); 
  h4.update(x,y,s,sa,v);
  h5.update(x,y,s,sa,v);
  h6.update(x,y,s,sa,v);
  h7.update(x,y,s,sa,v);
  h8.update(x,y,s,sa,v);
  h9.update(x,y,s,sa,v);
  h10.update(x,y,s,sa,v);
  h11.update(x,y,s,sa,v);
  h12.update(x,y,s,sa,v);
  h13.update(x,y,s,sa,v);
  h14.update(x,y,s,sa,v);
  h15.update(x,y,s,sa,v);
  h16.update(x,y,s,sa,v);
  h17.update(x,y,s,sa,v);
  h18.update(x,y,s,sa,v);
  h19.update(x,y,s,sa,v);
  h20.update(x,y,s,sa,v);
  h21.update(x,y,s,sa,v); 
  h22.update(x,y,s,sa,v);
  h23.update(x,y,s,sa,v);
  h24.update(x,y,s,sa,v);
  h25.update(x,y,s,sa,v);
  h26.update(x,y,s,sa,v);
  h27.update(x,y,s,sa,v);
  h28.update(x,y,s,sa,v);
  h29.update(x,y,s,sa,v);
  h30.update(x,y,s,sa,v);
  h31.update(x,y,s,sa,v);
  h32.update(x,y,s,sa,v);
  h33.update(x,y,s,sa,v);
  h34.update(x,y,s,sa,v);
  h35.update(x,y,s,sa,v);
  h36.update(x,y,s,sa,v);
  h37.update(x,y,s,sa,v);
}
class Nellipse{ 
  float diametro; 
  Nellipse(float d){  
     diametro = d;
  } 
  void update(float x,float y, float s, float sa,float v){
    float ceny=y;
    float cenx=x;
    float linea=s;
    float grosor=sa;
    float velocidad=v;
    if (diametro <1440) { 
      diametro+=velocidad; 
    }else{
     diametro=0; 
    }
    stroke(linea);
    strokeWeight(grosor);
    noFill();
    if (buttons[1].checked){
      ellipse(cenx, ceny, diametro, diametro);
    }
    if(buttons[0].checked){
      rectMode(CENTER);
      rect(cenx, ceny, diametro, diametro);
    }
}
}
class Scrollbar {// clase para generar sliders... tomado del Libro de Ben Fry... modificado para este caso.
  int x, y; // The x- and y-coordinates
  float sw, sh; // Width and height of scrollbar
  float pos; // Position of thumb
  float posMin, posMax; // Max and min values of thumb
  boolean rollover; // True when the mouse is over
  boolean locked; // True when its the active scrollbar
  float minVal, maxVal; // Min and max values for the thumb
  Scrollbar (int xp, int yp, int w, int h, float miv, float mav) {
  x = xp;
  y = yp;
  sw = w;
  sh = h;
  minVal = miv;
  maxVal = mav;
  pos = x;
  posMin = x;
  posMax = x + sw - sh;
  }
// Updates the over boolean and the position of the thumb
void update(int mx, int my) {
if (over(mx, my) == true) {
rollover = true;
} else {
rollover = false;
}
if (locked == true) {
pos = constrain(mx-sh-2, posMin, posMax);
}
}
// Locks the thumb so the mouse can move off and still update
void press(int mx, int my) {
if (rollover == true) {
locked = true;
} else {
locked = false;
}
}
// Resets the scrollbar to neutral
void release() {
locked = false;
}
// Returns true if the cursor is over the scrollbar
boolean over(int mx, int my) {
if ((mx > x) && (mx < x+sw) && (my > y) && (my < y+sh)) {
return true;
} else {
return false;
}
}
// Draws the scrollbar to the screen
void display() {
fill(255);
rect(x, y, sw, sh);
if ((rollover==true) || (locked==true)) {
fill(#f1e31d);
} else {
fill(102);
}
rect(pos, y, sh, sh);
}
// Returns the current value of the thumb
float getPos() {
float scalar = sw/(sw-sh);
float ratio = (pos - x) * scalar;
float offset = minVal + (ratio/sw * (maxVal-minVal));
return offset;
}
}
class Button {// clase para generar botones... tomado del Libro de Ben Fry... modificado para la generacion del PDF
int x, y; // The x- and y-coordinates
int size; // Dimension (width and height)
color baseGray; // Default gray value
color overGray; // Value when mouse is over the button
color pressGray; // Value when mouse is over and pressed
boolean over = false; // True when the mouse is over
boolean pressed = false; // True when the mouse is over and pressed
Button(int xp, int yp, int s, color b, color o, color p) {
x = xp;
y = yp;
size = s;
baseGray = b;
overGray = o;
pressGray = p;
}
// Updates the over field every frame
void update() {
if ((mouseX >= x) && (mouseX <= x+size) &&
(mouseY >= y) && (mouseY <= y+size)) {
over = true;
} else {
over = false;
}
}
boolean press() {
if (over == true) {
pressed = true;
return true;
} else {
return false;
}
}
void release() {
pressed = false; // Set to false when the mouse is released
}
void display() {
if (pressed == true) {
fill(pressGray);
beginRecord(PDF, "moire-####.pdf");
} else if (over == true) {
fill(overGray);
} else {
fill(baseGray);
endRecord();
}
stroke(0);
rect(x, y, size, size);
}
}
class Radio {// clase para generar botones del tipo RADIO... tomado del Libro de Ben Fry... modificado para este caso.
int x, y; // The x- and y-coordinates of the rect
int size, dotSize; // Dimension of circle, inner circle
color baseGray, dotGray; // Circle gray value, inner gray value
boolean checked = false; // True when the button is selected
int me; // ID number for this Radio object
Radio[] others; // Array of all other Radio objects
Radio(int xp, int yp, int s, color b, color d, int m, Radio[] o) {
x = xp;
y = yp;
size = s;
dotSize = size - size/3;;
baseGray = b;
dotGray = d;
others = o;
me = m;
}
// Updates the boolean value press, returns true or false
boolean press(float mx, float my) {
if (dist(x, y, mx, my) < size/2) {
checked = true;
for (int i = 0; i < others.length; i++) {
if (i != me) {
others[i].checked = false;
}
}
return true;
} else {
return false;
}
}
// Draws the element to the display window
void display() {
noStroke();
fill(baseGray);
ellipse(x, y, size, size);
if (checked == true) {
fill(dotGray);
ellipse(x, y, dotSize, dotSize);
}
}
}

