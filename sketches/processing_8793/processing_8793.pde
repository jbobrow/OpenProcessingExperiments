
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

int finger_x; //x position
int finger_y; //y position
int finger_fade=0; //
int finger_millis;
 
void setup () 
  { 
    size(800,600,JAVA2D); 
    smooth(); 
    //noCursor(); 
    font=loadFont("CourierNewPS-BoldMT-48.vlw"); 
    textFont(font); 
    button=loadImage("button.png"); 
    buttoncolmap=loadImage("colormap.png"); 
    ellipseMode(CENTER); 
    noStroke();   
  } 
   
void draw() 
  { 
  background(button); 
  
  fill(0); 
  textAlign(CENTER); 
  text(textfield,400,205);
  
  fill(0,finger_fade);
  ellipse(finger_x,finger_y,50,50);
  
  if (millis()>finger_millis)
    {
      finger_millis=millis()+10; //fade every 10 milliseconds
      --finger_fade;
      if(finger_fade<0)
        finger_fade=0;
    }
  } 
   
void mouseReleased() 
  { 
    finger_x=mouseX; //set position and reset fader
    finger_y=mouseY;
    finger_fade=80;
    
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
     


