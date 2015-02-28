
float s = 0;

void setup()

{  size (800,800);
 smooth();
  fill(0);  // Black
  
  textFont(createFont("SansSerif",20));
  textAlign(CENTER); }
void draw ()

{ noStroke(); 
  if (key == 'b' || key == 'B') if (s >2 && s < 3){ ellipse (random(0,800),random(0,800),100,100);} 
    if (key == 'n' || key == 'n') if (s >1 && s < 2){ rect (random(0,800),random(0,800),100,100);}
  
   s = random (1,3);
    {
      frameRate(100);
  // Draw text to screen using the previously set font.
  fill(#ffffff);
  noLoop();
     text("Welcome to the Game b or n create your art t to stop click for surpirise", width/2, height/2);  
   
   
 loop();  
  
//{ //ellipse (random(0,800),random(0,800),100,100);}
//{ //rect (random(0,800),random(0,800),100,100);}
 if (mousePressed) fill(random(0,255),random(0,255),random(0,255),random(50,100)); else fill(random(0,255),random(0,255),random(0,255));
}  
}


