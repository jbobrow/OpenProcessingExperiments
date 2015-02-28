
PGraphics v3D, vMain;
float rotationY, rotationX = 0.0;
boolean[] keysdown = { 
  false, false, false, false, false };
String[] testDirections = { 
  "k", "f 196 0 64", "b", "v 0 0 0", "v .5 .5 .5", "v .5 0 0", "e" };
String[] actualDirections;
int atLine = 0;
//int atPos = 0;

void setup(){
  size( 409, 206 );
  v3D = createGraphics( 200, 200, P3D );
  actualDirections = loadStrings( "DIRECTIONS.txt" );
  textFont(createFont("Tahoma", 10), 10);
}

void draw(){
  if( keysdown[0] ){
    rotationX=(rotationX-0.01)%TWO_PI;
  }
  if( keysdown[1] ){
    rotationX=(rotationX+0.01)%TWO_PI;
  }
  if( keysdown[2] ){
    rotationY=(rotationY-0.01)%TWO_PI;
  }
  if( keysdown[3] ){
    rotationY=(rotationY+0.01)%TWO_PI;
  }

  v3D.beginDraw();
  v3D.pushMatrix();
  v3D.background(color(0));
  v3D.lights();
  v3D.translate( v3D.width/2.0, v3D.height/2.0 );
  v3D.scale(100.0);
  v3D.stroke(color(255));
  v3D.noFill();
  v3D.rotateY(rotationY);
  v3D.rotateX(rotationX);
  v3D.pushMatrix();
  v3D.box(1);
  ObjectReader( actualDirections, v3D );
  v3D.popMatrix();
  v3D.popMatrix();
  v3D.endDraw();

  background(color(128));
  image(v3D.get(0,0,v3D.width,v3D.height), 3, 3 );
  fill(color(0));
  noStroke();
  pushMatrix();
  translate(206,3);
  rect(0,0,200,200);

  // Status squares
  fill(color(255,255,0));
  if( keysdown[4] ){ 
    fill(color(0,255,0)); 
  }  
  rect( 1, 1, 10, 10);

  fill(color(255,0,0));
  if( keysdown[4] ){ 
    fill(color(255,255,0)); 
  }  
  if( keysdown[2] ){ 
    fill(color(0,255,0)); 
  }
  rect( 12, 1, 10, 10);

  fill(color(255,0,0));
  if( keysdown[4] ){ 
    fill(color(255,255,0)); 
  }  
  if( keysdown[0] ){ 
    fill(color(0,255,0)); 
  }
  rect( 23, 1, 10, 10);

  fill(color(255,0,0));
  if( keysdown[4] ){ 
    fill(color(255,255,0)); 
  }  
  if( keysdown[1] ){ 
    fill(color(0,255,0)); 
  }  
  rect( 34, 1, 10, 10);
  fill(color(255,0,0));
  if( keysdown[4] ){ 
    fill(color(255,255,0)); 
  }  
  if( keysdown[3] ){ 
    fill(color(0,255,0)); 
  }
  rect( 45, 1, 10, 10);
  fill(color(0));
  text( "C", 3, 9);
  text( "<", 13, 9);
  text( "^", 25, 12);
  text( "v", 37, 9);
  text( ">", 47, 9);

  for( int lineitr = atLine; (lineitr<actualDirections.length+1) && (lineitr<atLine+17); lineitr++){
    fill(color(255));
    if( !(lineitr<actualDirections.length) ){
      fill(color(0,0,255));
      text("--- FILE ENDS HERE ---" , 2, 20 + (11 * (lineitr - atLine ))  );
    } 
    else {
      if( lineitr == atLine ) { 
        fill(color(255,255,0)); 
      }
      if( actualDirections[lineitr].equals("u") || actualDirections[lineitr].equals("o") ) { 
        fill( color(255,0,0)); 
      }
      if( (lineitr < actualDirections.length-1) && actualDirections[lineitr].equals("u") && actualDirections[lineitr+1].equals("o") ) { 
        fill( color(255,255,0)); 
      }
      if( (lineitr > 0) && actualDirections[lineitr-1].equals("u") && actualDirections[lineitr].equals("o") ) { 
        fill( color(255,255,0)); 
      }
      if( keysdown[4] ){ 
        fill(color(255,0,0)); 
      }      
      text( actualDirections[lineitr], 2, 20 + (11 * (lineitr - atLine ))  );
    }
  }
  popMatrix();


}

