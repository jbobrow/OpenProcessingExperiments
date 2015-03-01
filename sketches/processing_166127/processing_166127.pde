
PImage webImg;

void setup() {
     size(480, 720);
     
     // String url = "http://actor-images.celebritizer.com/actor/107048/Jack-Nicholson.jpg";
     // Load image from a web server
     webImg = loadImage("Jack-Nicholson.jpg");
     noStroke();
     smooth();
}
   void draw() {
     int count = 0;
     while (count < 10){
     int random = (int)(Math.random() * 10);
     
     int offsetFactor = 40;
     int offsetX = calculateRandomOffsetSquare(offsetFactor) + mouseX;
     int offsetY = calculateRandomOffsetSquare(offsetFactor) + mouseY;
     
     int lineLength = getLineLength();
     
       
     int colr = webImg.get(offsetX, offsetY);
     fill(colr);
     
     int maxDotRadius = 10;
     int dotRadius = getRandomDotRadius(maxDotRadius);
     ellipse(offsetX, offsetY, dotRadius*2, dotRadius*2);
     
     count++;
     }
   }
   
   int getRandomDotRadius(int max){
     return (int)(Math.random() * max);
   }
   
   int getLineLength(){
     return 6;
   }
   
   int calculateRandomOffsetSquare(int factor){
     return ((int)((Math.random() * (factor*2))) - factor) ^ 2;
   }


