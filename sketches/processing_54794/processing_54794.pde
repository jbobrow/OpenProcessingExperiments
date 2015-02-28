
int b = 10;
int b2 = 10;
int b3 = 10;
int b4 = 10;
int b5 = 10;
int b6 = 10;


PFont font;

void setup(){
  size(600,600);
  background(255,255,255);
     font = loadFont("LucidaBlackletter-48.vlw");
}

void draw(){
  if (mousePressed){


    b += random(10,30);
 fill((random(500)),(random(500)),(random(500)),(random(500)));
  textFont(font); 
  textSize(b);
    text("rococo",0,0);
    
    
    b2 += random(10,30);
 fill((random(500)),(random(500)),(random(500)),(random(500)));
  textFont(font); 
  textSize(b2);
    text("rococo",255,0);
    
    
    b3 += random(10,30);
 fill((random(500)),(random(500)),(random(500)),(random(500)));
  textFont(font); 
  textSize(b3);
    text("rococo",600,0);
    
        b4 += random(10,30);
 fill((random(500)),(random(500)),(random(500)),(random(500)));
  textFont(font); 
  textSize(b4);
    text("rococo",0,255);
    
        b5 += random(10,30);
 fill((random(500)),(random(500)),(random(500)),(random(500)));
  textFont(font); 
  textSize(b5);
    text("rococo",255,255);

    
        b6 += random(10,30);
 fill((random(500)),(random(500)),(random(500)),(random(500)));
  textFont(font); 
  textSize(b6);
    text("rococo",0,600);
    
  }
}

