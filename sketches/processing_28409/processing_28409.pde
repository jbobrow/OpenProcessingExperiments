
void setup (){
  size (400, 310);
}

void draw (){
  
  background (255);


if (mousePressed) {
 
  for (int i=0; i <= width; i=i+30){
    fill (0, 0, 0, 50);
      rect (i, 0, 10, height);
      
 
  }
  
}else{
     noStroke ();   
  
    for (int i=0; i <= width; i=i+30){
      fill (0);
      rect (i, 0, 10, height);
      
 
  }
 
  for (int i=0; i <= width; i=i+30){
     
      for (int j=0; j <= 100; j=j+10){
      fill (0, 0, 0, j);
      rect (0, i, width, 10);
      } 
  }
}

}



