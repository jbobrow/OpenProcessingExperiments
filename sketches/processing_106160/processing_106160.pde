
// Background
PImage img;

// Mario
PImage img2;

// Mario's Position
float XPos;

// Enemies
PImage img3;
PImage img4;
PImage img5;
PImage img6;
PImage img7;

// Falling Speed
int dx = 0;
int dy = 2;

// Enemy Locations
float x = 0;
float y = -20;
float x1 = 0;
float y1 = -360;
float x2 = 0;
float y2 = -150;
float x3 = 0;
float y3 = -490;
float x4 = 0;
float y4 = -290;




void setup() {

  size(800,500);
  img = loadImage("http://www.wall321.com/thumbnails/detail/20120313/mario 1680x1050 wallpaper_www.wall321.com_88.jpg"); //bg
  img2 = loadImage("http://images1.wikia.nocookie.net/__cb20130419153649/mario-fanon/es/images/thumb/3/32/Yeah.gif/186px-Yeah.gif"); //mario
  img3 = loadImage("http://images2.wikia.nocookie.net/__cb20130407235958/fantendo/images/4/4f/Koopa_Troopa.gif.png"); //goomba
  img4 = loadImage("http://lh5.ggpht.com/_wTgN7MIrGd4/SzH2Jc3agOI/AAAAAAAADcg/pzIzmjCH-K4/koopa-shell.png");//koopa
  img5 = loadImage("http://images3.wikia.nocookie.net/__cb20081102125653/mario/de/images/thumb/8/88/Riesen_Kugelwilli.png/60px-Riesen_Kugelwilli.png"); //bullet bill
  img6 = loadImage("http://sio.midco.net/kvwesten/tutorials/sprite tut/index_files/image004.gif"); //boo
  img7 = loadImage("http://fc02.deviantart.net/fs50/f/2009/260/8/3/New_Bob_omb_Animation_by_Neslug.gif"); //bomb
   x = random(50,750);
   x1 = random(50,750);
   x2 = random(50,750);
   x3 = random(50,750);
   x4 = random(50,750);
}


void draw() {
  background(0);
   image(img,0,0);
   image(img2, XPos,300);
   float num = 1;
   int score = millis();
     
  textSize(32);
  text("Score: " + score, 500, 30);
  fill(255);
  
     y = y + dy;
     y1 = y1 + dy;
     y2 = y2 + dy;
     y3 = y3 + dy;
     y4 = y4 + dy;
    
     image(img3, x, y);
     image(img4,x1,y1);
     image(img5,x2,y2);
     image(img6,x3,y3);
     image(img7,x4,y4);
     
     
     if( y > height) {
       y=-100; x=random(50,750);}
     if( y1 > height) {
         y1=-100; x1=random(50,750);}
     if( y2 > height) {
         y2=-100; x2=random(50,750);}
     if( y3 > height) {
       y3=-100; x3=random(50,750);}
     if( y4 > height) {
       y4=-100; x4=random(50,750);}
         
   
   if(key==CODED) {
        if(keyPressed == true) {
            if(keyCode == RIGHT && XPos<700){
                XPos += 4;
            }
  
            else{
                if(keyCode == LEFT && XPos>-100) {
                    XPos -= 4;
                }
      
                else {
                    XPos = XPos; 
                } 
  
              }
          }
      }
      
      //===========================
      // Collision
      
      if (collision(x,y))
          println("GAMEOVER");
          
    
      
  }

boolean collision (int objectX, int objectY)
{
    if (Math.abs(objectX-XPos)<100)
        return(true);
}




