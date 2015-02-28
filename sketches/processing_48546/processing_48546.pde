



void setup() {
  background(#FFFFFF);
  size(600,350);
  frameRate(2);
}

void draw() {
  background(#FFFFFF);
  strokeWeight(20);
  beginShape();
  noFill();
  smooth();
  
beginShape();
    vertex( 252 , 215 );
        vertex( 275 , 215 );
        bezierVertex( 275 , 215 , 281 , 215 , 281 , 218);
        bezierVertex( 281 , 222 , 281 , 275 , 281 , 275);
        bezierVertex( 281 , random(275, 375) , 282 , random(288, 388) , 305 , 288);
        bezierVertex( 329 , 288 , 328 , 276 , 328 , 276);
        vertex( 328 , 219 );
        bezierVertex( 328 , 219 , 326 , 215 , 332 , 215);
        bezierVertex( 337 , 215 , 381 , 215 , 381 , 215);
        bezierVertex( random(381, 481) , random(215, 315) , 327 , 287 , 387 , 287);
        bezierVertex( random(446, 546) , 287 , random(461, 561) , 214 , 461 , 214);
        bezierVertex( 375 , 193 , 417 , 354 , 501 , 252);
    endShape();
    
    beginShape();
    vertex( 100 , 214 );
        vertex( 156 , 214 );
        bezierVertex( 156 , 214 , 162 , 213 , 162 , 221);
        bezierVertex( 162 , 229 , 162 , 276 , 162 , 276);
        bezierVertex( 162 , 276 , 163 , 288 , 184 , 288);
        bezierVertex( 206 , 288 , 206 , 274 , 206 , 274);
        vertex( 206 , 222 );
        bezierVertex( 206 , 222 , 205 , 216 , 210 , 216);
        bezierVertex( 215 , 216 , 225 , 216 , 225 , 216);
        bezierVertex( 225 , 216 , 231 , 217 , 231 , 211);
        bezierVertex( random(331) , random(306) , 231 , 100 , 231 , 100);
    endShape();
    
    beginShape();
    vertex( 165 , 170 );
        bezierVertex( 165 , 170 , random(270) , random(203) , 141 , 103);
        bezierVertex( 113 , 103 , random(117) , random(170) , 117 , 170);
        vertex( 117 , 288 );
    endShape();
}

