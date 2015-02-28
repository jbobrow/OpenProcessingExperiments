
float m ;
float time;
float timeNormalized;
float sine;


float sineWave(float period) {

  float timeInversed = 1/period;

  m = millis();
  time = m % period;
  timeNormalized =  time*timeInversed;

  sine = sin(timeNormalized*TWO_PI);
  return sine;

}


