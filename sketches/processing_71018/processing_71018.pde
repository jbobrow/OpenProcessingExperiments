
// Contains multiply particles with all there frames;
ArrayList FramesList = new ArrayList();
int FrameCount;
int cellSize;

PFont font;

void mousePressed()
{
  framecounter = 0;
}

void keyPressed()
{
  FramesList.clear(); 

  for (int i=0;i<12;i++)
    FramesList.add(GenerateParticle());
}

void setup()
{
  size(751,751);
  
  for (int i=0;i<12;i++)
    FramesList.add(GenerateParticle());

  cellSize = ceil(sqrt(FrameCount));  
  // Javascript does not support changing size after any code has been run
  // and it actully really dosnt like anything being run, even simple mathematic operations.
  //size(cellSize*125+1, cellSize*125+1);
  
  noStroke();

  font = loadFont("Calibri-10.vlw");
}

int framecounter=0;
void draw()
{
  background(0);
  
  fill(255,155);
  int fc = 0; // running out of variable names I can trust. fc = frame counter;
  for (int i=0;i<=cellSize;i++)
  {
      stroke(255,30);
      line(0, 125*i, width, 125*i);
            
      for(int n=0;n<=cellSize;n++)
      {
        stroke(255,5);
        line(125*i, 0, 125*i, height);
        textFont(font,10);
        text(fc, n*125-115, i*125+15);
        fc+=1;
    }
    fc--;
  }

  noStroke();
  float offsetX = 0;
float offsetY = 0;
  // Print out each frame
  for(int framecounter=0;framecounter<FrameCount;framecounter++)
  {
    
    // Print out pixel layout for each frame
    for (int i=0;i<FramesList.size();i++)
    {
      ParticleFrames particle = (ParticleFrames)FramesList.get(i);
            
      float x = particle.PosX[framecounter] + (offsetX * 125);
      float y = particle.PosY[framecounter] + (offsetY * 125);
      
      //x += (x*125) % (cellSize*125);
      //y += (y*125) % (cellSize*125);
      
      fill(255, particle.Opacity[framecounter]);
      rect(x+62, y+62, 1, 1);
    }
     
    offsetX++;
    if (offsetX > cellSize)
    {
      offsetX = 0;
      offsetY++;
    }
    if (offsetY>cellSize)
      offsetY=0;
  }

}

// Contains all the frames for a particle
class ParticleFrames
{
  float[] PosX;
  float[] PosY;
  float[] Opacity;
  int frameCounter = 0;

  ParticleFrames(int frame_count)
  {
    PosX = new float[frame_count];
    PosY = new float[frame_count];
    Opacity = new float[frame_count];

    FrameCount = frame_count;
  }

  void SaveFrame(float px, float py, float opacity)
  {
    PosX[frameCounter] = px;
    PosY[frameCounter] = py;
    Opacity[frameCounter] = opacity;

    frameCounter++;

    //println(px+","+py);
  }
}

// Returns a list of frames for that single particle
ParticleFrames GenerateParticle()
{ 
  float directionX = random(-1, 1);
  float directionY = random(-1, 1);
  float speed = random(2, 2.5);

  float psx = 0;
  float psy = 0;
  float opacity = 255;

  int frame_count = ceil(opacity / 8);
  ParticleFrames frames = new ParticleFrames(frame_count);

  while (opacity > 0)
  {
    psx += speed * directionX;
    psy += speed * directionY;

    opacity -= 8f;
    speed -= 0.05f;
    frames.SaveFrame(psx, psy, opacity);
  }

  return(frames);
}

