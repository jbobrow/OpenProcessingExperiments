
class Grid implements Instrument
{
  /*UGens*/
  Wavetable wav;
  Oscil osc;
  Multiplier amp;

  /*Width & height*/
  public int size;

  /*Cell states*/
  public boolean[][] state;

  /*Display settings*/
  private PImage img; 
  color colour = color(random(155)+100, random(155)+100, random(155)+100, (255/numGrids-1));
  private float red = random(155)+100;
  private float blue = random(155)+100;
  private float green = random(155)+100;
  private float alpha = 255/numGrids;
  private float cellSize;
  boolean hasRetriggered;
  
  /*Timing*/
  int numSteps;

  /*Update modes*/
  int mode = rint(0, numUpdateModes);
  boolean scrollRight = coin();
  boolean scrollDown = coin();

  /*Identity*/
  int id;

  Grid(int id, int size, int numSteps)
  {
    this.size = size;
    this.state = new boolean[size][size];
    this.numSteps = numSteps;
    updateRandom(state);

    //Display
    this.cellSize = (width - borderSize * 2) / float(size);

    //Frequency
    float freq = 0;

    if(isDetuned)
    {
      freq += random(thisMaxDetune) * 2 - 1;
    }

    switch(freqMode)
    {
    case RANDOM:
      freq = rfloat(minFrequency, maxFrequency);
      break;
    case DRONE:
      freq = baseFreq;
      break;
    case HARMONIC:
      freq = baseFreq * (id + 1);
      break;
    case LOW:
      freq = random(200);
      break;
    }
   

    /*Ugens*/
    this.wav = new Wavetable(wavetableLength);
    this.osc = new Oscil(freq, 0.5, this.wav);
    this.amp = new Multiplier(0.2);

    this.osc.patch(this.amp).patch(master.input);
    dac.playNote(0.000000000001, 0.000000000001, this);

    hasRetriggered = true;
  }

  void noteOn(float dur)
  {
    updateStates();
    updateWavetable();

    float time = numSteps * stepTime;
    dac.playNote(time, 0.0000000000001, this);
  }

  private void updateStates()
  {
    switch(mode)
    {
    case RANDOM:
      updateRandom(state);
      break;
    case SCROLL_X:
      updateScrollX(state);
      break;
    case SCROLL_Y:
      updateScrollY(state);
      break;
    case SCROLL_XY:
      updateScrollX(state);
      updateScrollY(state);
      break;
    case SCROLL_RANDOM:
      scrollRight = coin();
      scrollDown = coin();
      updateScrollX(state);
      updateScrollY(state);
      break;
    case LIFE:
      updateLife(state);
      break;
    }
  }

  /**
   Update methods
   */
  private void updateRandom(boolean[][] array)
  {
    for (int i=0; i<array.length; i++)
    {
      for (int ii=0; ii<array.length; ii++)
      {
        array[i][ii] = coin();
      }
    }
  }

  private void updateScrollX(boolean[][] array)
  {
    if (scrollRight)
    {
      //Shift columns
      for (int i=array.length-1; i>0; i--)
      {
        for (int ii=0; ii<array.length; ii++)
        {
          {
            array[i][ii] = array[i-1][ii];
          }
        }
      }

      //populate first Column
      for (int i=0; i<array.length; i++)
      {
        array[0][i] = coin();
      }
    }
    else
    {
      //Shift columns
      for (int i=0; i<array.length-1; i++)
      {
        for (int ii=0; ii<array.length; ii++)
        {
          {
            array[i][ii] = array[i+1][ii];
          }
        }
      }

      //populate first Column
      for (int i=0; i<array.length; i++)
      {
        array[array.length-1][i] = coin();
      }
    }
  }

  private void updateScrollY(boolean[][] array)
  {
    if (scrollDown)
    {
      //Shift rows
      for (int i=array.length-1; i>0; i--)
      {
        for (int ii=0; ii<array.length; ii++)
        {
          array[ii][i] = array[ii][i-1];
        }
      }

      //populate first row
      for (int i=0; i<array.length; i++)
      {
        array[i][0] = coin();
      }
    }
    else
    {
      //Shift rows
      for (int i=0; i<array.length-1; i++)
      {
        for (int ii=0; ii<array.length; ii++)
        {
          {
            array[ii][i] = array[ii][i+1];
          }
        }
      }

      //populate first row
      for (int i=0; i<array.length; i++)
      {
        array[i][array.length-1] = coin();
      }
    }
  }

