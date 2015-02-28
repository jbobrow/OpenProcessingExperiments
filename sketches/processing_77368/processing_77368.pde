
void setup () {
 size ( 400,400); 
 smooth ();
}

void draw () {
  background( 0);
  
  if ( mouseX < 200 & mouseY < 200) { // carré majenta
    
    fill (255,0,255);
    rect (0,0,200,200);
    
    fill(255);
    ellipse (50,50,50,50);
    ellipse (150,50,50,50);
    
    fill (0);
    ellipse (50,50,10,10);
    ellipse (150,50,10,10);
    
    text ("3", 100,150);
    textSize (50);
   
    }
    
    else if ( mouseX > 200 && mouseY <200) { //carré vert
      fill ( 0,255,0);
      rect(200,0,200,200);
      
      
        fill(255);
    ellipse (250,50,50,50);
    ellipse (350,50,50,50);
    
    fill (0);
    ellipse (230,50,10,10);
    ellipse (330,50,10,10);
    
    text ("O", 280,160);
    textSize (50);
    }
    
  else if ( mouseX > 200 && mouseY >200) { //carré cyan
      fill ( 0,255,255);
      rect(200,200,200,200);
      
       fill(255);
    ellipse (250,250,50,30);
    ellipse (250,248,50,30);
     ellipse (249,247,50,30);
    
    ellipse (350,250,50,30);
    ellipse (350,248,50,30);
    ellipse (349,247,50,30);
    
    fill (0);
    ellipse (230,50,10,10);
    ellipse (330,50,10,10);
    
    text ("¬", 280,340);
    textSize (60);
      
    }
    
     else if ( mouseX < 200 && mouseY >200) { //carré jaune
      fill ( 255,255,0);
      rect(0,200,200,200);
      
      fill( 0);
      ellipse (50,250,50,50);
    ellipse (150,250,50,50);
    
    fill (255);
    ellipse (50,250,10,10);
    ellipse (150,250,10,10);
    
    fill(0);
    text ("w", 80,340);
    textSize (70);
      
    }
   
    
    else if ( mouseX ==200 & mouseY<200) {
      background ( 255,0,0 );
    }
    
     else if ( mouseX ==200 & mouseY>200) {
      background ( 150,0,150 );
    }
    
     else if ( mouseX <200 & mouseY==200) {
      background ( 150,150,0 );
    }
     else if ( mouseX >200 & mouseY==200) {
      background ( 0,150,150 );
    }
    
    else {
     background(128,128,128);
    }
    
}

