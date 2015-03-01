
/* @pjs preload="daria_background.jpg";"dariaplayer.png";
"janeplayer.png";"quinnplayer.png";"win.png";"lose.png"*/
float x;
float y;
float z;
float s;
PFont helvetica;
String time = "30";
int t;
int interval = 30;
PImage img;
PImage daria;
PImage jane;
PImage quinn;
PImage win;
PImage lose;
void setup(){
  size(700,700);
  background(255);
  img = loadImage("daria_background.jpg");
  daria = loadImage("dariaplayer.png");
  jane = loadImage("janeplayer.png");
  quinn = loadImage("quinnplayer.png");
  win = loadImage("win.png");
  lose = loadImage("lose.png");
  helvetica = createFont("Helvetica", 24);
  x = 120;
  y = 90;
  z = 300;
  s = 150;
}
void draw(){
  image(img,0,0);
  if (s >= 700){
    s = 0;
  } else{
    s+= 5;
  }
  if (z >= 700){
    z = 0;
  } else{
    z+=5;
  }
  image(jane,z,200);
  image(quinn,s,400);
  t = interval - int(millis()/1000);
  time = nf(t,2);
  textFont(helvetica);
  textAlign(LEFT);
  fill(0);
  if (t <= 0){
    image(lose,0,0);
  } else{
    text("Time:", 425, 75);
    text(time, 500,75);
  }
  if(dist(daria.x, daria.y, jane.x, jane.y) > 10) {
  if (keyPressed && (keyCode == UP)){
    y -= 5;
  }
  if (keyPressed && (keyCode == DOWN)){
    y += 5;
  }
  if (keyPressed && (keyCode == LEFT)){
    x -= 5;
  }
  if (keyPressed && (keyCode == RIGHT)){
    x += 5;
  }
  if (keyPressed && (key == ' ')){
    y -= 30;
  } 
  } else {
        if (keyPressed && (keyCode == UP)){
        y -= 1;
      }
        if (keyPressed && (keyCode == DOWN)){
        y += 1;
      }
        if (keyPressed && (keyCode == LEFT)){
         x -= 1;
      }
        if (keyPressed && (keyCode == RIGHT)){
        x += 1;
      }
        if (keyPressed && (key == ' ')){
        y -= 10;
      } 
  }
  if (x >= 700){
    x = 0;
  }
  if ( x < 0){
    x = 700;
  }
  if (y >= 700){
    y = 690;
  }
  if (y < 10){
    y = 10;
  }

  if( x == s && y == 400){
    interval == 0;
  }
  textFont(helvetica);
  textAlign(LEFT);
  fill(0);
  if(x >= 500 && x < 600 && y >= 500 && y < 600){
    image(win,0,0);
  }
  image(daria,x,y);
  
}

//For help with creating a counter: http://forum.processing.org/one/topic/how-to-create-countdown-timer.html


