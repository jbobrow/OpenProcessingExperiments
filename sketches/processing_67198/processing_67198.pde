
int numCircle = 10;

float[] cirX = new float[numCircle];
float[] cirY = new float[numCircle];
float[] directionX = new float[numCircle];
float[] directionY = new float[numCircle];

float gravity = 0.5;

void setup(){
  size(400, 400);
  smooth();
  noStroke();
   
  for(int i = 0; i < numCircle; i++)
  {
    cirX[i] = int(random(10, 300));
    cirY[i] = int(random(10, 300));
    directionX[i] = random(1,10);
    directionY[i] = random(1,10);
  }
}

void draw(){
    background(255);
    fill(20, 20, 20, 40);
    
    drawFlyingCircle();
    drawDefaultCircle();
    drawLightColorOfDefaultCircle();
}

//move mouse to top section of canvas
void drawDefaultCircle()
{
    if (mouseY < height/2)
    {
        for (int k = 0; k < 10; k++) {
            fill(80*k, k*20, 10, 50);
            ellipse(width/2, height/2, k*2, k*2);
        }
    }
}

//move mouse to buttom right section of canvas
void drawFlyingCircle()
{
    for(int i=0; i < numCircle; i++)
    {
        if (mouseX < width/2 && mouseY > height/2) {
            if((cirX[i] > 400) || (cirX[i] < 0)){
                directionX[i] = -directionX[i];
            } else if((cirY[i] > 400) || (cirY[i] < 0)){
              directionY[i] = -directionY[i];
            }
            ellipse(cirX[i], cirY[i], 20, 20);
      
            cirX[i] = cirX[i] + directionX[i];
            cirY[i] = cirY[i] + directionY[i];
        }
    }
}

//move mouse to bottom right section of canvas
void drawLightColorOfDefaultCircle()
{
   if (mouseX < width/2 && mouseY > height/2)
    {
        for(int i = 0; i < 10; i++)
        {
            fill(20*i, i*10, 20, 50);
            ellipse(width/2, height/2, i*20, i*20);
        }
    }
    else {
        for (int k = 0; k < 10; k++)
        {
            fill(0*k, k*6, 30, 50);
            ellipse(width/2, height/2, k*20, k*20);
        }
    }
}

