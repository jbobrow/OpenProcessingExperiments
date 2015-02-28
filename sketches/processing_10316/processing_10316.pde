
 
    void setup(){
        size(250,250);
        noStroke();
        rectMode(CENTER); 
  }
    void draw () {
   background(0);                  //default
         if(key == '1'){              // change background color
        background (255); }
         if(key == '2'){
        background (127); }
         if(key == '3'){
           colorMode(RGB);
        background (255,0,0); }
        if(key == '4'){
           colorMode(RGB);
        background (0,255,0); }
        if(key == '5'){
           colorMode(RGB);
        background (0,0,255); }
        if(key == '6'){
           colorMode(RGB);
        background (255,255,0); }
        if(key == '7'){
           colorMode(RGB);
        background (0,255,255); }
        if(key == '8'){
           colorMode(RGB);
        background (255,0,255); }
         else {                
    } 
          
        colorMode(HSB);
        fill(mouseX,mouseY, 255, mouseX-50);    //move mouse to change transparency, HSB color
        float x = 0;
        float y = 0;
        
        while(x < 250 ){
          
        rect( width/2,   height/2+y,  x,y );
        rect( width/2,   height/2-y,  x,y );
        rect( width/2+x, height/2,    x,y );
        rect( width/2-x, height/2,    x,y );
        
         x = x + 15;                          // change size of rectangles
         y = y + 15;
        }
        }
 
    boolean onOff = true;       //stop / start
    void mousePressed ()
    {
        if ( onOff )
        {
           noLoop();
           onOff = false;
        }
        else
        {
           loop();
           redraw();
           onOff = true;
        }
    }

