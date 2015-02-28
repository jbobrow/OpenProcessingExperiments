


 void setup () {

        
size (400,400);
background(255);

smooth();
    
        noFill( );
    
        stroke( 255 );
        
        strokeWeight( 2 );
        
  
    }


    void draw () {


        
        
    

translate(mouseX,mouseY); // figure move with the mouse
fill(0);
ellipse(100, 270, 100, 30);
filter(BLUR,6);

fill( 0);
ellipse( 100, 150, 140, 200);

fill(255);
ellipse( 115, 200, 40, 50);

fill(0);
ellipse( 118, 208, 10,10);


noFill();
bezier(  10, 20,  30, 100,  70, 0, 100, 50 );

bezier(  20, 10, 0 ,80,  70, 0, 100, 50 );
    
fill(255);
triangle(125,228, 135, 228, 130, 240); 
triangle(95,228, 105, 228, 100, 240); 





    }

