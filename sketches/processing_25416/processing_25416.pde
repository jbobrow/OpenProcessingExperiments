



// import processing.opengl.*;

// Gravity Swarm
// Claudio Gonzales, March 2010
// Albuquerque, New Mexico



particle[] Z = new particle[8000];
float colour = random(1);
int depth;

int PosX=0; 
int PosY=0; 

int PosX_Add=3; 
int PosY_Add=2; 

// text stuff for the help (F1)
PFont font;
boolean boolHelpModus = false; 
boolean boolShowSpecialMessage = false; 
String SpecialText = ""; 

// Pause
boolean bStop;

// for the image
String savePath = "";

void setup() {
  size(700,700,P3D);  
  // size(screen.width,screen.height,P3D);

  smooth();
  depth = width;
  //background(255);
  //frameRate(25);

  font = createFont("FFScala-32.vlw",12); 
  textFont(font); 


  float n = 100;
  float px, py, pz;
  float m, v, theta, phi;

  for(int k = 0; k < n; k++) {
    px = random(width);
    py = random(height);
    pz = random(depth);
    m = random(50);
    for(int i = int((Z.length-1000)*k/n); i < int((Z.length-1000)*(k+1)/n); i++) {
      v = sq(random(sqrt(m)));
      theta = random(TWO_PI);
      phi = random(TWO_PI);
      Z[i] = new particle( px+v*cos(phi)*cos(theta), py+v*cos(phi)*sin(theta), pz+v*sin(phi), 5, 0, 0, 1 );
    }
  }
  px = width/2;
  py = height/2;
  for(int i = Z.length-1000; i < Z.length; i++) {
    pz = random(depth);
    v = sq(random(sqrt(width/4)));
    theta = random(TWO_PI);
    Z[i] = new particle( px+v*cos(theta), py+v*sin(theta), pz, 0, 0, 0, 1 );
  }

  /*
  for(int i = 0; i < Z.length; i++) {
   r = i/float(Z.length);
   Z[i] = new particle( random(width), r*height, depth/2, 0, 0, 0, 1 );
   }
   */

  background(0);
  frameRate(60);
  keyPressedFAKE();  
  noCursor();
}

void draw() {

  colorMode(RGB,255);
  if (random(1000)>998) {
    background(0);
  }

  // background(0);

  float r;

  int valueToDo=0;

  filter(INVERT);

  //  PosX=int(random(0,width));
  //  PosY=int(random(0,height));  

  //  PosX=int(random(-1900,2*width));
  //  PosY=int(random(-1900,2*height));  

  if (random(1000)>998) {
    PosX=int(random(-19,width+50));
    PosY=int(random(-19,height+50));
  }

  //  PosX+=PosX_Add; 
  //  PosY+=PosY_Add; 

  // reflect ---------------
  reflect () ; 

  // stroke(color(255,0,0));
  // line (PosX,PosY, PosX+4,PosY);
  // rect  (PosX,PosY, 4,4);

  if (random(1000)>993) {
    valueToDo=int(random(100));
  }

  for(int i = 0; i < Z.length; i++) {

    PosX+=PosX_Add; 
    PosY+=PosY_Add; 
    reflect () ; 
    /*
    if( mousePressed && mouseButton == LEFT ) {
     Z[i].gravitate( new particle( PosX, PosY, depth/2, 0, 0, 0, 0.75 ) );
     }
     else if( mousePressed && mouseButton == RIGHT ) {
     Z[i].repel( new particle( PosX, PosY, depth/2, 0, 0, 0, 1 ) );
     }
     else {
     Z[i].deteriorate();
     } */

    // PosX=int(random(0,width));
    // PosY=int(random(0,height));  

    // Z[i].gravitate( new particle( PosX, PosY, depth/2, 0, 0, 0, 0.75 ) );

    if( valueToDo<43 ) {
      Z[i].gravitate( new particle( PosX, PosY, depth/2, 0, 0, 0, 0.75 ) );
    }
    else if( valueToDo<88 ) {
      Z[i].repel( new particle( PosX, PosY, depth/2, 0, 0, 0, 1 ) );
    }
    else {
      // Z[i].deteriorate();
    } 

    Z[i].update();
    r = float(i)/Z.length;
    colorMode(HSB,1);
    if( Z[i].magnitude/100 < 0.1 ) {
      stroke( colour, pow(r,0.1), 0.9*sqrt(1-r), Z[i].magnitude/100+abs(Z[i].z/depth)*0.05 );
    }
    else {
      stroke( colour, pow(r,0.1), 0.9*sqrt(1-r), 0.1+abs(Z[i].z/depth)*0.05 );
    }
    Z[i].display();
  }

  colour+=random(0.01);
  colour = colour%1;

  if (random(1000)>998) {
    keyPressedFAKE();
  }

  filter(INVERT);
}

