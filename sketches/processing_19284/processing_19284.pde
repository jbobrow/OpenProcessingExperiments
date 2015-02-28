
 	



 PFont font;
 int quartz = 0;

  void setup() {
            size(360,240, P2D);
            font = loadFont("UmbraStd-48.vlw"); 
            textFont(font, 70); 
            colorMode(RGB, 255);

            frameRate(30);
          
      
          }
      
       
   void draw() {
   
               int myHour = hour();
               int myMinute = minute();
               int mySecond = second();
             
           
               if (quartz != mySecond){
                background(0);
                
    
            String date = nf(myHour,2)+":"+nf(myMinute,2)+":"+nf(mySecond,2);
             
            fill(183,255,231);
            text(date,45,90);
                    filter(BLUR,5);
                    
            fill(4,209,84);
            text(date,45,85);

                    filter(DILATE);
                    filter(BLUR);
        
                   }
                 }
               
        
   

