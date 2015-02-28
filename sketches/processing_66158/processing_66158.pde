
//  ---------------------------------------------------------------------------
//  
//  FickesMouseDraw by ericfickes.com
//  
//  This is a simple drawing tool powered by the mouseDraw and keyPressed events.
//  You will draw whenever you move your mouse.  No magic exists in the main draw() function
//  You can control the brush type, brush size, fill, and smooth by pressing the appropriate
//  first letter on your keyboard.
//  Usage :
//  brush   : e = ellipse, l = line, p = point, r = rect
//  brushSz : keys 1 - 9
//  fill    : f to toggle ( fill only works with ellipse and rect )
//  smooth  : s to toggle
//  erase screen : fn + delete
//  stroke color : c to toggle B&W or random colors ( * ellipse and rect get fill color, line and point get stroke color )
//  pen down : toggle with spacebar. This allows you to move the cursor without drawing
//  redraw help : h redraws the top help box
//  WRITE PNG : save your sketch as a PNG by pushing w
//  
//  ---------------------------------------------------------------------------
char brush = 'l';         //  current brush
int brushSz = 1;          //  strokeSize
Boolean bFill = false;    // to fill or not to fill
Boolean bSmooth = false;  // should we be smooth?
Boolean bColor = false;   // B&W or random color?
color bgColor = #000000;  // background color gets used in setup and in keyPressed
Boolean penDown = true;    //  is the pen up or are you drawing? ( toggle with spacebar )
String fileName = "";

//  SETUP   ///////////////////////////////////////////////////////////////////
void setup() {
  // setup core sketch settings items
  size( 900, 900 );  //  P2D, P3D, OPENGL, PDF

  ellipseMode(CENTER);
  // rectMode(CENTER);
  fill(#EF0000);
  
  setBackground();
}


//  DRAW  /////////////////////////////////////////////////////////////////////
void draw()
{
  //  Typically we'd be drawing inside of this function since it's the main 
  //  looper.  However, for this example we're running completely off the
  //  built in mouseMoved() and keyPressed() events
}

//  mouseMoved  ///////////////////////////////////////////////////////////////
void mouseMoved() {


//TODO: add keyPressed event listener to capture spacebar keyUP?
//  UPDATE: PEN UP IF SPACEBAR IS DOWN
if( penDown )
{

  //  smooth ?
  if(bSmooth){
    smooth();
  } else {
    noSmooth();
  }
  

  //  set default color
  stroke(random(255));  //  default random B&W


  //  fill the shapes?
  if(bFill){
    //  fill with color or B&W?
    if(bColor)
      fill(random(255),random(255),random(255));
    else
      fill(frameCount%2==0?0:255);
  } else {
    noFill();
  }

  //  handle stroke size
  strokeWeight( brushSz );
  
  //  draw with appropriate "brush"
  switch(brush){

    case 'e':
    {
      //  always strokes B&W
      ellipse( mouseX, mouseY, brushSz*PI, brushSz*PI );
    }
    break;

    case 'l':
    {

      if(bColor)
        stroke(random(255),random(255),random(255));
      else
        stroke(frameCount%2==0?0:255);

      line( mouseX, mouseY, pmouseX, pmouseY );
    }
    break;

    case 'p':
    {

      if(bColor)
        stroke(random(255),random(255),random(255));
      else
        stroke(frameCount%2==0?0:255);

      point( mouseX, mouseY);
    }
    break;

    case 'r':{
      //  always strokes B&W
      rect( mouseX, mouseY, brushSz*4, brushSz*4 );
    }
    break;
  }
  //  brush


} else {
  // println("SPACEBAR -- PEN UP");
}  


}


//  keyPressed  ///////////////////////////////////////////////////////////////
void keyPressed() {

  switch(key){
    //  set strokeSize
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
    {
      brushSz = key-48; //  NOTE: I'm not sure about the number key offset thingy yet, but this gives you the correct number
    }
    break;


    //  set brush type
    case 'e':
    case 'l':
    case 'p':
    case 'r':
    {
      brush = key;
    }
    break;

    //  drawing options
    case 'c':{
      bColor = !bColor;
    }
    break;

    case 'f':{
      bFill = !bFill;
    }
    break;


    case 's':{
      bSmooth = !bSmooth;
    }
    break;

    case 'h':{
      showHelp();
    }
    break;

    //  WRITE image to disk
    case 'w':{
        fileName = "fmd"+ month() +day() + year() + hour() + minute() + millis()+".png";
        save( fileName );
        // println(fileName + " saved!");
    }
    break;

    case ' ':{
      penDown = false;
    }
    break;


    //  erase drawing
    case DELETE:
    {
      setBackground();
    }
    break;

    default :
      println("# press : '" + key + "' : " + keyCode  );
    break;
  }
}


//  keyReleased ///////////////////////////////////////////////////////////////
void keyReleased()
{
  if( key == ' '){
    penDown = true;
  }
}


//  showHelp  /////////////////////////////////////////////////////////////////
void showHelp() {
  noStroke();
  fill(0);
  rect(0, 0, width, 21);
  fill(#007537);
  text("HELP: brush: e,l,p,r | strokeSz: 1-9 | color: c | fill: f | smooth: s | help: h | pen up: SPACE | Save: w | erase:[fn]+DELETE ", 0, 12);
}



//  setBackground /////////////////////////////////////////////////////////////
void setBackground(){

  background(bgColor);

  showHelp();    

  fill(#EF0000);
  text("ericfickes.com", 0, height);
}

