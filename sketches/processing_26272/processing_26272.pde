
int x;
PFont FuturaBold;
PFont Carta;
PFont Carta30;
PImage natalia;
void setup(){
  size(430,560);
  background(0);
  x=0;
  FuturaBold = loadFont("Futura-CondensedBold-48.vlw");
  Carta = loadFont("Carta-72.vlw");
  natalia = loadImage("natalia.jpg");
  Carta30 = loadFont("Carta-30.vlw");
 
}
void draw(){
  image(natalia,0,0,430, 560);
    textFont(Carta);
      fill(20,30);
  text("eeeeeeeeeeeeeeeee",-50,30);
  fill(20,30);
  text("rrrrrrrrrrrrrrrrrrrrr",-50,100);
    fill(30,50);
  text("rrrrrrrrrrrrrrrrrrr",-50,120);
    text("eeeeeeeeeeeeeeee",-50,600);
        text("eeeeeeeeeeeeeeee",-50,430);
         text("eeeeeeeeeeeeeeee",-50,530);
         
    fill(30,30);
  text("rrrrrrrrrrrrrrrrrrr",-50,100);
      fill(30,30);
  text("rrrrrrrrrrrrrrrrrrr",-50,400);
    text("eeeeeeeeeeeeeeeeeeeeee",-50,520);
    fill(30,20);
        text("eeeeeeeeeeeeeeeeeeeeee",-50,200);
        fill(30,50);
        text("eeeeeeeeeeeeeeee", -50,420);
         text("eeeeeeeeeeeeeeee",-50,600);
         fill(252,25,132,80);
        
         textFont(Carta30);
         text("e           e           e      e   e    e     e ee",80,25);
                  text("e           e         e      e   e    e     e ee",20,100);
                           text("e           e           e      e   e    e     e ee",40,50);
         text("e   e   e   e         e   e   e e       e eee    e",20,40);
         text("e e       e           e",0,45);
         text("e                        e    e",250,30);
         fill(252,25,132,200);
         text("      e  e           e  e               e",20,80);
         text("e                        e",40,200);

      
  fill(252,25,132);
  textFont(FuturaBold);
  text("pink.",40,500);
}


