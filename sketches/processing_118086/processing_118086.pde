
PFont benton;

PShape pink;
PShape yellow;
PShape cyan;
PShape green;
PShape orange;

int posX = 300;

String mike = "Mike Kelley";
String magritte = "Magritte";
String carol = "Carol Bove";
String sound = "Soundings";
String american = "American Modern";


void setup(){
  size(650,375);
  background(255);
  pink = loadShape("MoMAwaypink.svg");
  yellow = loadShape("MoMAwayyellow.svg");
  cyan = loadShape("MoMAwaycyan.svg");
  green = loadShape("MoMAwaygreen.svg");
  orange = loadShape("MoMAwayorange.svg");
  benton = createFont("BentonSansCond", 24);
  textFont(benton);
  
}
  
  void draw(){
    
    fill(0);
     text(mike, 50, 85);
     text(magritte, 50, 135);
     text(carol, 50, 185);
     text(sound, 50, 235);
     text(american, 50, 285);
     
    if (keyPressed==true){
      if (key == CODED){
        if (keyCode == UP){
    shape(pink, posX,50);
        }
        if (keyCode == DOWN){
    shape(cyan,posX,100);
  }
        if (keyCode == RIGHT){
    shape(yellow, posX, 150);
  }
        if (keyCode == LEFT){
    shape(green, posX, 200);
        }
        if (keyCode == SHIFT){
    shape(orange, posX, 250);
  }
    }
  }
  }


