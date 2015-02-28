
/*@pjs font = "bonzai.ttf" ; */
int myState = 0;
PImage heaven ;
PImage earth ;
PImage snow1 ;
PImage snow ;
PFont haiku ;
int myCtr = 3*60 ;



void setup() {
  size(500,500) ;
  frameRate(60);
  haiku = createFont("bonzai.ttf", 200);
  heaven = loadImage("sky.jpg");
  earth = loadImage("king-edwards-snow1.jpg");
  snow = loadImage("snow.jpg");
  snow1 = loadImage("uneasing.jpg");
  myCtr = 4*60 ;
}

void draw() {

  switch(myState) {
  
      default:
    //println("nostate") ;
    break ;
    
    case 0:
    image(heaven, 0, 0, 500, 500);
    textFont(haiku, 60);
    stroke(0);
    textAlign(CENTER, CENTER);
    fill(0);
    text("All heaven", width/2, height/2);
    
    
    myCtr-- ;
    if (myCtr< 0) {
    myState = 1 ; //move to state 1
    myCtr = 4*60 ;
  }
    
    break ;
    
    case 1:
    
    background(80) ;
    image(earth, 0, 0, 500, 500);
    textFont(haiku, 60);
    stroke(0);
    textAlign(CENTER, CENTER);
    fill(0);
    text("All Earth", width/2, height/2);
    
    myCtr-- ;
    if (myCtr< 0) {
    myState = 2 ;
    myCtr = 4*60 ;
    }
    break ;
    
    case 2: 
  
    image(snow, 0, 0, 500, 500);
    textFont(haiku, 50);
    stroke(0);
    textAlign(CENTER, CENTER);
    fill(0);
    text("Flowered white", width/2, height/2);
    text("Obliterates", width/2, 310);
    
    myCtr-- ;
    if (myCtr< 0) {
    myState = 3 ;
    myCtr = 4*60 ;
    }
    break ;
    
      case 3: 
   
    image(snow1, 0-random(-3, 3), 0-random(-3, 3), 500, 500);
    textFont(haiku, 50);
    stroke(0);
    textAlign(CENTER, CENTER);
    fill(#ffffff);
    noStroke();
    ellipse(random(width), random(height), random(3,10), random(3,10));
     ellipse(random(width), random(height), random(10,3), random(10,3));
    fill(0);
    text("Snow...uneasing snow", width/2, height/2);
    
    myCtr-- ;
    if (myCtr< 0) {
    myState = 0 ;
    myCtr = 4*60 ;
    }
    break ;
   


  }
}
  
 


