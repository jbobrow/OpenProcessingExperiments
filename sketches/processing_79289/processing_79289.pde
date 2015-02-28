
PImage bild;
 
float gap = 14.0;
  
void setup (){
  size (700,500);
  bild = loadImage("Bild.jpg");
  smooth();
}
  
  
  
void draw (){
    
  background(255);
  strokeWeight(0.5);
  stroke(155,160,20);
   
   
   
   
  gap = 10+mouseY/1;
    
    
    
  for (int i = 0; i< width/gap; i++){
    for (int j = 0; j< width/gap; j++){
    fill (bild.get(int(gap*i),int(gap*j)));
     rect (gap*i, gap*j,gap,gap);

    rect (gap*i, gap*j,gap,gap);
    
  }
  }
}



