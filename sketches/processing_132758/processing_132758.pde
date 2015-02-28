
PFont f;
String message = "1234567890";

void setup() {
 size(400, 300);
 f = createFont("Arial",30,true);
}

void draw() { 
 background(255);
 fill(160,0,0);
 textFont(f);         
 int x = 10;  

 // rect(50,50,50,50);

 if(mousePressed) {
   fill(0,160,0);
  String longMessage = "You clicked at X position " + mouseX;

   text(longMessage,10,170);
   rect(1,220,mouseX,15);

 }

   fill(160,0,0);
 for (int i = 0; i < message.length(); i++) {
   //textSize(random(12,36));
   int tSize = 5 * (i+1); // text size
   textSize (tSize);  
   int tPosition = 25 * (i+1);  //  offset from left side

   text (message.charAt(i),tPosition,50);
 }
 textSize(18);
 text("Size and position increase with loop index",5,75);

 text("Please click somewhere",5,125);

// noLoop();
}

