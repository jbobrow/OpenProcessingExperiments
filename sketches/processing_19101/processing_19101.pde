
int savedTime;
int interval;

void setup() {
  
  size(300,300);
  smooth();
  savedTime = millis();
  interval = 1000;
 
}
 
void draw() {
 
    int elapsed = millis() - savedTime;
    
    if ( elapsed < 500 ) {
       background(0);
    } else {
      background(255);
    }
     
    // Redémarrer le compteur chaque seconde ( interval = 1000 )
     if ( elapsed > interval ) {
         savedTime = savedTime + interval;
    }
  
}
                
