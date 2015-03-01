
void setup () {
  size (300, 300);
  smooth ();
}

void draw (){
  background (0);
  float d = dist (width/2, height/2, mouseX, mouseY);
   translate (150, 150);
   for (int i = 0; i < 10; i ++){
     for (float b = 0; b <50; b += PI/16){
      stroke (100, 40, 86, i);
       strokeWeight (6);
       rotate (b);
       line (width/2, height/2, d*2, d/52);
     }
     
   }
  
   
       for (int a = 0; a < 10; a ++){
     for (float c = 0; c <50; c += PI/12){
       strokeWeight (6);
       rotate (c);
     
     
     stroke (150, 134, 86, a);
    
   line (width/2, height/2, d*5, d/2);
  
     }

}
     }





