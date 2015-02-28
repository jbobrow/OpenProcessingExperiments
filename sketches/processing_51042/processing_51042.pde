
/*Spring Eyes
Anna Lotko
CTIN 544

Press the mouse down to make they eyes pop out on springs
The longer you hold the mouse down, the further they will fall
*/


float angle = 0.0;
PImage glasses;


void setup() 
{
  size(640, 480);
  smooth();
  strokeWeight(2);
  ellipseMode(CORNER);
  glasses = loadImage("glasses.png");
}

void draw()
{
  background(255);
  
  //loading the glasses image
  
  image(glasses, 0, 0);

  noFill();

  //left glasses & spring
  float d = dist( mouseX,mouseY, 137.927,23.609);
  float mx = map(d, 250.0,0, 0.05,0.4);
  float springA = 0.5+sin(angle); //horizontal motion
  float jiggleA = random(-0.05,0.05); //lateral motion
 
  //right glasses & spring
  float g = dist( mouseX,mouseY, 360.328,24.065);
  float nx = map(d, 250.0,0, 0.05,0.4);
  float springB = 0.5+sin(angle); //horizontal motion
  float jiggleB = random(-0.05,0.05); //lateral motion
 
  float i = 0;
  float j = 0;
  
  //if the mouse is pressed, draw an ellipse that springs (trig) and jiggles (random)
  if (mousePressed == true)
  {
    for(i = 0; i<(springA*200); i+=(springA*10)) 
    {
      ellipse(137.927+(i*jiggleA),23.609+i, 141.745,141.745);
      
    }
    
    for(j = 0; j<(springB*200); j+=(springB*10))
    {
      ellipse(360.328+(j*jiggleB),24.065+j, 141.745,141.745);
    }
  }
  
  
  fill(255);
  ellipse(137.927+(i*jiggleA),23.609+i, 141.745,141.745);
  ellipse(360.328+(i*jiggleB),24.065+i, 141.745,141.745);
  
  //shape(bloodshotTest, 137.927+(i*jiggleA), 23.609+i);
  
  //2 pupils, the parameters tell the fuction to confine the pupil to 
  //the boundary of the eyeglasses (ellipse)
  eyeball(137.927+(i*jiggleA), 23.609+i);
  eyeball(360.328+(j*jiggleB), 24.065+j);
  
  
  angle +=mx/2;
  
}

//the pupil
void eyeball(float positionX, float positionY) 
{
  
  fill(0);
  //maps the pupil to a boundary determined by the function's parameters
  float pupilX = map(mouseX, 0, width, positionX+(141.745/4),positionX-(141.745/4));
  float pupilY = map(mouseY, 0, height, positionY+(141.745/4),positionY-(141.745/4));
  ellipse(pupilX+(141.745/2)-10, pupilY+(141.745/2)-10, 20,20);
  
}

  
 

