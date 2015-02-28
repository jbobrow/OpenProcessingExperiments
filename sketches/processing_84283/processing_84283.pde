
// heat2D

String outFileName = "rcd01.txt"; 

int sizeX = 800;
int sizeY = 400;
float wid = float(sizeX);
float hgt = float(sizeY);
float inPower = 6.0;     // input power density on the left-hand-side edge
float hc = 0.6;        // heat transfer coefficient on the right-hand-side edge
float Tr = 10.0;        // referrence temperature on the right-hand-side edge
int MaxStepCount = 10000;
int stepCount = 0;
boolean eqFlag = false;    // flag to signal whether equalibrium has been reached

TCgrid tcg01;


void setup()
{
  size( sizeX, sizeY );
  background( 111 );
  smooth(); 
  
  tcg01 = new TCgrid( wid/2.0, hgt/2.0, wid*0.6, hgt*0.6, 4, 8 );
  tcg01.show_grid();
}


void draw()
{
  background( 111 );
  tcg01.show_grid();

  for( int t=0; t<10; t++ ) 
  {
    eqFlag = tcg01.trfHeat();
    if( eqFlag == true ) 
    {
      break; 
    }
    stepCount++;
  }
  tcg01.show_grid();
  fill( 248 );
  text( stepCount, width-36, height-22 );
  //if( stepCount == 0 ) {  }
  
  if( eqFlag==true || stepCount>MaxStepCount )
  //if( stepCount>MaxStepCount )
  {
    background( 66 );
    tcg01.show_grid();
    fill( 248 );
    text( stepCount, width-36, height-22 );
    //tcg01.rcd_TC();
    noLoop();
  }
  
  //delay( 100 ); 
}


class TCgrid 
{ 
  int nRow, nCol;
  float centerX, centerY, dispW, dispH;
  
  float[][][] posi;    // float[row][column][2] x_y_positions of individual gridpoints
  float[][] TC;    // temperatures (in degree celcius) of individual gridpoints
  color[][] carr;    // colors of individual gridpoints
  
  // initializer of an instant of the Class TCgrid
  TCgrid( float cx, float cy, float gw, float gh, int nr, int nc )
  {
    centerX = cx;
    centerY = cy;
    nRow = nr;
    nCol = nc;
    dispW = gw;
    dispH = gh;
    
    posi = new float[nr][nc][2];
    TC = new float[nr][nc];
    carr = new color[nr][nc];
    
    for( int j=0; j<nr; j++ )
    {
      for( int i=0; i<nc; i++ )
      {
        if( nc == 1 )
        {
          posi[j][i][0] = centerX;
        }
        if( nr == 1 )
        {
          posi[j][i][1] = centerY;
        }
        if( nc>1 && nr>1 )
        { 
          posi[j][i][0] = (i*1.0/(nc-1)-0.5)*dispW + centerX;   // x-coordinate
          posi[j][i][1] = (j*1.0/(nr-1)-0.5)*dispH + centerY;   // y-coordinate
        }
        
        carr[j][i] = color( int(160-posi[j][i][0]/6) );
        TC[j][i] = 20.0;    // initialize the temperature to 20.0 C (room temp)
      }
    } 
  }
  
  // function for changing the temperature of a gridpoint
  void chg_TC( int ny, int nx, float tpt )
  {
    TC[ny][nx] = tpt;
  }
  // funtion for readig the temperature of a gridpoint
  float read_TC( int ny, int nx )
  {
    return( TC[ny][nx] );
  }
  
  // funtion for changing the color of a gridpoint 
  void chg_color( int ny, int nx, color cc )
  {
    carr[ny][nx] = cc;
  }
  
  // function for inputing heat
  void inputHeat( float power )
  {
    for( int j=0; j<nRow; j++ )
    {
      TC[j][0] += power; 
    }
  }  
  
  //function for outputing heat
  void outputHeat( float HTc, float Tref )
  {
    for( int j=0; j<nRow; j++ )
    {
      TC[j][nCol-1] -= HTc*( TC[j][nCol-1] - Tref );
    }
  }  

