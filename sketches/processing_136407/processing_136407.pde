
// My intent was to create a dynamic brush that one could use to paint with.
// As you drag the mouse, the bird follows you, flapping his wings, leaving
// behind a trail of color.  As you move to the right, he banks to the right.
// As you move to the left, he banks to the left.

final int CANVAS_WIDTH = 800;
final int CANVAS_HEIGHT = 800;
final color BACKGROUND_COLOR = #000000;


final int FLAP_SPEED_DEFAULT = 3;
final int FLAP_PHASE_DEFAULT = 1;
final float FLAP_ANGLE_DEFAULT = 0.0;
final boolean DRAW_SHAPE_DEFAULT = true;
final boolean IS_FLAPPING_DEFAULT = true;
final boolean IS_BANKING_DEFAULT = true;
final boolean SHOW_TRAILS_DEFAULT = false;
final float ZOOM_FACTOR_DEFAULT = 1.0;
final float ZOOM_FACTOR_INCREMENT = 1.1;
final float ZOOM_FACTOR_MIN = 0.1;
final float ZOOM_FACTOR_MAX = 30.0;

final float ROTATION_DEFAULT = 0.0;
final float FLAP_ANGLE_MIN = -3.0*PI/8.0;
final float FLAP_ANGLE_MAX = PI/4.0;
final float FLAP_INCREMENT = (FLAP_ANGLE_MAX - FLAP_ANGLE_MIN) / 40.0;
final float ROTATE_INCREMENT = FLAP_INCREMENT/4.0;
final boolean MIRROR_PAN_DEFAULT = true;

final boolean IS_RECORDING_DEFAULT = false;
final int RECORDING_FRAME_SKIP = 10;
final boolean SHOW_INFO_DEFAULT = true;
final boolean SHOW_HELP_DEFAULT = true;


int lastX = 0;
int lastY = 0;

boolean mirrorPan = MIRROR_PAN_DEFAULT;

float zoomFactor = ZOOM_FACTOR_DEFAULT;
float rotation = ROTATION_DEFAULT;
boolean showTrails = SHOW_TRAILS_DEFAULT;
boolean drawShape = DRAW_SHAPE_DEFAULT;

float flapAngle = FLAP_ANGLE_DEFAULT;
int flapPhase = FLAP_PHASE_DEFAULT;
int flapSpeed = FLAP_SPEED_DEFAULT;

boolean isFlapping = IS_FLAPPING_DEFAULT;
boolean isBanking = IS_BANKING_DEFAULT;

boolean isRecording = IS_RECORDING_DEFAULT;
int recordingFrame = 0;
String recordToBaseFilename = "";

boolean showInfo = SHOW_INFO_DEFAULT;
boolean showHelp = SHOW_HELP_DEFAULT;
boolean userHasBegunInteractingWithCanvas = false;




void setup()
{
  size(800, 800);
  background(BACKGROUND_COLOR);
  text("",0,0); // Initialize the fonts, so that there isn't a lag and white screen at start.
  
  text("Press 'D' to begin drawing!", width/3, height/2);
  text("Press 'H' for a list of additional commands.", width/3, height/2+15);
  
  // Set variables so that nothing draws initially, except for the helpful hint, above.
  drawShape = false;
  showHelp = false;
  showInfo = false;
}


