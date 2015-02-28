
PFont myFont;


String theText = "";
String theBackupText = "";

int x = 50;
int y = 100;
int dx = 2;
int dy = 2;


void setup() {
 
  // 
  size(800, 600);
  smooth();
  background(255);
  
  myFont = createFont("Courier", 24);
  textFont(myFont);

  noStroke();
  fill(127);
  text("write text for visuals …", 30, 50);
  
}


void draw() {
  
  noStroke();
  fill(255);
  rect(0,550,800,70);

  fill(127);
  // Textstring, der eingegeben wurde ausgeben in der Konsole
  text(theBackupText, 30-(theBackupText.length()*10), 570);
  
  fill(255);
  rect(0,550,20,70);
  
  fill(255);
  rect(780,550,20,70);
  
}


void keyPressed() {
  // testen ob shift gedrückt wurde
  // ansonsten wird das gedrückte zeichen an die vorhandene Zeichenkette angefügt
  if((int)key != 65535) {
    theText += key;
    // Welchen Zahlenwert hat das zeichen?
    println("Wert des Zeichens " + key + " ist " + int(key));
    // Textstring, der eingegeben wurde ausgeben in der Konsole
    println(theBackupText + "\r\n");
  }
  
  theBackupText = theBackupText + key;
  
  for (int i = 0; i<theText.length(); i++) {
   
    char letter = theText.charAt(i);
    
    if(letter == ' ') {

       x = x + 50;
       
       if(x == 800) {
        
         y = y + 50;
         x = 50;
      
        }
       
        theText = "";
        dx = 2;
        dy = 2;
    
    } else {
    
      // Ellipse mit steigendem Durchmesser zeichnen
      noStroke();
      fill(0, 5);
      ellipse(x, y, dx, dy);
      
      if(dx <= 46) {
        dx = dx + 2;
        dy = dy + 2;
      }
      
    }
  }
}

