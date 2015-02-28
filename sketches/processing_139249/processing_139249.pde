

void setup() {
  
  frameRate(60);
  
  //
  setupCanvas();
  
  //
  size(600, 600);

  canvas = createGraphics(canvasWidth, canvasHeight);
  guiCanvas = createGraphics(canvasWidth, canvasHeight);

  paused=false;
  gui=true;

  font=loadFont("SansSerif-16.vlw");
  textFont(font);

  ellipseMode(CENTER);
  rectMode(CENTER);
 
}

void draw() {
  
  //BACK
  background(backgroundColor);

  //ANIMATION CONTROL
  if (!paused) {
    x+=animationSpeed*.01;
  }

  //GUI CANVAS DRAW
  guiCanvas.beginDraw();

  guiCanvas.pushMatrix();

  guiCanvas.translate(width*.5, height*.5);
  guiCanvas.scale(1, -1);
  guiCanvas.scale(zoomLevel, zoomLevel);

  drawGuiCanvas();

  guiCanvas.popMatrix();

  guiCanvas.endDraw();

  ///FINE GUI CANVAS DRAW

  //CANVAS DRAW
  canvas.beginDraw();

  canvas.pushMatrix();

  canvas.translate(width*.5, height*.5);
  canvas.scale(1, -1);
  canvas.scale(zoomLevel, zoomLevel);

  drawCanvas();

  canvas.popMatrix();
  canvas.endDraw();

  //FINE CANVAS DRAW

  //CANVAS IMAGE RENDER
  image(canvas, 0, 0);

  //GUI
  if (gui) {

    //GUI CANVAS IMAGE RENDER
    image(guiCanvas, 0, 0);

    //CURSOR
    updateCursor();
    drawCursor();
    
    //INFO GUI
    fill(color(255-red(backgroundColor), 255-green(backgroundColor),255-blue(backgroundColor)));
    textSize(12);
    text("Press SPACEBAR to pause/play animation", width-250-3,height-100-3);
    text("Press G to hide/show interface", width-250-3,height-85-3);
    text("Press R to reset animation", width-250-3,height-70-3);
    text("Press S to save image", width-250-3,height-55-3);
    
    //AXIS LABELS
    textSize(16);
    text("X", width-25,height*.5+15);
    text("Y", width*.5-15,15);
    text("O", width*.5-15,height*.5+15);
    
  }

  //FINE DRAW
}



/////////////////////////////////////////////

float x,y;
float brushWidth, brushHeight;

int animationSpeed;

/////////////////////////////////////////////

void setupCanvas() {
  
  //YOUR NAME
  name="Claudio";
  lastName="Midolo";

  //CANVAS SIZE 
  canvasWidth=800;
  canvasHeight=800;
  
  //BACKGROUND COLOR
  backgroundColor=color(255,255,255);
  
  //ZOOM
  zoomLevel=100; //keep it between 8 and 128
  
  //BRUSH STARTING POINT
  x=-20;
  
  //BRUSH SIZE
  brushWidth=4;
  brushHeight=4;
  
  //ANIMATION SPEED
  animationSpeed=4;

  //Don't care about this one
  //it's for a reset function
  x0=x;
}

/////////////////////////////////////////////

void drawCanvas() {

  //EQUATION
  //y=x;
  //y=.5*x+2;
  //y=x*x;
  //y=.25*(x+4)*(x+1)*(x-2);
  //y=sqrt(x);
  //y=pow(2,x);
  //=1/x; 
  y=sin(x*.4+PI*.5);
  
  //BRUSH
  canvas.noStroke();
  canvas.fill(64+127*abs(1-abs(y*.75)),127+45*abs(y),0,200-100*y);
  if(x>-3.9 && x<3.9)canvas.ellipse(x, y, .05+brushWidth*.1*abs(y), .05+brushHeight*.55*abs(y));
  if(x>-3.9 && x<3.9)canvas.ellipse(x, -y, .05+brushWidth*.1*abs(y), .05+brushHeight*.55*abs(y));
  
  /////////////////////

}

//
void keyReleased() {
  if (keyCode == 32) {
    //SPACE
    paused=!paused;

    println("Paused:"+paused);
  }
  else if (keyCode==71) {
    //G
    gui=!gui;
  }
  else if (keyCode==83) {
    //S
    if(!gui){
    //canvas.save(name+lastName+"-ART-"+month()+"-"+day()+"-"+year()+"@"+hour()+"_"+minute()+"_"+second()+"_"+millis()+".png");
    //println(name+lastName+"-ART-"+month()+"-"+day()+"-"+year()+"@"+hour()+"_"+minute()+"_"+second()+"_"+millis()+".png"+" SAVED");
    saveFrame(name+lastName+"-ART-"+month()+"-"+day()+"-"+year()+"@"+hour()+"_"+minute()+"_"+second()+"_"+millis()+".png");
    println(name+lastName+"-ART-"+month()+"-"+day()+"-"+year()+"@"+hour()+"_"+minute()+"_"+second()+"_"+millis()+".png"+" SAVED");
    }else{
      saveFrame(name+lastName+"-GRAPH-"+month()+"-"+day()+"-"+year()+"@"+hour()+"_"+minute()+"_"+second()+"_"+millis()+".png");
      println(name+lastName+"-GRAPH-"+month()+"-"+day()+"-"+year()+"@"+hour()+"_"+minute()+"_"+second()+"_"+millis()+".png"+" SAVED");
    }
    
  }
  else if (keyCode==82) {
    //R
    clearCanvas();
    x=x0;
    println("Animation reset");
  }

  //println(keyCode);
}




