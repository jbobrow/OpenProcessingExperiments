
PFont myFont ;
public void setup()
{
    size(320,480) ;
  //  myFont = loadFont("Eureka-90.vlw") ;
   //textFont(myFont, 32) ;
 
}

public void draw()
{
    
   int s = second();
   int m = minute();
   int h = hour();
   
   
    for (int i = 0;i<s+1;i++){
      
    background(0) ;
   
    textSize(100);
    //while(i==h){ text(h, m*5-20*2, h*8);}
    text(h,4,h*8*60/24);
     
 //while(i>m){ text(h, m*5-20*2, m);}
    text(m,100,m*8);
    
    text(i,196,i*8);
    
    }
    
    textSize(10); 
    text("Level Clock", 10, 20) ;
    
    
    
}
