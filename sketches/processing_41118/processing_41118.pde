
void setup(){
  size (400,400);
  smooth();
  noStroke();
}

void draw() {
  
  background(0);//il background serve per fare il refresh e vedere gli effetti
  
  // per disegnare tutti i pallini
  for (int x=20; x < width; x=x+40){
  for (int y=20; y < height; y=y+40){ 
    
    //mouvo col mouse tutto il pattern
    if (mousePressed) { 
    
    for (int i=mouseX; i < width; i=i+40){
    for (int k=mouseY; k < height; k=k+40){ 
    fill(247,27,211,10);
    smooth();
    ellipse (i,k,20,20);
    }
    }
  
    }

    else { }
           
           
      for (int i=20; i < width; i=i+40){
    for (int k=20; k < height;k=k+40){ 
   smooth();
    fill(255);
    ellipse (i,k,20,20);}
    }
    }
 
  }
  }

