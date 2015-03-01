
// -- "Multiple Selves By - Riley Co - 2015 - //
  //*All images taken by Riley Co//


PImage img;
int step=20;
void setup() {
  
  size(854, 1280,P2D); //P2D Slightly adds contrast //
   
//---Lines ---// 
  
    
            //-- *** SOURCE CODE *** -"Moving Lines by JEROME HERR" : http://www.openprocessing.org/sketch/179981 -//
   
       
            background(0);  // FOR DARKER LINES //
            stroke(255); 
            strokeWeight(6);
            for (int y=-height; y<height; y+=step) {
             // line(0, y, width, y+width);
            }
         
         
            for (int x=-width; x<width; x+=step) {
              //line(x+frameCount%step, height, x+frameCount%step+width, 0);
              //line(x+frameCount%step, height, width, 0);
              line(x+frameCount%step, height, width, -width);
            }
         
         
            float sz=180;
            strokeWeight(180);
            stroke(20);
            noFill();


//--PHOTOGRAPHY--//

  
 
 
            //----"BACKGROUND IMAGE" GOES HERE" ----//

            
            blendMode(MULTIPLY);
            img = loadImage ("http://imgur.com/JAVg0Fi");
            image(img, 0, 0);
    
 
          
            //----"PROFILE IMAGE 1" GOES HERE"----//
  
            blendMode(SCREEN);
            img = loadImage ("http://i.imgur.com/CDEbHhz.jpg"); 
            image(img, 0, 0);
        
      
      
            //----"BACKGROUND IMAGE 2" GOES HERE"----//
  
            blendMode(SCREEN);
            img = loadImage ("http://imgur.com/JAVg0Fi"); 
            tint(0, 240, 255);  // Tint blue
            image(img, 20, 0); // OFFSET
            
    
    
            //----"PROFILE IMAGE 2" GOES HERE"----//
           
            blendMode(SCREEN);
            img = loadImage ("http://i.imgur.com/CDEbHhz.jpg"); 
            tint(250, 0, 0);  //  Tint Red
            image(img, 20, 20); // OFFSET
          
         
  
          
      
//---"Saves Image"---//   
      save("riley_v2.tif");

      
      
         
          //         EXTRA "BACKGROUND IMAGE2" GOES HERE"    ///
          //         blendMode(SCREEN);
          //         img = loadImage ("montreal.jpg");
          //         image(img, 0, 0);
               
           
 
}

//void draw () { }
  




  


