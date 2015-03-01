
int x, y;
int strokeD = 1;
boolean parar = true;
color colorsFigures = color(0,0,0);
void setup (){
  size (750, 600);
  background (255);
}
 
void draw (){
  //color aleatori
  colorsFigures = color(random(255),random(255),random(255)); 
  
  
  if(!parar){
        
          //per dibuixar amb quadrats
          if (key == 'q'){
          noStroke();
         fill (colorsFigures);
         rect(mouseX, mouseY, strokeD, strokeD);
  }
          //per dibuixar amb cercles  
          if (key =='c'){
         noStroke();
         fill(colorsFigures);
         ellipse(mouseX, mouseY, strokeD, strokeD);
   } 
          //per borrar-ho tot
          if (key == 'b'){
           background(255);   
  }
          //per dibuixar amb linies
          if(key == 'l'){
           stroke(colorsFigures);
           strokeWeight(strokeD);
           line(mouseX, mouseY, pmouseX,pmouseY);
   }
 }  
}
void mousePressed(){
  parar = false;
}

void mouseReleased(){
  parar = true;
}

//Per a que quan apretis "+" o "-" es fasi mes gran o mes petita la figura
void keyPressed(){
  if(key == '+'){
    strokeD = strokeD + 1;
  }
  else if (key == '-'){
    strokeD = strokeD - 1;
  }
}


