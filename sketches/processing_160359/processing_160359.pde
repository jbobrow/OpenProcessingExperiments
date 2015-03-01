
PFont f;
    String message = "VEM PRA RUA VEM PRA RUA VEM PRA RUA VEM PRA RUA";
    Letter[] letters;
     
    void setup() {
      size(500, 600);
      
      f = createFont("Impact",40,true);
      textFont(f);
       
      
      letters = new Letter[message.length()];
      
      int x = 16;
      for (int i = 0; i < message.length(); i++) {
        letters[i] = new Letter(x,300,message.charAt(i));
        x += textWidth(message.charAt(i));
      }
    }
     
    void draw() {
      background(0);
      for (int i = 0; i < letters.length; i++) {
        
        letters[i].display();
         
       
        if (mousePressed) {
          letters[i].home();
        } else {
          letters[i].shake();
        }
      }
    }
     
    // A class to describe a single Letter
    class Letter {
      char letter;
      // The object knows its original "home" location
      float homex,homey;
      // As well as its current location. The letters love home!
      float x,y;
     
      Letter (float x_, float y_, char letter_) {
        homex = x = x_;
        homey = y = y_;
        letter = letter_;
      }
     
      // Display the letter
      void display() {
        fill(255);
        textAlign(LEFT);
        textSize(random(12,36));
        text(letter,x,y);
      }
     
      // Move the letter randomly
      void shake() {
        x += random(-4,4);
        y += random(-4,4);
      }
     
      // Return the letter home
      void home() {
        x = homex;
        y = homey;
      }
    }
