
void setup (){
  size (400, 400);
  background (0);
}
void draw (){
  noStroke();
  // Si hi ha el ratolí apretat farà uns elipses grans, si no ho està seràn petits
  if (mousePressed){
    ellipse (mouseX, mouseY, 15, 15);
  }
  else{
    ellipse (mouseX, mouseY, 5, 5);
  }
  //Apretar la tecla `r` perqué sigui de color vermell
  if (keyPressed){
    if (key == 'r'){
      fill (#FF0000);
    }
   //Apretar la tecla 'b' perqué torni a ser blanc
   if (key == 'w'){
     fill (#FFFFFF);
   }
   
  //Apretar la tecla 'v' perqué sigui de color verd
  if (key == 'v'){
    fill (#00CC00);
  }
    // Apretar la tecla 'b' perqué sigui de color blau
    if (key == 'b'){
      fill (#0028FF);
    }
    //Apretar la tecla 'g' perqué sigui de color groc
    if (key == 'g'){
      fill (#FEFF00);
    }
     //Apretar la tecla 't' perqué sigui de color taronja
     if (key == 't'){
       fill (#FC8403);
     }
    
    
    
    
    
      
  }
}


