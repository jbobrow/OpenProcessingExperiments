
void setup(){
    size(500,500);
    noStroke();
    background(255);
    PFont font;
    font = loadFont("Impact-48.vlw"); 
    textFont(font,97); 
    String s = "STROBE";
    for(int x = 0; x < width; x+=30){
        for (int y = 0; y < height; y+=70){
            float rd= random(255);
            float bl= random(255);
            float gr= random(255);
            fill(rd,bl,gr);
            stroke(4);
            rect(x,y,30,500);
        }
     }
    text(s, 100, 180, 400, 400);
}

void draw(){
   noStroke();
   PFont font;
    font = loadFont("Impact-48.vlw"); 
    textFont(font,97); 
    String s = "STROBE";
  if (mousePressed){
    for(int x = 0; x < width; x+=30){
      for (int y = 0; y < height; y+=70){
          float rd= random(255);
          float bl= random(255);
          float gr= random(255);
          fill(rd,bl,gr);
          stroke(4);
          rect(x,y,30,500);
      }
    }
  }
        text(s, 100, 180, 400, 400);
}

  


