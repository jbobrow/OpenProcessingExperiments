
//////////////////
//lookup table implementation for sin; to speed it up.
//number of values to hold in the lookup table - more values better, more conituous function
// fewer values - faster implementation, less memory footprint.
final int sinCacheSz = (int)(550*TWO_PI); 
float sinCacheSzDivTWOPI; 
float cachedSin[];
boolean initialized = false;
//cache all the values for the array
void initCachedSin()
{
  if(initialized)
    return;
  //we will want this value later when we're pulling values from the array
  sinCacheSzDivTWOPI = ((sinCacheSz)/TWO_PI);
  cachedSin = new float[sinCacheSz];
  for(int i = 0; i < cachedSin.length; i++)
  {
    cachedSin[i] = sin(i*TWO_PI/cachedSin.length);
  }
  initialized = true;
}

//new implementation of sin() function
float sn(float t)
{  
  //reduce 't' to a number between 0 and TWO*PI
  float tmp = t%TWO_PI;
  //if it's (now) a negative number increase by two pi
  if(tmp < 0)
    tmp += TWO_PI;
  // scale up the new index
  int index = (int)(tmp * sinCacheSzDivTWOPI);
  return cachedSin[index];
}
//////////////////////////


