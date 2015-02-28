
int savedTime;


void setup() {
  size(300,300);
  smooth();
  savedTime = millis();
  noStroke();
}



void draw() {
  background(200);
   
  if ( mousePressed ) {
    int elapsed = millis() - savedTime;
    
    // Les trois cercles blancs
    fill(255);
    if ( elapsed > 500 ) {
     ellipse( width/2 , 100 ,30,30);
    }
    if ( elapsed > 1000 ) {
      ellipse( width/2 , 150 ,30,30);
    }
    if ( elapsed > 1500 ) {
      ellipse( width/2 , 50 ,30,30);
    }
    
    // Le cercle rouge
    fill(255, 50 , 50 );
    ellipse( map(elapsed,0,2000,0,width) , 250 , 30 , 30 );
    
    // Relancer l'animation lorsqu'elle dépasse 2 secondes
     if ( elapsed > 2000 ) {
         savedTime = millis();
    }
  }
}

void mousePressed() {
  savedTime = millis();
}
                
