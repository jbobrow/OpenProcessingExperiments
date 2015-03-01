
int value = 0;

void setup(){
 size(800,800);
 background(#CCFFFF);
}

void draw(){
 
 strokeWeight(5);
 println(mouseX + "," + mouseY);

   
   if(mousePressed == true){
     
       line(mouseX, mouseY, pmouseX, pmouseY);
   }
}
void keyPressed(){
  
  //presionamos la techa "j" para que se dibuje una eclipse
  if (key == 'j'  || key == 'j'){
     strokeWeight(2);
     fill(random(0,255),random(0,255),random(0,255),random(0,255)); 
     ellipse(pmouseX, pmouseY, 50, 50); 
  }
  
  //presionamos la tecla "k" para que se dibuje un punto 
  if (key == 'k' || key == 'k'){
    strokeWeight(10);
    fill(random(50,255),random(50,255),random(50,255),random(50,255)); 
    point(mouseX, mouseY);
  }
  
  //presionamos la tecla "t" para que se dibuje un triangulo 
    if (key == 't' || key == 't'){
    strokeWeight(2);
    fill(random(0,255),random(0,255),random(0,255),random(0,255)); 
    triangle(mouseX, mouseY, mouseX-30, mouseY+30, pmouseX+30, pmouseY+30);
  }
  
  //presionamos la tecla "b" para borrar el dibujo
  if(key == 'b' || key == 'b'){
    background(#CCFFFF); 
  }
}


