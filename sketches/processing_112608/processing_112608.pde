
// Click on the window to give it focus
      // and press the 'B' or 'A' key
      
      int value = #D30B0B;
      void setup(){
        size(200,200);
    background(0);
  }
      void draw() {
        
        
       fill(value);
       rect(75,75,50,50);
        if(keyPressed) {
          if (key == 'p' || key == 'P') {
            
            delay(5000);
            value=#65ED0C;
   }
        } else  if (key == 's' || key == 'S'){
value=#D30B0B; }
        
      }


