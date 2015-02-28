
void keyPressed()
{
   
  if ( key == 'c' )
  {
    initialize();
    return;
  }
   
  if ( key == 'a' )
  {
    addNode();
    return;
  }
   
   if ( key == 'w' )
  {
    NODE_SIZE = NODE_SIZE + 1;
  }
  if ( key == 'x' )
  {
    NODE_SIZE = NODE_SIZE - 1;
  }
 if ( key == 'q' )
  {
    EDGE_LENGTH = EDGE_LENGTH + 1;
  }
 if ( key == 's' )
  {
    EDGE_LENGTH = EDGE_LENGTH - 1;
  } 
  if ( key == 'e' )
  {
    EDGE_STRENGTH = EDGE_STRENGTH*1.1;
  }
 if ( key == 'r' )
  {
    EDGE_STRENGTH = EDGE_STRENGTH*0.9;
  } 
  if ( key == 't' )
  {
    SPACER_STRENGTH = SPACER_STRENGTH + 50;
  }
 if ( key == 'y' )
  {
    SPACER_STRENGTH = SPACER_STRENGTH - 50;
  } 
  if ( key == 'd' )
  {
    BOUNCE = BOUNCE + 0.1;
  }
 if ( key == 'f' )
  {
    BOUNCE = BOUNCE - 0.1;
  } 
  if ( key == 'g' )
  {
    DISPARITION = true;
  }
 if ( key == 'h' )
  {
    DISPARITION = false;
  } 
  if ( key == 'm' )
  {
    Control = true;
  } 
  if ( key == 'l' )
  {
    Control = false;
  } 
  if ( key == 'b' )
  {
    drawline = true;
  }
  if ( key == 'n' )
  {
    drawline = false;
  }
  if ( key == 'o' ){
  Mode = true;
  }
if ( key == 'p' ){
Mode = false;
}
 
if ( key == '!' ){
 
    narciss = false;
  }
  if ( key == 'ù' ){
 
    narciss = true;
  }
   
}
 
 
void mousePressed () {
  if (Mode == true) {
  sitemouse ();
   }
  if (Mode == false) {
  areamouse ();
  }
}
 
void mouseDragged () {
  if (Mode == true) {
  sitedragged ();
  }
  if (Mode == false) {
  areadragged();
  }
}

