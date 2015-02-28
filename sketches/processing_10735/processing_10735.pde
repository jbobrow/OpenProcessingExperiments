

class MyMonster  
{  
    float xp, yp;  
    float w, h; 
    
    boolean isOver;  
    boolean isPressed; 
    boolean must_be_loaded, is_loaded; 


    void init ()  
    {  
       noStroke();  
       smooth();  
        
       xp = 30;
       yp = 30;

       w = 300;  
       h = 150;

    }  

    void drawMe ()  
    {

       if ( isOver )
       {
           if ( isPressed )
           {
             filter(INVERT);
             noTint();
             
             if (must_be_loaded)
             {
               must_be_loaded = false;
               is_loaded = true;
 
               //filter(BLUR,3);
               filter(INVERT);
               
               loadPixels();
             }
               
           }
           else
           {
               if (is_loaded)
               {
               
               tint(random(255), 200, 255);
               updatePixels(); 
               //background (0);
               fill(0,180);
               rect(0,0,width,height);
               } 
             must_be_loaded = true;
           }
       }

PImage img;
img = loadImage("monster.gif");
image(img, xp, yp);

    }  

    void testMouseOver (float mx, float my)  
    {  
      isOver = (mx > xp) && (mx < xp+w) && (my > yp) && (my < yp+h);  
    }  

    void testMousePressed ( float mx, float my )  
    {  
      testMouseOver( mx, my);  
      isPressed = isOver;  
    }  

    void moveIfPressed ( float xd, float yd )  
    {  
      if ( isPressed )  
      {  
        xp += xd;  
        yp += yd;  
      }  
    }  

    void released ()  
    {  
      isPressed = false;  
    }  
}  

   

MyMonster mym;     

   void setup()  
   {  
     size (700, 500);
     background (220);
     smooth ();
     colorMode (HSB);

     mym = new MyMonster();  
     mym.init();  
   }  

   void draw ()  
   {  
     mym.drawMe();    
   }  

   void mouseMoved ()  
   {  
     mym.testMouseOver( mouseX, mouseY );  
   }  

   void mousePressed ()  
   {  
     mym.testMousePressed( mouseX, mouseY );     
   }  

   void mouseDragged ()  
   {  
     mym.moveIfPressed( mouseX-pmouseX, mouseY-pmouseY );  
   }  

   void mouseReleased ()  
   {  
     mym.released();  
   } 


