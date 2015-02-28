
float noteFreq(int note){
  float freq = 27.5;
  if(note>=1&&note<=88){
    freq = 440*pow(2,(note-49)/12f);
  }
  return freq;
}
int keyNote(){
  int note = 0;
  switch(key){
    case'z':note = 40;break;
    case's':note = 41;break;
    case'x':note = 42;break;
    case'd':note = 43;break;
    case'c':note = 44;break;
    case'v':note = 45;break;
    case'g':note = 46;break;
    case'b':note = 47;break;
    case'h':note = 48;break;
    case'n':note = 49;break;
    case'j':note = 50;break;
    case'm':note = 51;break;
    case',':note = 52;break;
    case'l':note = 53;break;
    case'.':note = 54;break;
    case';':note = 55;break;
    case'/':note = 56;break;
    
    case'q':note = 52;break;
    case'2':note = 53;break;
    case'w':note = 54;break;
    case'3':note = 55;break;
    case'e':note = 56;break;
    case'r':note = 57;break;
    case'5':note = 58;break;
    case't':note = 59;break;
    case'6':note = 60;break;
    case'y':note = 61;break;
    case'7':note = 62;break;
    case'u':note = 63;break;
    case'i':note = 64;break;
    case'9':note = 65;break;
    case'o':note = 66;break;
    case'0':note = 67;break;
    case'p':note = 68;break;
  }
  if(note!=0){note += 12*octaveShift;}
  return note;
}

int counter = 0;
class userSignal implements AudioSignal{
  void generate(float[] samp){
    for(int i=0;i<samp.length;i++){
      samp[i] = 0;//random(-0.01,0.01);
      for(int j=0;j<88;j++){
        if(notes[j]){
          ADSR[j] += attackRate;
          if(ADSR[j]>1){ADSR[j]=1;}
        }else{
          ADSR[j] -= attackRate;
          if(ADSR[j]<0){ADSR[j]=0;}
        }
        if(ADSR[j]>0.001){
//          samp[i] += ADSR[j]*0.2*sin(
//          counter/44100f*freqs[j]*TWO_PI);
          samp[i] += addHarmonics(freqs[j],0.1*ADSR[j]*0.5,2);
        }
      }
      samp[i] = constrain(samp[i],-1,1);
      counter++;
      if(counter>44100*60){counter=0;}
    }
  }
  void generate(float[] left, float[] right){
    generate(left);
    arrayCopy(left,right);
  }
}

float addHarmonics(float freq,float amp,int depth){
  float sum = 0;
  sum += amp*sin(counter/44100f*freq*TWO_PI);
  float amp2 = 0.5*amp;
  if(amp2>0.01&&depth-1>0){
    float[] harmony = new float[4];
//    harmony[0] = freq;
//    harmony[1] = freq*3/2;
//    harmony[2] = freq*2;
    for(int i=0;i<harmony.length;i++){
      harmony[i] = freq*((i+1)*2);
      sum += addHarmonics(harmony[i],amp2,depth-1);
    }
  }
  return sum;
}


