
boolean dibujando = false; 



void setup(){ 
  PImage arbolitomasmejor; 
  size(600,400); 
  arbolitomasmejor = loadImage("arbolitomasmejor.jpg"); 
  image(arbolitomasmejor,0,0); 
  }
  
void draw(){ 

    if (dibujando){ 
   
    smooth();
    noStroke(); 
    //Verano
    if (key == 'v'){ 
      fill(35,193,44,100); //Verde
    }
    if (key == 'b'){ 
      fill(250,250,0,100); //Amarillo
    }
    //Primavera      
    if (key == 'p'){ 
      fill(250,101,121,110); //Rosado      
    } 
    if (key == 'o'){ 
      fill(245,175,185,100); //Rosado      
    } 
    //Otoño
    if (key == 'a'){
      fill(98,48,7,100); //Café oscuro
    } 
    if (key == 's'){
      fill(227,151,89,100); //Café claro awww

    } 
    ellipse(mouseX - random(-10,10),mouseY - random(-10,10),10,10); 
  }; 

}; 

void mousePressed(){ 
  dibujando = !dibujando; 
}; 

void keyPressed(){ //para borrar si ud. se ha equivocado

  if(key == ' '){ 
    setup(); 
  }
}










