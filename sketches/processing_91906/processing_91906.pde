
int starAmt = int(random(3, 10));
float[] xPos = new float[starAmt];
float[] yPos = new float[starAmt];
String[] bieberLyrics = new String[11];
int lyricToShow = int(random(10));
PFont f = createFont("Impact", random(20, 50));
float textXPos = random(0, 50);
float textYPos = random(100, 900);
 void setup() {
       size(1000, 1000);
       stroke(255, 255, 0);
       background(0, 0, 0);
       for (int i = 0; i < xPos.length; i++){
         xPos[i] = random(1500);
         yPos[i] = random(1500);
        }
       bieberLyrics[0] = "When I was 13, I had my first love";
       bieberLyrics[1] = "There was nobody that compared to my baby";
       bieberLyrics[2] = "And nobody came between us who could ever come above";
       bieberLyrics[3] = "She had me going crazy, oh I was starstruck";
       bieberLyrics[4] = "She woke me up daily, don't need no Starbucks";
       bieberLyrics[5] = "She made my heart pound";
       bieberLyrics[6] = "I skip a beat when I see her in the street";
       bieberLyrics[7] = "And at school on the playground";
       bieberLyrics[8] = "But I really wanna see her on a weekend";
       bieberLyrics[9] = "She know she got me dazin' 'cause she was so amazin'";
       bieberLyrics[10] = "And now my heart is breakin' but I just keep on sayin'";
        
     } 

     void draw() {
       fill(255, 0, 0); 
       textFont(f);
       text(bieberLyrics[lyricToShow], textXPos, textYPos);
       for (int i = 0; i < xPos.length; i++){
         star(xPos[i], yPos[i]); 
       }
     }
     
     void star(float xDim, float yDim) { 
       line(xDim / 2, yDim / 2, random(xDim), random(yDim)); 
     }