color backgroundColor;
//
PGraphics canvas, guiCanvas;

Boolean paused, gui;

PFont font;

//

float x0;

String name, lastName;

int zoomLevel;

int canvasWidth, canvasHeight;

//CURSOR

float cursorXtxtX;
float cursorXtxtY;
float cursorYtxtX;
float cursorYtxtY;

float cursorX;
float cursorY;

 String cursorXtxt;
  String cursorYtxt;

//

void updateCursor() {

  //CURSOR SCREEN COORDINATES
  cursorX= max(0, min(width*.5+x*zoomLevel, width));
  cursorY= max(0, min(height*.5-y*zoomLevel, height));

  //CURSOR coordinates in txt form
  cursorXtxt= String.format("%.1f", x);
  cursorYtxt= String.format("%.1f", y);

  //CURSOR TXT COORDINATES SCREEN CONSTRAINT


  cursorXtxtX=cursorX;
  cursorXtxtY=cursorY;

  cursorYtxtX= cursorX;
  cursorYtxtY= cursorY;

  if (x<0 && y>0) {

    cursorXtxtX=cursorX+15;
    cursorXtxtY=cursorY+15;

    cursorYtxtX= cursorX+15;
    cursorYtxtY= cursorY+30;
  }
  else if (x>0 && y<0) {

    cursorXtxtX=cursorX-45;
    cursorXtxtY=cursorY-30;

    cursorYtxtX= cursorX-45;
    cursorYtxtY= cursorY-15;
  }
  else if (x>0 && y>0) {

    cursorXtxtX=cursorX-45;
    cursorXtxtY=cursorY+15;

    cursorYtxtX= cursorX-45;
    cursorYtxtY= cursorY+30;
  }
  else if (x<0 && y<0) {

    cursorXtxtX=cursorX+15;
    cursorXtxtY=cursorY-30;

    cursorYtxtX= cursorX+15;
    cursorYtxtY= cursorY-15;
  }
}

//

void drawCursor() {

  //Draw cursor text
  textSize(16);
  text("x:"+cursorXtxt, cursorXtxtX, cursorXtxtY );
  text("y:"+cursorYtxt, cursorYtxtX, cursorYtxtY );

  //Draw Cursor
  fill(color(255-red(backgroundColor), 255-green(backgroundColor),255-blue(backgroundColor)));
  noStroke();
  ellipse(cursorX, cursorY, 10, 10);
}

//

void clearCanvas() {
  color clearCol = color(0, 0, 0, 0);
  canvas.loadPixels();
  for (int i = 0; i < canvas.width*canvas.height; i++) {
    canvas.pixels[i] = clearCol;
  }
  canvas.updatePixels();
}

//

void clearGuiCanvas() {
  color clearCol = color(0, 0, 0, 0);
  guiCanvas.loadPixels();
  for (int i = 0; i < guiCanvas.width*guiCanvas.height; i++) {
    guiCanvas.pixels[i] = clearCol;
  }
  guiCanvas.updatePixels();
}



void setupGuiCanvas() {

  //
}

void drawGuiCanvas() {
  
   guiCanvas.noFill();
   guiCanvas.strokeWeight(.01);
   guiCanvas.stroke(color(255-red(backgroundColor), 255-green(backgroundColor),255-blue(backgroundColor)));
  
  //Grid
  for (int gridX=0; gridX<=100;gridX+=1) {
    
    guiCanvas.line(gridX, -height*.5, gridX, height*.5);
    guiCanvas.line(-gridX, -height*.5, -gridX, height*.5);
  }
  
  for (int gridY=0; gridY<=100;gridY+=1) {
    
    guiCanvas.line(-width*.5,gridY,width*.5 , gridY);
    guiCanvas.line(-width*.5,-gridY,width*.5 , -gridY );
  }
  
  //AXIS
  guiCanvas.noStroke();
  guiCanvas.fill(color(255-red(backgroundColor), 255-green(backgroundColor),255-blue(backgroundColor)));
  guiCanvas.rect(-width*.5, 0, width,.025); //X-AXIS
  guiCanvas.rect(0,height*.5, .025,-height); //Y-AXIS  
  
}



