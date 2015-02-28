
class Plot
{
  
////////////////////////////////////////////// 
// VARIABLES STATED
////////////////////////////////////////////// 
// global arrays
final int YEARS = 118;
float[]mappedData;

int listValue;
float minValue;
float maxValue;
float bottomConstraint;
float topConstraint;
//////////////////////////////////////////////


////////////////////////////////////////////// 
// VARIABLES VALUES (CONSTRUCTOR)
////////////////////////////////////////////// 
// global array values
Plot()
{
mappedData = new float[YEARS];
mappedData = startArray(0);

listValue = 1;
minValue = 0;
maxValue = 100;
bottomConstraint = height-30;
topConstraint = height/3;
}
//////////////////////////////////////////////


////////////////////////////////////////////// 
// ANIMATE PLOT
////////////////////////////////////////////// 
void animate(float[][]anyArray, int num, float anyX)
{
  
// start the animation here
if (frameCount > 100 && frameCount%200 > 0 && anyArray[num][0] < anyArray[num][listValue])
{ 
  anyArray[num][0] = anyArray[num][0] + .5;
}

if (frameCount > 100 && frameCount%200 > 0 && anyArray[num][0] > anyArray[num][listValue])
{
  anyArray[num][0] = anyArray[num][0] - .5;
}

if (frameCount > 300 && frameCount%200 == 0)
{
  listValue++;
}

if (listValue == anyArray.length)
{
  listValue=1;
}

// check for problems
//println(listValue);
//println( anyArray[0][0]+" == "+anyArray[0][listValue]);
//println(frameRate);

}
//////////////////////////////////////////////


////////////////////////////////////////////// 
// GIVE AN ARRAY VALUES
////////////////////////////////////////////// 
float[] startArray(float start)
{
  
float[]tempValue = new float[YEARS];

for (int i=0; i<tempValue.length; i++)
{
  tempValue[i] = start;
}

return tempValue;

}
//////////////////////////////////////////////

} 

