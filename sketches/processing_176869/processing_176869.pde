
int myState = 0 ;
PImage body ; 
PImage neck ;
PImage head ;
PImage knobs ; 
PImage guitar ;

void setup() {
  size(500,500) ;
  guitar = loadImage("guitar_splash.jpg") ;
  body = loadImage("acoustic_body.jpg") ;
  neck = loadImage("guitar_neck.jpg") ;
  head = loadImage("headstock.jpg") ;
  knobs = loadImage("knobs.jpg") ;

}

void draw() { 

  switch(myState) {
    case 0: 
    background(0) ;
    imageMode(CENTER) ;
    image(guitar, 250, 250, width/1.1, height/1.9) ;
    textSize(40) ;
    textAlign(CENTER);
    text("Parts of the Guitar", 250, 70) ;
    break ; 
    
    case 1: 
    background(0) ;
    imageMode(CENTER) ;
    image(body, 250, 200, width/1.5, height/2) ;
    textSize(30) ;
    text("The Body", 250, 40) ;
    textSize(20) ;
    text("This is what resonates when", 250, 375) ;
    text("notes are played to produce sound.", 250, 400) ;
    break ;
    
    case 2:
    background(0) ;
    imageMode(CENTER) ;
    image(head, 250, 200, width/1.5, height/2) ;
    textSize(30) ;
    text("Headstock and Tuners", 250, 40) ;
    textSize(20) ;
    text("The strings are wound around the tuners", 250, 375) ;
    text("and the tuners are used to keep the guitar in tune.", 250, 400) ;
    break ; 
    
    case 3: 
    background(0) ;
    imageMode(CENTER) ;
    image(neck, 250, 250) ;
    textSize(30) ;
    text("Neck and Frets", 250, 50) ;
    textSize(20) ;
    text("This is where notes are fretted.", 250, 425) ;
    text("Different frets makes different notes!", 250, 450) ;
    break;
    
    case 4: 
    background(0) ;
    imageMode(CENTER) ;
    image(knobs, 250, 250, width/1.7, height/2) ;
    textSize(30) ;
    text("Knobs and Switches", 250, 70) ;
    textSize(20) ;
    text("The switches change pickup configurations", 250, 425) ;
    text("and the knobs can adjust your guitar's tone.", 250, 450) ;
    break;
    
  }
}

void mousePressed() {
 myState = (myState +1) ; 
   if (myState > 5) {
    myState = 0 ;
   }
}


