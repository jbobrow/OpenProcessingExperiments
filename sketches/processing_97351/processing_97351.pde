
//By Benjamin Van Citters
//import ddf.minim.*;

//uncomment these to get audio responsiveness
//Minim minim;
//AudioInput in;

float hts[][];// heightfield 
float cameraAngle = 0.f; //starting radian for the camera

//size of each trangles width and height
float wt = 10;
float ht = 10;  
  
//  
float[] dims;

int gridDims[];
float gridW;
float gridH;

void setup()
{
  noCursor();
  size(500,500,OPENGL);
  hts = new float[16][16];
  dims = new float[]{wt*hts.length,0,ht*hts[0].length};
 
   // sets out the number of the grids
  gridDims = new int[]{3,3};
  gridW = hts.length * wt; //total width of each grid
  gridH = hts[0].length * ht; //total height of each grid
 
 //uncomment these to get audio responsiveness
//  minim = new Minim(this);
//  // get a stereo line-in: sample buffer length of 2048
//  // default sample rate is 44100, default bit depth is 16
//  in = minim.getLineIn(Minim.MONO, 512);
}

void draw()
{
  //clear the background and the depth buffer
  background(0);
  
  //set the camera to be moving slowly in a circle...
  cameraAngle += .005;
  camera(cos(cameraAngle)*dims[0], -60, sin(cameraAngle)*dims[2], //eye position
         dims[0]/2, 10, dims[2]/2,// eye target position
         0.0, 1.0, 0.0);//up direction
  
  //turn on the lights so we can see yer shadows
  lights();  

//uncomment these to get audio responsiveness
//  //first we create our height field from the audio input
//  float waveForm[] = in.mix.toArray();
//remove this next line if you have the minim library
float waveForm[] = new float[512]; for(int i = 0; i < waveForm.length;i++)waveForm[i] = random(.25);
  for(int i = 0; i < hts.length-1; i++)
  {
    for(int j = 0; j < hts[i].length-1;j++)
    {
      // we interpolate the indices so that we can populate all heights even
      // if there isn't enough audio data (or not enough vertices)
      int indx = (int)(waveForm.length*(1.0*j*hts[i].length+i)/(hts.length*hts[i].length));
      hts[i][j] = (waveForm[indx]);
    }
  }
      
  //fill will be the color of the triangles
  fill(255);
  //stroke will be the color of the edges
  stroke(0);
  
  strokeWeight(2);
      
  //we're going to draw a grid of grids!
  for(int ii = -gridDims[0]/2; ii <= gridDims[0]/2; ii++)
  {    
    for(int jj = -gridDims[1]/2; jj <= gridDims[1]/2; jj++)
    {
      pushMatrix();      
     
      translate(gridW*ii,0,gridH*jj);
      
      //render a grid, one strip at a time
      for(int j = 0; j < hts.length-1; j++)
      { 
        beginShape(TRIANGLE_STRIP);
        for(int i = 0; i < hts[j].length-1;i++)
        {
          vertex(i*wt, hts[i][j]*-90,   j*ht);          
          vertex(i*wt, hts[i][j+1]*-90, (j+1)*ht); 
        }
        endShape();
      }
      popMatrix();
    }
  }
 
  println("frameRate: " + frameRate);
}


