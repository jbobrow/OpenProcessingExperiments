
//elizabeth Ibarra
//homework 3
//processing.org






int change = 10;


void setup(){
 size(600,600);
 background(0);
 smooth();
   stroke(-10);
  noCursor();
   for(int i = 0; i <width; i+=15){
    for(int j = 0 ; j < height ; j+=15){
   stroke(255,j,i,20);

   noFill();
   ellipse(300,300,i,i);
      ellipse(200,200,i,j);
         ellipse(100,100,i,j);
           ellipse(400,400,i,j);
         ellipse(500,500,i,j);
         ellipse(200,500,i,j);
         ellipse(100,400,i,j);
            ellipse(500,200,i,j);
         ellipse(400,100,i,j);
 
}
   }
}


void draw(){
 for (int i = 0 + 30; i < width; i += change){
    for (int j = 0 + 30; j < height; j += change){
      if (mouseX > i && mouseX < i + change && mouseY > j && mouseY
      < j + change){
        fill (mouseX+i,mouseY+j,20,20);
  
 
  
       noFill();
       stroke(255,255,i,20);
   ellipse(300,300,i,i);
      ellipse(200,200,i,j);
         ellipse(100,100,i,j);
           ellipse(400,400,i,j);
         ellipse(500,500,i,j);
         ellipse(200,500,i,j);
         ellipse(100,400,i,j);
            ellipse(500,200,i,j);
         ellipse(400,100,i,j);
     
      
      }
    }
  }
}



