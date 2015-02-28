
int 
  ColorPickerX, //color picker horizontal position
  ColorPickerY, //color picker vertical position
  LineY, //hue line vertical position
  CrossX, //saturation+brightness cross horizontal position
  CrossY, //saturation+brightness cross horizontal position
  ColorSelectorX = 100, //color selector button horizontal position <------------------------------------------- CHANGE
  ColorSelectorY = 100; //color selector button vertical position   <------------------------------------------- CHANGE

boolean 
  isDraggingCross = false, //check if mouse is dragging the cross
  isDraggingLine = false, //check if mouse is dragging the line
  ShowColorPicker = false; //toggle color picker visibility (even = not visible, odd = visible) 
 
color 
  activeColor = color(100,100,100), //contain the selected color  
  interfaceColor = color(255); //change as you want               <------------------------------------------- CHANGE


void setup() 
  
{
  
  size( 700 , 700 );
  smooth();
  
  colorMode(HSB);
  
  
  ColorPickerX = constrain( ColorSelectorX + 40 , 10 , width - 340 ); //set color picker x position to color selector + 40 and avoid it to be out of screen 
  ColorPickerY = constrain( ColorSelectorY + 40 , 10 , height - 300 ); //set color picker y position to color selector + 40 and avoid it to be out of screen 
  
  LineY = ColorPickerY + int(hue(activeColor)); //set initial Line position
  CrossX = ColorPickerX + int(saturation(activeColor)); //set initial Line position
  CrossY = ColorPickerY + int(brightness(activeColor)); //set initial Line position
  
  
}


void draw()

{
  
  background( 0 ); 
  
  drawColorSelector(); 
  
  if( ShowColorPicker )
  
  {
    
    drawColorPicker();
    drawLine();
    drawCross();
    drawActiveColor();
    drawValues();
    drawOK();
  
  }
  
  checkMouse();
  
  activeColor = color( LineY - ColorPickerY , CrossX - ColorPickerX , 255 - ( CrossY - ColorPickerY ) ); //set current active color
  
}


void drawColorSelector() 

{
  
  stroke( interfaceColor );
  strokeWeight( 1 );
  fill( 0 );
  rect( ColorSelectorX , ColorSelectorY , 20 , 20 ); //draw color selector border at its x y position
  
  stroke( 0 );
  
  if(mouseX>ColorSelectorX&&mouseX<ColorSelectorX+20&&mouseY>ColorSelectorY&&mouseY<ColorSelectorY+20)
   fill( hue(activeColor) , saturation(activeColor) , brightness(activeColor)+30 );
  else
   fill( activeColor );
    
  rect( ColorSelectorX + 1 , ColorSelectorY + 1 , 18 , 18 ); //draw the color selector fill 1px inside the border
  
}



void drawOK() 

{
  
  if( mouseX > ColorPickerX + 285 && mouseX < ColorPickerX + 305 && mouseY > ColorPickerY + 240 && mouseY < ColorPickerY + 260 ) //check if the cross is on the darker color
    fill(0); //optimize visibility on ligher colors
  else
    fill(100); //optimize visibility on darker colors
  
  text( "OK" , ColorPickerX + 285 , ColorPickerY + 250 );

}


void drawValues() 

{
 
  fill( 255 );
  fill( 0 );
  textSize( 10 );
  
  text( "H: " + int( ( LineY - ColorPickerY ) * 1.417647 ) + "°" , ColorPickerX + 285 , ColorPickerY + 100 );
  text( "S: " + int( ( CrossX - ColorPickerX ) * 0.39215 + 0.5 ) + "%" , ColorPickerX + 286 , ColorPickerY + 115 );
  text( "B: " + int( 100 - ( ( CrossY - ColorPickerY ) * 0.39215 ) ) + "%" , ColorPickerX + 285 , ColorPickerY + 130 );
  
  text( "R: " + int( red( activeColor ) ) , ColorPickerX + 285 , ColorPickerY + 155 );
  text( "G: " + int( green( activeColor ) ) , ColorPickerX + 285 , ColorPickerY + 170 );
  text( "B: " + int( blue( activeColor ) ) , ColorPickerX + 285 , ColorPickerY + 185 );
  
  text( hex( activeColor , 6 ) , ColorPickerX + 285 , ColorPickerY + 210 );
  
}

void drawCross() 

{

  if( brightness( activeColor ) < 90 )
    stroke( 255 );
  else
    stroke( 0 );
    
  line( CrossX - 5 , CrossY , CrossX + 5 , CrossY );
  line( CrossX , CrossY - 5 , CrossX , CrossY + 5 );

}


void drawLine() 

{

  stroke(0);
  line( ColorPickerX + 259 , LineY , ColorPickerX + 276 , LineY );

}



void drawColorPicker() 

{
  
  stroke( interfaceColor );
  line( ColorSelectorX + 10 , ColorSelectorY + 10 , ColorPickerX - 3 , ColorPickerY - 3 );
   
  strokeWeight( 1 );
  fill( 0 );
  rect( ColorPickerX - 3 , ColorPickerY - 3 , 283 , 260 );
  
  loadPixels();
  
  for( int j = 0 ; j < 255 ; j++ ) //draw a row of pixel with the same brightness but progressive saturation
   
  {
    
    for( int i = 0 ; i < 255 ; i++ ) //draw a column of pixel with the same saturation but progressive brightness
     
      set( ColorPickerX + j , ColorPickerY + i , color( LineY - ColorPickerY , j , 255 - i ) );
  }
  
  
  for( int j = 0 ; j < 255 ; j++ )
   
  {
    
    for( int i = 0 ; i < 20 ; i++ )
       
      set( ColorPickerX + 258 + i , ColorPickerY + j ,color( j , 255 , 255 ) );
  }
  
  fill( interfaceColor );
  noStroke();
  rect( ColorPickerX + 280 , ColorPickerY - 3 , 45 , 261 );
  
}

void drawActiveColor() 

{

  fill( activeColor );
  stroke( 0 );
  strokeWeight( 1 );
  rect( ColorPickerX + 282 , ColorPickerY - 1 , 41 , 80 );

}


void checkMouse() 

{

  if( mousePressed ) 
  
  {
    
    if(mouseX>ColorPickerX+258&&mouseX<ColorPickerX+277&&mouseY>ColorPickerY-1&&mouseY<ColorPickerY+255&&!isDraggingCross)
    
    {
      
      LineY=mouseY;
      isDraggingLine = true;

    }

    if(mouseX>ColorPickerX-1&&mouseX<ColorPickerX+255&&mouseY>ColorPickerY-1&&mouseY<ColorPickerY+255&&!isDraggingLine)
    
    {
    
      CrossX=mouseX;
      CrossY=mouseY;
      isDraggingCross = true;
    
    }
    
    
    if(mouseX>ColorSelectorX&&mouseX<ColorSelectorX+20&&mouseY>ColorSelectorY&&mouseY<ColorSelectorY+20)
      ShowColorPicker = true;

    if(mouseX>ColorPickerX+285&&mouseX<ColorPickerX+305&&mouseY>ColorPickerY+240&&mouseY<ColorPickerY+260)
      ShowColorPicker = false;
    
  }

  else

  {
    
    isDraggingCross = false;
    isDraggingLine = false;

  }
  
}

