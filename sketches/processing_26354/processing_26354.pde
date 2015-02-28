
boolean button1 = false;
boolean button2 = false;
boolean button3 = false;


int x1=color (2,138,233);
int x2=color (123,217,0);
int x3=color (243,2,143);


int y=450;
int h=475;


int w=50;



void setup() {
  size(800,500);
  smooth();
  background(2,26,42);
}

//cuadros
void draw() {
  fill(2,138,233);
  noStroke();
  rect(0,height/4,40,80);


  fill(123,217,0);
  rect(0,height/2-45,40,80);


  fill(243,2,143);
  rect(0,height/2+30,40,80);
}

//botones

void mouseDragged() {
  //Function button1
  if (button1) {
    fill(2,138,233);
    ellipse(mouseX,mouseY,20,20);
  }


  //Function button2
  if (button2) {
    fill(123,217,0);
    ellipse(mouseX,mouseY,20,20);
  }


  //Function button3
  if (button3) {
    fill(243,2,143);
    ellipse(mouseX,mouseY,20,20);
  }
}



void mousePressed() {
  //MAPEANDO LA POSICION DE LOS CUADROS
  //primer x= posicion, 2da x= ancho del cuadro, 1er y= posicion, 2da y=SUMA DE PRIMER Y MAS altura.
  
  if (mouseX>0 && mouseX<40 && mouseY>125 &&mouseY<205 &&(mousePressed == true)) {
    button1 = !button1;
    button2 =false; 
    button3 = false;
  }


  if(mouseX>0 && mouseX<40 && mouseY>205 &&mouseY<285 &&(mousePressed == true)) {
    button2 = !button2;
    button1 = false; 
    button3 = false;
  }


  if (mouseX>0 && mouseX<40 && mouseY>280 &&mouseY<360 &&(mousePressed == true)) {
    button3 = !button3;
    button1 = false; 
    button2 = false;
  }
}


void keyPressed() {
  if (key=='c') {
    fill(2,26,42);
    rect(0,0,width,height);
  }
}



