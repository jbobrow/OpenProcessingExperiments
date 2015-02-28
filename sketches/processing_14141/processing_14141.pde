
/***************************************
* 2010. 10. 22
* Designed by Kwon Dae-sung
* Konkuk UNIV art and design college
****************************************/

PFont font;
void setup() {
  size(500, 300);
  frameRate( 30 );
  background(255);
  colorMode(RGB);
  counter = 0;
  shakeCheck = true;
  font = loadFont( "Arial.vlw" );
}//setup

void draw() {  //draw function loops   
  clear();
  shake();
  
}//draw

//====================================
int counter;
boolean shakeCheck;

void mouseClicked() {
  counter++;
  if( counter % 2 == 1 ){
    shakeCheck = false;
  }else{
    shakeCheck = true;
  }
}

//====================================
int spd = 1;
int rectX = 21;
int colorVar = 0;
void shake(){
  noStroke();
  if( shakeCheck ){
    fill( 130, 30, rectX );
    for( int i=0; i< 20; i++ ){
      if( 20 > rectX ||  rectX > 360 ){
        spd  = spd * ( -1);
      }
      rectX += spd;
      
      rect( rectX , 130, 100, 40 );
    }
    textFont( font );
    fill( 10,10,230);
    text("mouse click = stop", 20, 280);
  }else{
    fill( 30, 30, 30 );
    rect( rectX, 130, 100, 40 );
    textFont( font );
    fill( 10,10,230);
    text("mouse click = play", 20, 280);
  }
}

void clear(){
  noStroke();
  fill( 255 );
  rect( 0, 0, 500, 300 );
}
