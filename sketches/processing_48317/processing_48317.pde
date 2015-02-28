
//Interactive eyes

void setup () {
  size (1000, 800);
  smooth ();
 
}

void draw (){
  
  // Eyes shapes
  background (255);
  
  
  
     
  float X = constrain(mouseX, 370, 390);
  float Y = constrain(mouseY, 360, 400);
  float A = constrain(mouseX, 620, 640);
  float B = constrain(mouseY, 360, 400);
   

    fill (255);
    strokeWeight (5);
  ellipse (380, 350, 150, 180);
  strokeWeight (5);
  ellipse (630, 350, 150, 180);

 //Blue Eyes
 fill (13, 160, 244); 
  strokeWeight (3);
  ellipse (380, 380, 80, 100);
   ellipse (635, 380, 80, 100);
   
   
   //Eyes color change from blue to red
   
   if (mousePressed == true)  {
     
  fill (214, 19, 51);
   strokeWeight (3);
  ellipse (380, 380, 80, 100);
   ellipse (635, 380, 80, 100);
   
   } 
  
  //Black Pupils
  fill (0);
  ellipse (X, Y, 30, 40);
    ellipse (A, B, 30, 40);
    
    
// White Pupils
fill (255, 255, 255);
strokeWeight (0);
ellipse (X, Y, 13, 13);
ellipse (A, B, 13, 13); 


}


                
                                
