
//Day9 Q2
void    setup(){
 size(300,120);
}

void drawRect(float  x, float y, float w, float h, color c){
 rectMode(CORNER);
 stroke( c );
 fill( c );
 rect( x, y, w, h);
}

void draw(){
 background(255);
 float   x   =   map(hour(), 0,24, 0, width );
 drawRect(0,0,x,height/3,color( 255, 0, 0 ));
 x   =   map(minute(), 0 , 60 , 0 , width );
 drawRect(0,height/3,x,height/3,color( 0, 255, 0 ));
 x   =   map(second(), 0,60, 0, width );
 drawRect(0,2*height/3,x,height/3,color(0,0,255) );
}
