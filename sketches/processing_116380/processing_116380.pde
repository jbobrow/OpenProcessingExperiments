
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/7554*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */

// an unusual way to create shaped buttons with Processing
// now works with JavaScript mode

/* @pjs preload="button.png, colormap.png"; */

PImage button;        //image of the buttons (visible)
PImage buttoncolmap;  //colormap of the buttons (hidden)

String[] buttonstring={"quadrat","thumb up","smile","envelope",
                        "flower","rectangle","oval","fivestar",
                        "circle","four star","banner","boom",
                        "textfield",""}; //the names of the buttons
color[] buttoncolor={0x0000FF,0x00FFFF,0x00FF00,0xFFFF00,
                        0xFF0000,0xFF00FF,0x9900CC,0xFF6600,
                        0xFF99CC,0x663333,0x66FFCC,0x99FF00,
                        0xFFFF66,0xFFFFFF}; //the colors of the buttons

String textfield="";


void setup ()
  {
    size(800,600);
    smooth();
    textSize(48);
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
    testcolor=buttoncolmap.get(mouseX,mouseY)& 0xFFFFFF; //get the color in the hidden image
    //println("0x"+hex(testcolor & 0xFFFFFF));
    
    for(int i=0;i<buttonstring.length;++i) //check the color and copy the name of the button
      {
        if(testcolor==buttoncolor[i])
            {
            textfield=buttonstring[i];
            }
      }
  }
    


