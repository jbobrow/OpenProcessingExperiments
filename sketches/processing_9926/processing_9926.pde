
void setup (){

size (800, 800); 
background(255); 
smooth(); 

}


void draw (){
  
 for (int x = 0; x < width; x+= width/4){
   for (int y = 0; y < height; y+= height/4){
     //Hintergrund-Quadrate 
rect (x,y, width/4, height/4); 
}


//Linien 1
for (int k =0; k <= height; k+= height/4) {
pushMatrix(); 
translate (width/4, height/4/2); 
line (0, k, width, k); 
popMatrix(); 
}

//Linien 2
for (int h = 0; h<= height; h+= height/8){
pushMatrix(); 
translate( width/4*2, height/4/4);
line (0, h, width, h); 
popMatrix(); 
}

//Linien 3
for (int h = 0; h<= height; h+= height/16){
pushMatrix(); 
translate( width/4*3, height/4/8);
line (0, h, width, h); 
popMatrix(); 
}




   }
 
 } 
  
  
  
  
  
  


