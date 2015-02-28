
int counter;

void setup() {  //setup function called initially, only once
  size(250, 250);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;
}

void draw() {  //draw function loops 
  counter++;
  stroke(random(255),100,255,50);
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    hexa(random(10,40));
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
}

void hexa (float tamanho) {
    
    float metade=tamanho/2;
    // linha da esquerda
    line(mouseX-metade, mouseY-metade, mouseX-metade, mouseY+metade);
    // linha da direita
    line(mouseX+metade, mouseY-metade, mouseX+metade, mouseY+metade);      
    // linha da esquerda-topo
    line(mouseX-metade, mouseY-metade, mouseX, mouseY-tamanho);    
    // linha da direita-topo
    line(mouseX, mouseY-tamanho, mouseX+metade, mouseY-metade);   
    // linha da esquerda-base
    line(mouseX-metade, mouseY+metade, mouseX, mouseY+tamanho);    
    // linha da direita-base
    line(mouseX, mouseY+tamanho, mouseX+metade, mouseY+metade); 
   
   
}

                
                                