void keyPressed(){
  if( key == CODED ){
    if( keysdown[4] ) {
      if(keyCode == UP){
        keysdown[0] = true;
        //  keysdown[0] = !keysdown[0];
      }
      if(keyCode == DOWN){
        keysdown[1] = true;
        //  keysdown[1] = !keysdown[1];
      }
      if(keyCode == LEFT){
        keysdown[2] = true;
        //  keysdown[2] = !keysdown[2];
      }
      if(keyCode == RIGHT){
        keysdown[3] = true;
        //  keysdown[3] = !keysdown[3];
      }
    } 
    else {
      if(keyCode == UP){
        atLine--;
        atLine = constrain(atLine, 0, actualDirections.length-1);
        //        atPos = 0;
      }
      if(keyCode == DOWN){
        atLine++;
        atLine = constrain(atLine, 0, actualDirections.length-1);
        //        atPos = 0;
      }
      /*      if(keyCode == LEFT){
       atPos--;
       atPos = constrain(atPos, 0, actualDirections[atLine].length()-1);
       }
       if(keyCode == RIGHT){
       atPos++;
       atPos = constrain(atPos, 0, actualDirections[atLine].length()-1);
       }
       */
    }  
    if(keyCode == CONTROL){
      keysdown[4] = true;
    }
  } 
  else {
    char k;
    int temp;
    k = (char)key;
    switch(k){
    case 8: // backspace:
      // If not a blank line, if not a u or o, remove a letter.
      // If a u/o, check if o/u is matched, remove both.
      // If a blank line, remove. Whew.
      if(actualDirections[atLine].length()>0){
        if( !actualDirections[atLine].equals( "u" ) && !actualDirections[atLine].equals( "o" ) ){
          actualDirections[atLine] = actualDirections[atLine].substring(0, actualDirections[atLine].length()-1);
        } 
        else {
          if( (atLine < actualDirections.length-1) && actualDirections[atLine].equals("u") && actualDirections[atLine+1].equals("o") ) { 
            for(temp = atLine; temp < actualDirections.length-2; temp++ ) {
              actualDirections[temp] = actualDirections[temp+2];
            }
            actualDirections = shorten( shorten( actualDirections ) );
            atLine--;
            if( atLine < 0 ) { 
              atLine = 0; 
            }
          } 
          else if( (atLine > 0) && actualDirections[atLine-1].equals("u") && actualDirections[atLine].equals("o") ) { 
            for(temp = atLine-1; temp < actualDirections.length-2; temp++ ) {
              actualDirections[temp] = actualDirections[temp+2];
            }
            actualDirections = shorten( shorten( actualDirections ) );
            atLine-=2;
            if( atLine < 0 ) { 
              atLine = 0; 
            }
          }
        }  
      } 
      else {
        for(temp = atLine; temp < actualDirections.length-1; temp++ ) {
          actualDirections[temp] = actualDirections[temp+1];
        }
        actualDirections = shorten( actualDirections );
        atLine--;
        if( atLine < 0 ) { 
          atLine = 0; 
        }
      }
      break;
      //    case 'u':
      //    case 'o':      
      //      break;
    case 65535:
    case 127:
    case 27:
      break; // Avoid special keys
    case ENTER:
    case RETURN:
      //      println("Attempting to splice");
      if( actualDirections[atLine].equals( "u" ) && (atLine == 0) ) { // special case. If the first line is a push, it gets "stuck".
        actualDirections = splice( actualDirections, "", atLine );
      } 
      else {  
        actualDirections = splice( actualDirections, "", atLine+1 );
        atLine+=1; // no need to contrain this, as we're moving to the line we just added!
      }
      break;
    default:
      if( (!(actualDirections[atLine].equals( "u" ))) && (!(actualDirections[atLine].equals( "o" ))) ){
        actualDirections[atLine] = actualDirections[atLine] + k ;
        if( actualDirections[atLine].equals( "u" ) ){
          actualDirections = splice( actualDirections, "o", atLine+1 );
          //atLine+=1; // no need to contrain this, as we're moving to the line we just added!
        }
        if( actualDirections[atLine].equals( "o" ) ){
          actualDirections = splice( actualDirections, "u", atLine );
          //atLine+=1; // no need to contrain this, as we're moving to the line we just added!
        }
      } 
      break;
    }
  }
}

void keyReleased(){
  if( key == CODED ){
    //*
    if( keysdown[4] ) {
      if(keyCode == UP){
        keysdown[0] = false;
      }
      if(keyCode == DOWN){
        keysdown[1] = false;
      }
      if(keyCode == LEFT){
        keysdown[2] = false;
      }
      if(keyCode == RIGHT){
        keysdown[3] = false;
      }
    }
    //*/
    if(keyCode == CONTROL){
      keysdown[4] = false;
    }
  } 
  //else {
  //}
}




















