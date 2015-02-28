
//autor: Toni Cogolludo
// escala masiva


void setup() {
  size(500,500);
}

void draw() {
  background(255);
  rellenarcuadrados(0,0,width,height);
  if (mousePressed){
    linea();
  }
  else{
    cuadradocirculos();
  }
}

void rellenarcuadrados(int numero1, int numero2,int delimitarx,int delimitary){
  for(int i=numero1;i<= delimitarx;i+=10){
   for(int j=numero2;j <= delimitary;j+=10){
     fill(random(100,255),random(100,255),random(100,255)); 
     ellipse(i,j,10,10);
   }  
  }
}
void cuadradocirculos(){
   for (int i = mouseX-20; i < mouseX+20;i+=40){
    for (int j = mouseY-20;j < mouseY+20;j+=40){
        fill(0);
        ellipse(pmouseX+random(-30, 30), j, 10, 10);
        ellipse(i, pmouseY+random(-30, 30), 10, 10);
    }
  }
  for (int i = mouseX+20; i < mouseX+40;i+=40){
    for (int j = mouseY+20;j > mouseY-20;j-=40){
      fill(0);
        ellipse(pmouseX+random(-30, 30), j, 10, 10);
        ellipse(i, pmouseY+random(-30, 30), 10, 10);
    }
  }
}
  
void linea(){
  for (int i=5; i<height; i+=10){
    for (int j=5; j<width; j+=10){
      ellipse(mouseX+random(-20, 20), i, 10, 10);
      ellipse(j, mouseY+random(-20, 20), 10, 10);
    }
  }
  rellenarcuadrados(mouseX-25,mouseY-25,mouseX+25,mouseY+25);
}


