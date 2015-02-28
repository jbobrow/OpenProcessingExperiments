
/**
 * typo outline displayed as dots and lines
 *     
 * KEYS
 * a-z                  : text input (keyboard)
 * backspace            : delete last typed letter
 * ctrl                 : save png + pdf
 */

import processing.pdf.*;
import geomerative.*;



color[] colors = {#B9645C, #E1928A, #F79462, #FECF79, #0D2A4B, #14395D, #18436D, #284E75, #30638C, #273E5B, #427AA2, #335D7C, #5189B1, #477094, #425C81, #5282A1, #6496BA, #607DA1, #76A9CA, #73A0BF, #88B8D7, #9CCCE4, #73849F, #BEEEFE, #6B708A};
int colorSize = colors.length;

RFont font;
//√∞ →→ ²
String textTyped = "CONNECT";

boolean doSave = false;


int freq = 7;
int sMinMax = 13;
int sMaxMax = 29;
int powerMax = 4;
void setup() {
  
  size( 1220, 300);  
  // make window resizable
  // frame.setResizable(true); 
  smooth();
  
  // allways initialize the library in setup
  RG.init(this);
  font = new RFont("FreeSans.ttf", 200, RFont.LEFT);

  //RCommand.setSegmentStep(11);
  //RCommand.setSegmentator(RCommand.UNIFORMSTEP);

  RCommand.setSegmentLength (4);
  RCommand.setSegmentator(RCommand.UNIFORMLENGTH);

  //RCommand.setSegmentAngle(random(0,HALF_PI));
  //RCommand.setSegmentator(RCommand.ADAPTATIVE);
  
}


void draw() {
  
if (doSave){
  beginRecord(PDF, timestamp()+"_####.pdf");
  println("SAVING..");
}

  //background(170, 185, 195);
  background(#151722);
  // margin border

  pushMatrix();
  //spiral();
  popMatrix();
  
  pushMatrix();
  drawText();
  popMatrix();
  
  if (doSave) {
    doSave = false;
    endRecord();
    saveFrame(timestamp()+"_####.png");
  }
}//end draw

void spiral()
{
  
  translate(width/2, height/2);
  
  noStroke();
  float radius = 5;
  
  int seed = 0;
  int randomFactor = 2;
  
  float step = .075;
  
  int maxPoints = 7000;
  for( float i=0; i<maxPoints; i+= step )
  {
    
    randomSeed( seed * randomFactor ); 
    int randCol = int(random(colorSize));
    
    float sMin = map(i, 0, maxPoints, 1, sMinMax);
    float sMax = map(i, 0, maxPoints, 3, sMaxMax);
    float power = map(i, 0, maxPoints, 25, powerMax);
    //randomSeed( seed );
    
    float randSize = map( pow(random(1), power), 0, 1, sMin, sMax);
    
    float phi = (1 + sqrt(5))/2;
    
    fill(colors[randCol]);
    float x = sin(i * freq) * i/phi ;
    float y = cos(i * freq) * i/phi ;
   
    radius += step;
    
    //step = map(i, 0, maxPoints, .075, .4 );
    
    ellipse(x, y, randSize, randSize);
    
    seed++;
  }
}

void drawText()
{
  translate( 100, 200);
 
  RGroup grp;
  RPoint[] pnts;

  
  //for each character, print it
  /*
  for( int i=0; i<textTyped.length(); i++ )
  {  

    char character = textTyped.charAt(i);
     
    if( character != ' ')
    {
        pushMatrix();
        translate( ( (i+1)*90 ), 0);
       
        
        String type = character+"";  
        
        grp = font.toGroup(type);
        grp = grp.toPolygonGroup();
        pnts = grp.getPoints();

        
        //println(pnts.length);
        drawPoints( pnts, (1+i)*35 );
       
       popMatrix();

    }
    else
    {
       //make space
       translate( ( (i+1)*90 ), 0);  
    }
    
  }
  */
  
  grp = font.toGroup(textTyped);
        grp = grp.toPolygonGroup();
        pnts = grp.getPoints();
  drawPoints( pnts, 10 );
  
  
}
void drawPoints(RPoint[] pnts, int seed){
  
  for ( int i = 0; i < pnts.length; i++ ) {
      
      int randCol = int(random(colorSize));
      float randNum = random(5);
      
      //levels of randomness
      boolean lvl1 = randNum > 4.8;
      boolean lvl2 = randNum > 3.5;
      boolean lvl3 = randNum > 1;
      
      fill( colors[randCol] );
      stroke( colors[randCol] );
      strokeWeight( .25 );
      
      float sX=3;
      
      boolean bNoise = (i%7==0);
      boolean bRand = (i%7==0);
      
      //Size of cirlces
      //If connection by noise
      if( bNoise )
      {
        if(  lvl1 )
          sX = 4.5;
        else if( lvl2 )
          sX = 3.4;
        else if( lvl3 )
          sX = 2.2;
        else
          sX = 1.5;
      }
      //if connection by random
      else if( bRand )
      {
          if( randNum > 4 )
             sX = 2.5;
          else
             sX = 1;   
      }
      else
        sX = .8;
        
      ellipse( pnts[i].x, pnts[i].y, sX, sX );
     
      if(  lvl1 )
        strokeWeight(1.3);
      else if( lvl2 )
        strokeWeight(.7);
     else if( lvl3 ){
        strokeWeight( .1);
            }   
      else
         stroke( 0,0,0,0);   

      
      int rand = (int)( noise(i) * ( (pnts.length-1)/3  * i/(pnts.length/3) )  )   ;  
      if( bNoise )
        line( pnts[i].x, pnts[i].y, pnts[rand].x, pnts[rand].y );
      
      
      if( lvl1 )
        strokeWeight(.0);
      else
        strokeWeight(.01);
      
      randomSeed( i * seed );
      rand = floor( random(pnts.length-1) );
     
      if( bRand );
         //line( pnts[i].x, pnts[i].y, pnts[rand].x, pnts[rand].y );
      
      /*
      if(i+1 < pnts.length-1 )
      {
        stroke(#FECF79);
        strokeWeight(.3);
        line(pnts[i].x, pnts[i].y, pnts[i+1].x, pnts[i+1].y);
      }
      */
      
      
      
      /*
      if( i + 1 < pnts.length )
      {
     
        float resolution = 2;
        float dX = pnts[i+1].x - pnts[i].x;
        float dY = pnts[i+1].y - pnts[i].y;
        for( int j=0; j<resolution; j++ )
        {
          fill(25);
          ellipse( pnts[i].x + dX*(j/resolution), pnts[i].y + dY*(j/resolution), 1, 1 );  
        }
        
        //println( (pnts[i+1].x - pnts[i].x) );
        //for( int j=0; j < pnts[i+1].x - pnts[i].x; j++ )
        
        //line(pnts[i].x, pnts[i].y, pnts[i+1].x, pnts[i+1].y);
      }*/
      
    }
}






void keyPressed() {
  

  if (keyCode == CONTROL) doSave = true;
  
}

// timestamp
String timestamp() {
  return ("" + day() + hour() + minute() + second());
 
}