  // function to do one step of heat_transfer equilibration 
  boolean trfHeat()
  {
    boolean HTflag = true;
    float[][] TCO = new float[nRow][nCol];
    float[][] TCN = new float[nRow][nCol];
  
    for( int j=0; j<nRow; j++ )
    {
      for( int i=0; i<nCol; i++ )
      {
        TCO[j][i] = TC[j][i];        
      }
    }
    
    inputHeat( inPower );
    outputHeat( hc, Tr );
  
    for( int j=0; j<nRow; j++ )
    {
      for( int i=0; i<nCol; i++ )
      {
        // gridpoints in the bulk
        if( i>0 && i<(nCol-1) && j>0 && j<(nRow-1) )
        {
          TCN[j][i] = 0.25*( TC[j-1][i] + TC[j+1][i] + TC[j][i-1] + TC[j][i+1] );
        }
        // gridpoints at the edges
        else if( i==0 && j>0 && j<(nRow-1) )
        {
          TCN[j][i] = ( TC[j-1][i] + TC[j+1][i] + TC[j][i+1] )/3.0;
        }
        else if( i==(nCol-1) && j>0 && j<(nRow-1) )
        {
          TCN[j][i] = ( TC[j-1][i] + TC[j+1][i] + TC[j][i-1] )/3.0;
        }
        else if( i>0 && i<(nCol-1) && j==0 )
        {
          TCN[j][i] = ( TC[j+1][i] + TC[j][i-1] + TC[j][i+1] )/3.0;
        }
        else if( i>0 && i<(nCol-1) && j==(nRow-1) )
        {
          TCN[j][i] = ( TC[j-1][i] + TC[j][i-1] + TC[j][i+1] )/3.0;
        }
        // gridpoints at the corners
        else if( i==0 && j==0 )
        {
          TCN[j][i] = 0.5*( TC[j+1][i] + TC[j][i+1] );
        }
        else if( i==0 && j==(nRow-1) )
        {
          TCN[j][i] = 0.5*( TC[j-1][i] + TC[j][i+1] );
        }
        else if( i==(nCol-1) && j==0 )
        {
          TCN[j][i] = 0.5*( TC[j+1][i] + TC[j][i-1] );
        }
        else if( i==(nCol-1) && j==(nRow-1) )
        {
          TCN[j][i] = 0.5*( TC[j-1][i] + TC[j][i-1] );
        }
      }
    }
  
    HTflag = true;
    for( int j=0; j<nRow; j++ )
    {
      for( int i=0; i<nCol; i++ )
      {
        if( abs(TCN[j][i]-TCO[j][i])>1e-6 )
        {
          HTflag = false;
        }
        TC[j][i] = TCN[j][i];        
      }
    }
    
    return HTflag;
  }
  
  // funtion to display the grid
  void show_grid() 
  { 
    noStroke();
    //stroke( 0 );
    textSize(12);
    textAlign( CENTER, CENTER );
    
    int TCcode = 0;
    
    for( int j=0; j<nRow; j++ )
    {
      for( int i=0; i<nCol; i++ )
      {
        if( TC[j][i] < 0.0 )
        {
          TCcode = 1020;
        }
        else if( TC[j][i] > 204.0 )
        {
          TCcode = 0;
        }
        else
        {
          TCcode = round( (204.0-TC[j][i])*5 );
        }
        
        if( TCcode<=255 )
        {
          carr[j][i] = color( 255, TCcode, 0 );
        }
        if( TCcode>=256 && TCcode<=510 )
        {
          carr[j][i] = color( 255-(TCcode-255), 255, 0 );
        }
        if( TCcode>=511 && TCcode<=765 )
        {
          carr[j][i] = color( 0, 255, TCcode-510 );
        }
        if( TCcode>=766 && TCcode<=1020 ) 
        {
          carr[j][i] = color( 0, 255-(TCcode-765),255 );
        }
        
        fill( carr[j][i] );
        ellipse( posi[j][i][0],posi[j][i][1], 20, 20 ); 
        fill( 248 );
        text( TC[j][i], posi[j][i][0],posi[j][i][1]+13 );
        //println( posi[j][i][0] + " \t " + posi[j][i][1] + " \t " + TC[j][i] );
      } 
    }  
  } 
  
  // function to record the temperatures at every point of the entire grid
  void rcd_TC()
  {
    PrintWriter outputFile = createWriter( outFileName ); 
    
    outputFile.println( );
  
    for( int j=0; j<nRow; j++ )
    {
      for( int i=0; i<nCol; i++ )
      {
        outputFile.print( round(TC[j][i]) + "\t" );
      }
      outputFile.println( );
    }
    outputFile.println( );
    
    outputFile.flush();
    outputFile.close();
  }
  
}
