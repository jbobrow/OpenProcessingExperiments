
// an unusual way to create shaped buttons with Processing

PImage button;        //image of the buttons (visible)
PImage buttoncolmap;  //colormap of the buttons (hidden)

String[] buttonstring={"quadrat","thumb up","smile","envelope",
                        "flower","rectangle","oval","fivestar",
                        "circle","four star","banner","boom",
                        "textfield",""}; //the names of the buttons
color[] buttoncolor={0xFF0000FF,0xFF00FFFF,0xFF00FF00,0xFFFFFF00,
                        0xFFFF0000,0xFFFF00FF,0xFF9900CC,0xFFFF6600,
                        0xFFFF99CC,0xFF663333,0xFF66FFCC,0xFF99FF00,
                        0xFFFFFF66,0xFFFFFFFF}; //the colors of the buttons

String textfield="";

PFont font;

void setup ()
  {
    size(800,600,JAVA2D);
    smooth();
    noLoop();
    //noCursor();
    font=loadFont("CourierNewPS-BoldMT-48.vlw");
    textFont(font);
    button=loadImage("button.png");
    buttoncolmap=loadImage("colormap.png");     
  }
  
void draw()
  {
  background(button);
  fill(0);
  textAlign(CENTER);
  text(textfield,400,205);
  }
  
void mouseReleased()
  {
    color testcolor=0;
    testcolor=buttoncolmap.get(mouseX,mouseY); //get the color in the hidden image
    //println("0x"+hex(testcolor));
    
    for(int i=0;i<buttonstring.length;++i) //check the color and copy the name of the button
      {
        if(testcolor==buttoncolor[i])
          textfield=buttonstring[i];
      }
    
    redraw();
  }
    

