
float a=0;
float b=0;
color rand=color(0,0,0);
int x=20;
int y=20;

void setup(){
 size(300,300); 
}

void cuadrado(){    //funcion cuadrado cuando hay profesor.
  for(x=20;x<=260;x=x+30){     //bucle para generar todos los alumnos
    for(y=20;y<=200;y=y+30){
      rect(x+a,y+b,20,20);
    }
  }
  a=0;
  rand=color(255);
  text("Profesor",220,280);
  fill(0);
  noStroke();
  ellipse(mouseX,mouseY,10,10);
}

void circulo(){               //funcion cuadrado cuando no hay profesor.
  for(x=20;x<=260;x=x+30){
    for(y=20;y<=200;y=y+30){
      ellipse(x+a+10,y+b+10,20,20);
    }
  }
  a=random(-4,4);
  b=random(-4,4);
  rand=color(random(255),random(255),random(255));
  fill(0);
  text("No Profesor",210,280);
}

void draw(){             
  background(#C0C0C0);
  stroke(#C2B078);
  fill(#C2B078);
  rect(10,10,280,280);
  fill(255);
  rect(120,240,60,30);
  
  
  fill(rand);
  stroke(rand);
  
 if (mouseX<=10||mouseY<=10||mouseX>=290||mouseY>=290){ //condicion de si hay profesor o no.
   circulo();
   
 }
 else{
   cuadrado();
 }
}


