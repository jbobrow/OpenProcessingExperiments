


void setup (){
 size (600,600);
 background (0);
 smooth ();
  

}

void draw (){
  
   
    pushMatrix ();
    for (int i = 0; i<= 600; i= i+10){
    fill (155, 0, 0, 15);
    stroke (#43EBFF);
    rect (0, i , i, 400); 
   }
   popMatrix();
   
   
   pushMatrix ();
  
  for (int i= 0; i<= 300; i= i +20){
  stroke (67, 255, 194, 255);
  strokeWeight (0.8);
  //line (0, i, 200, 0);
  }
  popMatrix();
 
 
  pushMatrix ();
  
  for (int i= 0; i<= 300; i= i +20){
  stroke (#43FFD8);
  strokeWeight (0.5);
  
  line (0, i, i, 600); 
  line (0, i, i, 800);
  stroke (#52FF43);
  strokeWeight (0.2);
  line (600, i, i, -10);
  line (800, i, i, -20);
    
 
}
popMatrix();
}