void reflect () {
  if (PosX>width) {
    PosX_Add= -abs(PosX_Add);
    ChangeAddendum ();
  }
  if (PosY>height) {
    PosY_Add= -abs(PosY_Add);
    ChangeAddendum ();
  }

  if (PosX<1) {
    PosX_Add= abs(PosX_Add);
    ChangeAddendum ();
  }
  if (PosY<1) {
    PosY_Add= abs(PosY_Add);
    ChangeAddendum ();
  }
}

void ChangeAddendum () {

  if (random(1000)>500) {
    PosX_Add += random(-1,1);
  }
  if (random(1000)>500) {
    PosY_Add += random(-1,1);
  }

  if (PosX_Add==0) {
    PosX_Add= 2;
  }
  if (PosY_Add==0) {
    PosY_Add= 2;
  }
}

void keyPressed() {
  // if showing help
  if (boolHelpModus) {
    // end help-mode
    loop();
    boolHelpModus=false; 
    key=0;
    background(0);
  }

  else 
  {
    // normal evaluation of the key
    EvaluateKey();
  } // else
} // function 

void EvaluateKey() {

  if (key == CODED) {

    switch (keyCode) { 
    case KeyEvent.VK_F1: 
      // F1 
      background(0); 
      ShowText(HelpText() +  "\nPress any key...");
      // println(HelpText());
      boolHelpModus=true ; 
      noLoop(); 
      break; 
    default:
      // do nothing
      break;
    } // switch
  }  // if (key == CODED)

  else {

    // key is not coded
    switch (key) { 
    case 'n':
      background(0);
      break; 
    case ' ':
      keyPressedFAKE();
      break; 
    case 'i':
      try {
        savePath = selectOutput();  // Opens file chooser	
        if (savePath != null) 
        {	
          saveFrame(savePath);
        }
      } // try
      catch (Exception e11) { 
        println("Error occured during 'i' - save image." );
        println(savePath+"\n");
        savePath="";
        e11.printStackTrace();
      } // catch 
      break; // i
    case 'j':
      save ("swarm.tif");
      break;      
    case 'p':
      // pause 
      bStop = !bStop;  
      if (bStop) {    
        noLoop();
      }
      else {   
        loop();
      }
      break; // 'p'
    default: 
      // do nothing 
      break;
    } // switch
  } // else (key is not coded)
} // function 

