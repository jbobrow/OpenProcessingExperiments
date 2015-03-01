
int linea = 0;
int linea2 = 0;
int rosa = (#D64E66);
int gruixlinia = 3;


void setup (){
     size (700, 450); 
     background(#096156);
     //bordes
     fill(#8F570F);
     stroke(#8F570F);
     rect(0, 0, 700, 20); 
     rect(0, 0, 20, 450);
     rect(20, 430, 699, 450);
     rect(680, 0, 700, 450);
}


void draw(){
     println (mouseX + "," + mouseY);
    if(key == 'b'&& 24<mouseX && mouseX<676 && 22<mouseY && mouseY<675){
           stroke (255, 255, 255);
           line (mouseX, mouseY, pmouseX, pmouseY); 
         }
        //Per esborrar
        if (keyPressed){
         if (key == 'f')
         background(#096156);
         //bordes
         fill(#8F570F);
         stroke(#8F570F);
         rect(0, 0, 700, 20); 
         rect(0, 0, 20, 450);
         rect(20, 430, 699, 450);
         rect(680, 0, 700, 450);
        }
         //Pintar color vermell
         if(key == 'v'&& 24<mouseX && mouseX<676 && 22<mouseY && mouseY<675){
           stroke (200, 0, 0);
           line (mouseX, mouseY, pmouseX, pmouseY); 
         }
         //Pintar de blau
         if(key == 'm'&& 24<mouseX && mouseX<676 && 22<mouseY && mouseY<675){
           stroke (24, 64, 226);
           line (mouseX, mouseY, pmouseX, pmouseY); 
         }
         //Pintar color groc
         if(key == 'g'&& 24<mouseX && mouseX<676 && 22<mouseY && mouseY<675){
           stroke (178, 255, 102);
           line (mouseX, mouseY, pmouseX, pmouseY); 
         }
         if (mousePressed) {
             strokeWeight(gruixlinia);
             line (mouseX, mouseY, pmouseX, pmouseY);  
             linea = mouseX;
             linea2 = mouseY;
            }
            //fer cercles
          else if(key=='c'&& 24<mouseX && mouseX<676 && 22<mouseY && mouseY<675) {
                 stroke(random(255), random(80), random(16));
                 fill(random(255), random(80), random(16));  
                 ellipse(mouseX,mouseY,20,20);
           }
           //fer quadrats
           if(key=='q' && 26<mouseX && mouseX<676 && 22<mouseY && mouseY<675){
             stroke(random(255), random(26), random(100));
             fill(random(100), random(100), random(150)); 
             rect(mouseX,mouseY,20,20); 
           }
           //fer triangles
           if (key == 't'){
             stroke(random(120), random(26), random(100));
             fill (random(255),random(100),random(200));
             triangle (mouseX, mouseY, mouseX+45, mouseY, mouseX+20,mouseY+45);
           }

}


 void keyPressed()   {
   if (key == '+') {
    gruixlinia = gruixlinia +3;
   }
   if (key == '-') {
    gruixlinia = gruixlinia -3;    
   }
 }



