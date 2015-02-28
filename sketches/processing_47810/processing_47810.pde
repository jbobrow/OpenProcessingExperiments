
PImage bild;
 
float gap = 1.0;
  
void setup (){
  size (510,390);
  bild = loadImage("ichbaby.jpg");
  smooth();
}
  
  
  
void draw (){
  if (mousePressed == true) {
    
    for (int i = 0; i< width/gap; i++){
    for (int j = 0; j< width/gap; j++){
 
fill (bild.get(int(gap*4),int(gap*20)));
ellipse (gap*i,gap*j,gap,gap);
 
    }
    }
  }
  
  
  if (mousePressed == false) {
    
  background(0,100,255);
  strokeWeight(mouseX/30);
  stroke(0,mouseX,mouseY);
   
  gap = 5+mouseX/5;
    
  for (int i = 0; i< width/gap; i++){
    for (int j = 0; j< width/gap; j++){
    fill (bild.get(int(gap*i),int(gap*j)));
    rect (gap*i, gap*j,gap,gap);
    ellipse(gap*i,gap*j,gap/2,gap/2);
    
    }
    
    
  }
  }
}