  /*Game of Life*/
  void updateLife(boolean[][] array)
  {  
    boolean[][] arrayBuffer = new boolean[size][size];
    
    boolean isExtinct = true;
    boolean isStatic = true;
    
    for (int i=0; i<size; i++)
    {
      for (int ii=0; ii<size; ii++)
      {
        /*Count Neighbours*/
        int numNeighbours = 0;
        
        for(int iii=-1; iii<2; iii++)
        {
          for(int iv=-1; iv<2; iv++)
          {
            int x = i + iii;
            int y = ii + iv;
            if(safeCell(x,y))  //The edges are always dead :(
            {
              if(array[x][y])
              {
                isExtinct = false;
                numNeighbours++;
              }
            }
          }
        }
        
        /*Live cells*/
        if(array[i][ii])
        {
          if(numNeighbours < 2)
          {
            /*Any live cell with fewer than two live neighbours dies,
            as if caused by under-population*/
            arrayBuffer[i][ii] = false;
          }
          else if(numNeighbours == 2 || numNeighbours == 3)
          {
            /*Any live cell with two or three live neighbours lives on to the next generation.*/
            arrayBuffer[i][ii] = true;
          }
          else if(numNeighbours > 3)
          {
            /*Any live cell with more than three live neighbours dies,
            as if by overcrowding.*/
            arrayBuffer[i][ii] = false;
          }
        }
        /*Dead cells*/
        else
        {
          if(numNeighbours == 3)
          {
            arrayBuffer[i][ii] = true;
          }
        }
        if(array[i][ii] != arrayBuffer[i][ii])
        {
          isStatic = false;
        }
      }
    }
    
    //Randomise if every cell is dead, or if it has reached a static point
    if(isExtinct || isStatic)
    {
      updateRandom(array);
    }
    else
    {
      arrayCopy(arrayBuffer, array);
    }
  }

  /**
   Generates a waveform from the grid state
   */
  private void updateWavetable()
  {
    float[] wavetable = new float[wavetableLength];
    float[] trueCells = new float[size];

    //Build an array containing the number of true cells in each column
    for (int i=0; i<size; i++)
    {      
      for (int ii=0; ii<size; ii++)
      {
        if (state[i][ii])
        {
          trueCells[i]++;
        }
      }
    }

    //Generate a waveform based upon those values
    for (int i=0; i<wavetableLength; i++)
    {
      int ii = int(map(i, 0, wavetableLength, 0, size));
      float v = map(trueCells[ii], 0, size, -1, 1);

      wavetable[i] = v;
    }    

    wav.setWaveform(wavetable);
  }

  public void display()
  {    
    /*Draw the grid*/
    noStroke();
    //stroke(colour);
    fill(colour);
    pushMatrix();
    translate(borderSize, borderSize);

    for (int i=0; i<size; i++)
    {
      for (int ii=0; ii<size; ii++)
      {
        if (state[i][ii])
        {

          rect(i*cellSize, ii*cellSize, cellSize, cellSize);
        }
      }
    }

    popMatrix();

    /*Draw the wavetable*/
    float wh = -40;

    pushMatrix();
    translate(borderSize, height-50);
    stroke(colour);
    strokeWeight(2);

    for (int i=0; i<wavetableLength-1;i++)
    {
      float x1 = map(i, 0, wavetableLength, 0, width-(borderSize*2));
      float x2 = map(i+1, 0, wavetableLength, 0, width-(borderSize*2));

      line(x1, wh * wav.get(i), x2, wh*wav.get(i+1));
    }

    popMatrix();
  }
  
  /**
    Is cell x,y safe to access in the array?
  */
  boolean safeCell(int x, int y)
  {
    return x>0 && x<size && y>0 && y<size;
  }

  void noteOff()
  {/*One must fulfill one's duty to the interface*/}
}


