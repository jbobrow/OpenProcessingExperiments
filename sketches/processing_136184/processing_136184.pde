
/* @pjs preload="bath.jpg", "selfie.jpg", "gothic.jpg", "lincoln.jpg", "mao.jpg", "window.jpg", "dorian.jpg"; font="linux.ttf"; */

int myState = 0;
PFont linux;

PImage bath;
PImage lincoln;
PImage mao;
PImage windows;
PImage dorian;
PImage gothic;
PImage selfie;

void setup() {
  size(500, 500);
  bath = loadImage ("bath.jpg");
  lincoln = loadImage ("lincoln.jpg");
  mao = loadImage ("mao.jpg");
  dorian = loadImage ("dorian.jpg");
  windows = loadImage ("window.jpg");
  gothic = loadImage ("gothic.jpg");
  selfie = loadImage ("selfie.jpg");
    linux = createFont("linux.ttf", 50);
}

void draw() {
  textAlign(CENTER, CENTER);
  background(255, 0, 0);

  switch(myState) {
    case 0:
    background(0, 0, 0);
    textFont (linux, 20);
    text("Art Institute of Chicago Tour!", width/2, 210);
    text("Click the screen, then hit 'n' (next)", width/2, 270);
    text("to navigate thoughout the museum.", width/2, 295);
    text("Kim Kizyma", width/2, 320);
    break ;
    
    case 1:
    background(0, 0, 0);
    image(bath, 0, 0, 500, 500);
    textFont(linux, 20);
    text("The Child's Bath, Mary Cassatt", width/2, 470);
    break ;

    case 2:
    background(0, 0, 0);
    image(lincoln, 0, 0, 500, 500);
    textFont(linux, 20);
    text("Abraham Lincoln, Daniel Chester French", width/2, 470);
    break ;

    case 3:
    background(0, 0, 0);
    image(mao, 0, 0, 500, 500);
    textFont(linux, 20);
    text("Mao, Andy Warhol", width/2, 470);
    break ;

    case 4:
    background(0, 0, 0);
    image(windows, 0, 0, 500, 500);
    textFont(linux, 20);
    text("American Windows, Marc Chagall", width/2, 470);
    break ;

    case 5:
    background(0, 0, 0);
    image(dorian, 0, 0, 500, 500);
    textFont(linux, 20);
    text("Dorian Gray, Ivan Albright", width/2, 470);
    break ;
    
    case 6:
    background(0, 0, 0);
    image(gothic, 0, 0, 500, 500);
    textFont(linux, 20);
    text("American Gothic, Grant Wood", width/2, 470);
    break ;
    
    case 7:
    background(0, 0, 0);
    image(selfie, 0, 0, 500, 500);
    textFont(linux, 20);
    text("Self Portrait, Beauford Delaney", width/2, 470);
    break ;
    
    case 8:
    background(0, 0, 0);
    break ;
  }
}

void keyPressed() {
  //println(key)
  
 switch(key){
   case'n':
   //println("next");
   myState = myState + 1;
   if (myState > 8) {
     myState = 0;
   break;
}
}
}


