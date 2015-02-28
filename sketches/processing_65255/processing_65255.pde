
float geschw;

void setup () {
 //größe
 size (600, 600);
  smooth();
  noCursor();
 
}
 void draw() {
   noStroke();
    fill(255, 255 ,0, 3 );  
    rect(0, 0, width, height);
    
//rote Augen beim drücken

     if(mousePressed){
         background(150, 100,5, 3);
      noStroke();
          //"kopf"
       fill (0,190,0);
       ellipse(mouseX, mouseY+50, mouseX+150, mouseY+100);
         fill (0);
       ellipse(mouseX, mouseY+45, mouseX+100, mouseY+100);
      fill (0,255,55);
       ellipse(mouseX, mouseY+40, mouseX+100, mouseY+100);
        fill (0,190,0);
       ellipse(mouseX, mouseY, mouseX+100, mouseY+100);
       
       // Auge links weiß
        fill (255);
        ellipse (mouseX-100, mouseY,  mouseY+20,mouseY);
        // Auge links ring rot
        fill (255,0,40);
        ellipse (mouseX-100, mouseY, mouseY-50,mouseY);
        // Auge links ring innen rötlich
       fill (255,150,150);
        ellipse (mouseX-100, mouseY,   mouseY-100,mouseY);
        //links  Iris
        fill (0);
        ellipse (mouseX-100, mouseY,  geschw*5+15,geschw*5+15);
        geschw = abs(pmouseX -mouseX);   
      
      
      
        fill (255);
        ellipse (mouseX+100, mouseY,  mouseY+20,mouseY);
        
        fill (255,0,40);
        ellipse (mouseX+100, mouseY, mouseY-50,mouseY);
        
         fill (255,150,150);
        ellipse (mouseX+100, mouseY,   mouseY-100,mouseY);
        
        fill (0);
        ellipse (mouseX+100, mouseY,  geschw*5+15,geschw*5+15);
        geschw = abs(pmouseX -mouseX); 
        
// grüne Augen beim loslassen        
    }
   else{
        
       background(150, 100,5, 3);
      noStroke();
        
        //"kopf"
       fill (0,190,0);
       ellipse(mouseX, mouseY+50, mouseX+150, mouseY+100);
         fill (0);
       ellipse(mouseX, mouseY+45, mouseX+100, mouseY+100);
      fill (0,255,55);
       ellipse(mouseX, mouseY+40, mouseX+100, mouseY+100);
        fill (0,190,0);
       ellipse(mouseX, mouseY, mouseX+100, mouseY+100);
       
        fill (255);
        ellipse (mouseX-100, mouseY,  mouseY+20,mouseY);
        //grün
        fill (100,190,0);
        ellipse (mouseX-100, mouseY, mouseY-50,mouseY);
        //grün
        fill (0,190,55);
        ellipse (mouseX-100, mouseY,   mouseY-100,mouseY);
        
        fill (0);
        ellipse (mouseX-100, mouseY,  geschw*5+15,geschw*5+15);
        geschw = abs(pmouseX -mouseX);   
      
      
      
        fill (255);
        ellipse (mouseX+100, mouseY,  mouseY+20,mouseY);
        //blau
        fill (100,190,0);
        ellipse (mouseX+100, mouseY, mouseY-50,mouseY);
        //blau
        fill (0,190,55);
        ellipse (mouseX+100, mouseY,   mouseY-100,mouseY);
        
        fill (0);
        ellipse (mouseX+100, mouseY,  geschw*5+15,geschw*5+15);
        geschw = abs(pmouseX -mouseX); 

   }
      }
