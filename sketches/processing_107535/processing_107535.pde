
/*****************

  Just having fun with the processing built-in camera
  
  Author: Guilherme Martins

  http://artica.cc

******************/

float inc = 5.0;

int displayWidth = 800;
int displayHeight = 650;

float eyeX = 375;     //displayWidth/2.0;
float eyeY = 1200;    //displayHeight/2.0;
float eyeZ = 622;     //(displayHeight/2.0) / tan(PI*30.0 / 180.0);
float centerX = 405;  //displayWidth/2.0;
float centerY = 320;  //displayHeight/2.0;
float centerZ = 115;  //0.0;
float upX = 0;
float upY = 1;
float upZ = 0;

float xpos = -5;
float ypos = 755;
float zpos = 510;

float rX = -0.05;
float rY = 0.0;
float rZ = 63;

void setup()
{
  size(800, 600, OPENGL);
  noFill();
  stroke(255);
}

void draw()
{
  background(0);
  


  pushMatrix();
    
    camera(eyeX, eyeY, eyeZ, 
    centerX, centerY, centerZ, 
    upX, upY, upZ);    
  
    translate(width/2.0+xpos, height/2.0+ypos, zpos);
    
    
    
    
    rotateX(rX);
    rotateY(rY);
    rotateZ(rZ);
    
    rect(0,0,10,10);
    
    translate(-50, -50);
    rect(0,0,10,10);
  
    drawAxles();
    
    box(100, 50, 10);
  
  popMatrix();

  drawData();

  if (keyPressed == true)
    getKey();
}

void getKey() 
{

  switch(key) {
    
    /**********************
    
      rotate keys
    
    ***********************/
    
    case 'p': 
      rZ  += .05;
      break;
    
    case 'o': 
      rZ  -= .05;
      break;
      
    case 'i': 
      rY  += .05;
      break;
    
    case 'u': 
      rY  -= .05;
      break;
      
    case 'ç': 
      rX  += .05;
      break;
    
    case 'l': 
      rX  -= .05;
      break;
    
    
    /**********************
    
      translate keys
    
    ***********************/

    case 'z': 
      xpos  += inc;
      break;
    
    case 'x': 
      xpos  -= inc;
      break;
    
    case 'c': 
      ypos  += inc;
      break;
    
    case 'v': 
      ypos  -= inc;
      break;

    case 'b': 
      zpos  += inc;
      break;
    
    case 'n': 
      zpos  -= inc;
      break;
    
    
    /**********************
    
      camera keys
    
    ***********************/
    
    // eye X Y Z  

  case '1': 
    eyeX  += inc;
    break;

  case '2': 
    eyeX  -= inc;
    break;

  case '3': 
    eyeY  += inc;
    break;

  case '4': 
    eyeY  -= inc;
    break;

  case '5': 
    eyeZ  += inc;
    break;

  case '6': 
    eyeZ  -= inc;
    break;

    // center X Y Z

  case 'q': 
    centerX  += inc;
    break;

  case 'w': 
    centerX  -= inc;
    break;

  case 'e': 
    centerY  += inc;
    break;

  case 'r': 
    centerY  -= inc;
    break;

  case 't': 
    centerZ  += inc;
    break;

  case 'y': 
    centerZ  -= inc;
    break;

    // up X Y Z
    
  case 'a': 
     upX  += .2;
     break;
     
  case 's': 
     upX  -= .2;
     break;
     
  case 'd': 
     upY  += .2;
     break;
     
  case 'f': 
     upY  -= .2;
     break;
     
  case 'g': 
     upZ  += .2;
     break;
     
  case 'h': 
     upZ  -= .2;
     break;
     
  }
}

void drawAxles()
{
  line(0, 0, 0, 100, 0, 0);
  text("x", 100, 0, 0);
  line(0, 0, 0, 0, 100, 0);
  text("y", 0, 100, 0);
  line(0, 0, 0, 0, 0, 100);
  text("z", 0, 0, 100);
}

void drawData()
{
  pushMatrix();
  translate(20, 450);
  text("keys", 0, -180);
  
  text("ç,l       rotateX: "+rX, 0, -160);
  text("i,u       rotateY: "+rY, 0, -140);
  text("p,o      rotateZ: "+rZ, 0, -120);
  
  text("z,x      xpos: "+xpos, 0, -80);
  text("c,v       ypos: "+ypos, 0, -60);
  text("b,n      zpos: "+zpos, 0, -40);
  
  text("1,2      eyeX: "+eyeX, 0, 0);
  text("3,4      eyeY: "+eyeY, 0, 20);
  text("5,6      eyeZ: "+eyeZ, 0, 40);
  text("q,w      centerX: "+centerX, 0, 60);
  text("e,r        centerY: "+centerY, 0, 80);
  text("t,y        centerZ: "+centerZ, 0, 100);
  text("a,s       upX: "+upX, 0, 120);
  text("d,f       upY: "+upY, 0, 140);
  text("g,h       upZ: "+upZ, 0, 160);
  
  popMatrix();
}