void draw()
{
  float x = mouseX;
  float y = mouseY;
  
  if (mirrorPan)
  {
    x = width - x;
    y = height - y;
  }
 
  if (!showTrails && userHasBegunInteractingWithCanvas)
  {
    background(BACKGROUND_COLOR);
  }

  if (isFlapping) 
  {
    flapAngle += flapPhase * FLAP_INCREMENT * flapSpeed;
    if (flapAngle > FLAP_ANGLE_MAX)
    {
      flapAngle = FLAP_ANGLE_MAX;
      flapPhase *= -1;
    }
    else if (flapAngle < FLAP_ANGLE_MIN)
    {
      flapAngle = FLAP_ANGLE_MIN;
      flapPhase *= -1;
    }
  }

  if (drawShape)
  {
    pushMatrix();
    translate(x,y); 
    scale(zoomFactor);
    rotate(rotation);
  
  
    stroke(#0000FF, 127);
    strokeWeight(3/zoomFactor);

    pushMatrix();
    rotate(-flapAngle);
    fill(#77FF00, 127);
    ellipse(20,0,40,10);
    popMatrix();
    
    pushMatrix();
    rotate(flapAngle);
    fill(#FF7700, 127);
    ellipse(-20,0,40,10);

    fill(#FFFF00, 127);
    ellipse(0,0,5,5);
    popMatrix();

    popMatrix();
  }
  
  
  if (showInfo)
  {
    stroke(127,127);
    strokeWeight(1);
    fill(#999900, 180);
    int row = 1;
    final int ROW_HEIGHT = 15;
    final int LABEL_X = 15;
    final int VALUE_X = 100;
    text("Scale:",    LABEL_X, row*ROW_HEIGHT);   text(zoomFactor,                 VALUE_X, row*ROW_HEIGHT); ++row;
    text("Bank:", LABEL_X, row*ROW_HEIGHT);   text(int(rotation*180.0/PI) + " deg", VALUE_X, row*ROW_HEIGHT); ++row;
    text("Flap speed:", LABEL_X, row*ROW_HEIGHT);   text(flapSpeed, VALUE_X, row*ROW_HEIGHT); ++row;
    if (isRecording)
    {
      text("RECORDING!",   LABEL_X, row*ROW_HEIGHT);
    }
    ++row;
  
    fill(31,63);
    rect(2,2,150,row*ROW_HEIGHT - 5);
  }
  
  
  if (showHelp)
  {
    int row = 1;
    stroke(127,127);
    strokeWeight(1);
    fill(#999900, 180);
    final int ROW_HEIGHT = 15;
    final int INSTRUCTIONS_X = 350;
    text("Hold the mouse button down and move up and down to change size.", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    text("Press 'T' to trails on/off.  Press 'D' to show/hide the bird.", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    text("Press 'M' to switch mouse following mode", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    text("Press 1-9 to change flapping speed.", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    text("Press 'F' to toggle flapping.  Press 'B' to toggle banking.", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    text("Press 'S' to capture a screen shot.  Press 'R' to continuously capture.", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    text("Press BACKSPACE to clear the screen.   Press 'DELETE' to reset all parameters.", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    text("Press 'H' to show/hide help.  Press 'I' to show/hide info details.", INSTRUCTIONS_X, row*ROW_HEIGHT);  ++row;
    
    fill(31,63);
    rect(INSTRUCTIONS_X-13,2,width - INSTRUCTIONS_X,row*ROW_HEIGHT - 5);
  }
  
  if (isRecording)
  {
     if (recordingFrame%RECORDING_FRAME_SKIP == 0)
     {
       captureScreenshot();
     }
     ++recordingFrame; 
  }
  
}



void keyPressed()
{
  switch(key)
  {
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9':
      flapSpeed = int(key-'1') + 1;
      break;
      
    case 'm':
    case 'M':
      mirrorPan = !mirrorPan;
      break;
      
    case 't':
    case 'T':
      showTrails = !showTrails;
      break;
      
    case 'd':
    case 'D':
      drawShape = !drawShape;
      userHasBegunInteractingWithCanvas = true;
      break;

    case 'f':
    case 'F':
      isFlapping = !isFlapping;
      break;

    case 'b':
    case 'B':
      isBanking = !isBanking;
      break;

    case 's':
    case 'S':
      captureScreenshot();
      break;

    case 'r':
    case 'R':
      isRecording = !isRecording;
      recordingFrame = 0;
      break;

    case BACKSPACE:
      background(BACKGROUND_COLOR);
      break;
      
    case DELETE:
      mirrorPan = MIRROR_PAN_DEFAULT;
      
      zoomFactor = ZOOM_FACTOR_DEFAULT;
      rotation = ROTATION_DEFAULT;
      drawShape = DRAW_SHAPE_DEFAULT;
      
      flapAngle = FLAP_ANGLE_DEFAULT;
      flapPhase = FLAP_PHASE_DEFAULT;
      flapSpeed = FLAP_SPEED_DEFAULT;
      
      isFlapping = IS_FLAPPING_DEFAULT;
      isBanking = IS_BANKING_DEFAULT;
      break;
      
    case 'i':
    case 'I':
      showInfo = !showInfo;
      break;
      
    case 'h':
    case 'H':
      showHelp = !showHelp;
      break;
   
  }
}



void mousePressed()
{
  lastY = mouseY;
  lastX = mouseX;
}


void mouseDragged()
{
  if (mouseY < lastY)
  {
    zoomFactor *= ZOOM_FACTOR_INCREMENT;
    if (zoomFactor > ZOOM_FACTOR_MAX)
    {
      zoomFactor = ZOOM_FACTOR_MAX;
    }
  }
  else if (mouseY > lastY)
  {
    zoomFactor /= ZOOM_FACTOR_INCREMENT;
    if (zoomFactor < ZOOM_FACTOR_MIN)
    {
      zoomFactor = ZOOM_FACTOR_MIN;
    }
  }
  
  // Also, call mouseMoved to handle the rotation
  mouseMoved();
  
  lastY = mouseY;
  lastX = mouseX; 
}


void mouseMoved()
{
  if (isBanking)
  {
    if (mouseX < lastX)
    {
      rotation += ROTATE_INCREMENT;
      while (rotation > TWO_PI)
      {
        rotation -= TWO_PI; 
      } 
    }
    else if (mouseX > lastX)
    {
      rotation -= ROTATE_INCREMENT;
      while (rotation < -TWO_PI)
      {
         rotation += TWO_PI;
      } 
    }
  }
  
  lastY = mouseY;
  lastX = mouseX; 
}



void captureScreenshot()
{
    if (!isRecording || recordingFrame == 0)
    {
       recordToBaseFilename = 
          year()+nf(month(),2)+nf(day(),2)+"-"+nf(hour(),2)+nf(minute(),2)+nf(second(),2)+"-"+nf(millis(),6)+"-";
    }
    
    String filename = recordToBaseFilename + nf(recordingFrame/RECORDING_FRAME_SKIP,3) + ".png"; 
    
    println(filename);
    save(filename);
}