void keyPressedFAKE() {

  // toggles the swarm mode (5 ways of swarming)

  // if( key == ' ' ) {

  float r;
  float choice = random(1);

  choice = 16;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  // choice = 13;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  // choice = 0;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  // choice = 0.3;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  // choice = 0.5;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  // choice = 0.7;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  // choice = 0.9;  // !!!!!!!!!!!!!!!!!!!!!!!!!!!! 
  // choice = random(1);

  for(int i = 0; i < Z.length; i++) {

    r = i/float(Z.length);

    if ( choice > 15 ) {

      // println (choice); 
      int steps = Z.length;

      //for (int i2 = 0; i < steps; i++) {
      float t = i / float(steps);
      float x = bezierPoint(0, 510, 590, 0, t);
      float y = bezierPoint(0, 210, 290, height, t);
      float z = bezierPoint(-120, -110, -190, -180, t);  
      // ellipse(x, y, 5, 5);

      // Z[i].reset( x, y, z, 0, 0, 0, 1 );
      // Z[i].reset( map (i,0,Z.length,0,width), 400, -200, 0, 0, 0, 1 );      
      Z[i].reset( map (i,0,Z.length,200,width-200), 600, map (i,0,Z.length,-10,-600), 0, 0, 0, 1 );            
      // } // for
    } // if

    else if( choice > 12 ) {
      Z[i].reset( r+222, 333, -111, 0, 0, 0, 1 );
    }

    else if( choice > 0.8 ) {
      // Slice, like  \ 
      Z[i].reset( r*width, r*height, random(depth), 0, 0, 0, 1 );
    }

    else if( choice > 0.6 ) {
      // Plane
      Z[i].reset( random(width), r*height, depth/2, 0, 0, 0, 1 );
    }

    else if( choice > 0.4 ) {
      // like X or cross 
      if( r < 0.5 )
        Z[i].reset( (1-2*r)*width, 2*r*height, 2*r*depth, 0, 0, 0, 1 );
      else
        Z[i].reset( (1-(2*r-1))*width, (1-(2*r-1))*height, (2*r-1)*depth, 0, 0, 0, 1 );
    }

    else if( choice > 0.2 ) {
      // Smooth Curve
      Z[i].reset( (1-r)*width, sqrt(r)*height, r*depth, 0, 0, 0, 1 );
    }

    else { 
      // Swirl
      Z[i].reset( height/2+r*cos(r*10*PI)*height/2, height/2+r*sin(r*10*PI)*height/2, r*depth, 0, 0, 0, 1 );
    }
  }

  // } //  if
}

void ShowText (String MyText) {
  // cam.beginHUD();
  fill(color(0,555,255));
  // stroke(color(4));  
  textMode(SCREEN);
  if (boolShowSpecialMessage) {   
    text(SpecialText, 40,45);
  } 
  else {
    text(MyText, 40,45);
  }
  // textMode(MODEL);
  // cam.endHUD();
} // function 

// ---------------------------------------------------------------

String HelpText () {

  String Buffer = ""; 

  //   Buffer

  Buffer = "=== HELP === " +  "\n " +  "\n"; 
  Buffer = Buffer + "Gravity Swarm\n" ; 
  Buffer = Buffer + "Claudio Gonzales, March 2010\n"; 
  Buffer = Buffer + "Albuquerque, New Mexico\n\n";
  Buffer = Buffer + "Minor changes by polar to use as Screensaver\n\n";  

  Buffer = Buffer + "You reach this help via F1." ;  
  Buffer = Buffer + "\n " ;    
  Buffer = Buffer + "This is basically a screen saver. \n" ;   

  Buffer = Buffer + "Therefore it has some automatic functions\n";
  Buffer = Buffer + "to let the swarm move, change the swarm \n"; 
  Buffer = Buffer + "pattern from time to time (use space to inforce this)\n"; 
  Buffer = Buffer + "and to clear the screen from time to time (use n to inforce this)\n";   
  Buffer = Buffer + "\n "  ;   
  Buffer = Buffer + "If you download it, use \n";
  Buffer = Buffer + "  size(screen.width,screen.height,P2D); and present-mode"  ;     
  Buffer = Buffer + "\n "  ;   
  Buffer = Buffer + "\n "  ;   
  Buffer = Buffer + "\n "  ;     
  Buffer = Buffer + " ------ Keys to use  --------"  ; 
  Buffer = Buffer + "\n\n"  ; 
  Buffer = Buffer + "F1 - help\n"  ; 
  Buffer = Buffer + "p - pause on/off\n"  ;   
  Buffer = Buffer + "i - image save (when running sketch offline)\n"  ;   
  Buffer = Buffer + "Space-key - change current swarm figure \n"  ;   
  Buffer = Buffer + "n - clear screen \n"  ; 
  Buffer = Buffer + "ESC - quit .\n"  ;   
  Buffer = Buffer + "\n "  ;
  Buffer = Buffer + ""  ; 
  Buffer = Buffer + " "  ;
  Buffer = Buffer + " "  ;

  return (Buffer);
} // function  


