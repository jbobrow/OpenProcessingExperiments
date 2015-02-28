
//copyright Stephanie Jeong 2014 yujeongj
// hw 8

final int MAX = 100;

float [ ] xVal;
float [ ] yVal;
float [ ] dimVal;
float [ ] deltaDimVal;

color [ ] colorVal;

void setup( )
{
  size(400, 600);
  noStroke();
  frameRate(30);
  smooth();
  
  xVal = new float [MAX];
  initFloatArray (xVal, 5, width);
  
  yVal = new float [MAX];
  initFloatArray (yVal, 5, height);
  
  dimVal = new float [MAX];
  initFloatArray (dimVal, 5, 25);
  
  deltaDimVal = new float[ MAX];
  initFloatArray(deltaDimVal, 1, 15);

  colorVal = new color [MAX];
  initColor(colorVal);
}

void initFloatArray(float[]allFloatArray, int minVal, int maxVal){
  for(int i = 0; i < allFloatArray.length; i++){
    allFloatArray[i] = int(random(minVal, maxVal));
    }
  }
  
void initColor(color[]allColor){
  for(int i = 0; i < allColor.length; i++){
    allColor[i] = color(random(255), random(255), random(255));
  }
}

void draw( ){
  background( 0 );
  drawFigs();
  moveFigs();
}

void drawFigs(){
  background (0);
  for(int i = 0; i < MAX; i++)
  {
   fill(colorVal[i]);
   if ( i %2 ==0 ){
     ellipse(xVal[i], yVal [i], dimVal[i]+xVal[i]*.1, dimVal[i]+yVal[i]*.1);
     }
   else{
     rect(xVal[i], yVal [i], dimVal[i]+xVal[i]*.1, dimVal[i]+yVal[i]*.1);
   }
  }
}

void moveFigs(){
  for (int i = 0; i < dimVal.length; i++){
    xVal[i] += dimVal[i];
    if(xVal[i] + dimVal[i] > width || xVal[i] < 0){
      dimVal[i] = -dimVal[i];
      }
          
    yVal[i] += deltaDimVal[i];
    if(yVal[i] + deltaDimVal[i] > height || yVal[i] < 0){
      deltaDimVal[i] = -deltaDimVal[i];
    }   
  }
}

void keyPressed()
{
  
  if (key == ' ')
  {
    setup();
  }
  else
  {
    exit();
  }
}


