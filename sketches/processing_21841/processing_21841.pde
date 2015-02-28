
int sheepNumber;
PFont myfont;
int sheepAt;
int halfSheepWidth = 50;

void setup(){
  size( 400, 400 );
  sheepNumber = 1;
  sheepAt = width + 50;
  myfont = loadFont("ArialMT-20.vlw");
  textAlign(CENTER);
  textFont(myfont);
  
}

void draw(){
  background(128,128, 255 ) ; //0 ) ;//constrain( 255 -  7 * sheepNumber, 0 , 255 ) );
  noStroke();
  fill(32,128,32);
  rect(0, height - 150, width, 150 );
  sheepAt-=3;
  if( sheepAt < -halfSheepWidth ){
    sheepAt = width + halfSheepWidth;
    sheepNumber++;
  } 
  translate( sheepAt, 250 - 20 * sin( radians( sheepAt % 360 ) ) );
  draw_sheep( sheepNumber );

}



void draw_sheep( int SN ){
 pushStyle();
  //fill(255,0,0);
  //rect(-halfSheepWidth, -halfSheepWidth, 2 * halfSheepWidth, 2 * halfSheepWidth );
  fill(0);
  rect( -30, 0, 10, 40 );//- ((sheepAt % 100)/10 - 2) );
  rect( -15, 0, 10, 45 );//- ((sheepAt % 100)/10 - 6));
  rect( 15, 0, 10, 45 );//- ((sheepAt % 100)/10 - 4));
  rect( 30, 0, 10, 40 ); //- ((sheepAt % 100)/10 - 8));
  
  
  
  
  fill(255);
  ellipseMode(CENTER);
  ellipse(0, 0, halfSheepWidth * 1.7, 50 );
  // head
  fill(0);
  ellipse(-30, -20, 40, 40 );
  // ears
  ellipse(-30-15, -20-15, 10, 10 );
  ellipse(-30+15, -20-15, 10, 10 );
  // Eye whites
  fill(255);
  ellipse( -30-7, -25, 7, 5 );
  ellipse( -30+7, -25, 7, 5 );
  // eye blacks
  fill(0,0,0);
  ellipse( -30-7, -25, 4, 4 );
  ellipse( -30+7, -25, 4, 4 );
  // red mouth
  fill(196,0,0);
  ellipse( -30, -10, 20, 10 );
  // black mouth
  fill(0);
  rect( -30-10, -10-5, 20, 5 );
  ellipse( -30, -10, 10, 5 );
  
  
  
  
 //fill( random(128,255),random(128,255),random(128,255) );
 
 fill(0);
 text( SN, 10, 8);
  
  
  popStyle();
}

