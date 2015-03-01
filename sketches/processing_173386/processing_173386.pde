
void doFFT(){
  
  //== L channel ==
  fftL.forward( myPlayer.mix );
  for (int i = 0; pow(2,i+1)-1 < fftL.specSize(); i++)
  {
    int bandWidth = int(pow(2, i));
    int stBand = int(pow(2, i)-1);
    int cache = 0;
    for (int v = 0; v < bandWidth; v++)
    {
      cache += fftL.getBand(stBand+v);
    }
    _spectrumArr[0][i] = log(cache+1);
  }

  //== R channel ==
  fftR.forward( myPlayer.right );
  for (int i = 0; pow(2,i+1)-1 < fftR.specSize(); i++)
  {
    int bandWidth = int(pow(2, i));
    int stBand = int(pow(2, i)-1);
    int cache = 0;
    for (int v = 0; v < bandWidth; v++)
    {
      cache += fftR.getBand(stBand+v);
    }
    _spectrumArr[1][i] = log(cache+1);
  }
}


