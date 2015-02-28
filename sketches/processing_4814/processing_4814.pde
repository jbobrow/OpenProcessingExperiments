
//Yoni (chapters 3-4)

PFont fontA;

void setup () {
  size (400, 400); 
  smooth (); 
  fontA = loadFont("Ziggurat-HTF-Black-32.vlw");

 
}

void draw () {
  background (250,245,200);

  stroke (10); 
  fill (70, 0, 1,30); 
  rectMode (CENTER); 
  ellipse (mouseX-10, mouseX+10,  pmouseY-mouseX, mouseY-pmouseX); 
   
 if (mousePressed == false) {
    fill(0);
    textFont(fontA, 26);  
text ("Klick Me",60, mouseX );
  } else  {
    fill (0); 
    fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
  textFont(fontA, 26);  
      text ("try again",60, mouseX );
   
  }
//fill (0); 

}
  /*  fill (0); 
textFont(fontA, 26);  
text ("Klick Me",60, mouseX );  
}
else {
fill (0); 
fontA = loadFont("Ziggurat-HTF-Black-32.vlw");
  textFont(fontA, 26);  
      text ("try again",60, mouseX );  
    }*/
   
    

 
  
   







