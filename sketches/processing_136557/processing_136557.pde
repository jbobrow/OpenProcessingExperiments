
/* @pjs preload="Riddler1.jpg, Riddler3.jpg, Riddler4.jpg, Riddler6.jpg"; */

int myState = 0 ;
PImage Riddler1 ;
PImage Riddler3 ;
PImage Riddler4 ;
PImage Riddler6 ;

void setup () {
  size(500, 500) ;
  Riddler1 = loadImage("Riddler1.jpg") ;
  Riddler3 = loadImage("Riddler3.jpg") ;
  Riddler4 = loadImage("Riddler4.jpg") ;
  Riddler6 = loadImage("Riddler6.jpg") ;
  
}

void draw () {
  
  background(100) ;
  
  switch(myState) {
    
    case 0:
    fill(255) ;
    text("I suggest you Open the door.", 100, 100) ;
    fill(#814208) ; //door
    stroke(0) ;
    rect(180, 230, 170, 270) ;
    fill(#F7EC11) ;
    ellipse(340, 375, 15, 15) ;
    break ;
    
    case 1:
    background(#FFFFFF) ;
    image(Riddler1, 20, 50) ;
    fill(0) ;
    text("What do you ask when someone asks a question that seems to carry no premise?", 10, 25) ;
    break ;
    
    case 2:
    background(0) ;
    image(Riddler3, 50, 0) ;
    fill(#FFFFFF) ;
    text("Very good!", 20, 260) ;
    text("Now...", 80, 300) ;
    text("...riddle me this:", 120, 320) ;
    text("Who is currently in control of this rather prosaic state machine?", 100, 340) ;
    text("I'll give you a hint: It isn't me. It is you, but it isn't 'you'.", 60, 400) ;
    break ;

    case 3:
    background(0) ;
    image(Riddler4, 0, 0) ;
    fill(#FFFFFF) ;
    text("WELL AREN'T YOU PERSISTENT?!", 240, 140) ;
    text("I swear I'll have to catch some of these", 240, 240) ;
    text("if I want to have enough energy for", 220, 290) ;
    text("my suaree with Gothams finest!", 200, 330) ;
    break ;
    
    case 4:
    background(0) ;
    image(Riddler6, 10, 232) ;
    fill(#FFFFFF) ;
    text("Don't you just LOVE a photo finish?", 150, 150) ;
    break;
  }
}

void keyPressed() {
  
  switch(key) {
    case 'o' :
    myState = 1 ;
    break ;
    
    case 'y' :
    myState = 2 ;
    break ;
    
    case 'i' :
    myState = 3 ;
    break ;
    
    case 'z' :
    myState = 4 ;
    break ;
    
    case 'n' :
    myState = 0 ;
    break ;
    
  
  }
}


