
class KeyboardConsole{
 
  StandardKey[] keys = new StandardKey[12]; 
  int[] activeKeys = new int[12];
  AudioSample[] samples = new AudioSample[12]; 
  String[] SampleList = new String[12];
  char[] charList = new char[12];
  
  Tape tape1;

  KeyboardConsole()
  {
    populateSamplelist();
    populateCharList();
    
    tape1 = new Tape();
    
    for (int i = 0; i < 12; i++)
    {
      keys[i] = new StandardKey((i*50)+10,10);
      samples[i] = minim.loadSample(SampleList[i]);
      activeKeys[i] = 0;
    }
  }
  
  void display()
  {
    for (int i = 0; i < 12; i++)
    {
      keys[i].display(activeKeys[i]);
     
      if (activeKeys[i] == 1)
      {
        tape1.record(charList[i]);
      }
    }
  }
  
  void stop()
  {
    for (int i = 0; i < 12; i ++)
    {
      samples[i].close();
    }
  }
  
  void mouseInput(int xCo, int yCo)
  {
    for (int i = 0; i < 12; i++)
    {
      if(keys[i].clicked(xCo, yCo) == true)
      {
        samples[i].trigger();
        activeKeys[i] = 1;
      }
    }
  }
  
  void keyboardInput(char keyInput)
  {
    for (int i = 0; i < 12; i++)
    {
      if (keyInput == charList[i])
      {
        samples[i].trigger();
        activeKeys[i] = 1;
      }
    }
  }
  
  void resetKeys()
  {
    for (int i = 0; i < 12; i ++)
    {
      if (activeKeys[i] == 1) activeKeys[i] = 0;
    }
  }
  
  void populateSamplelist()
  {
    SampleList[0] = "c5-12.wav";
    SampleList[1] = "c5-11b.wav";
    SampleList[2] = "c5-10.wav";
    SampleList[3] = "c5-9b.wav";
    SampleList[4] = "c5-8.wav";
    SampleList[5] = "c5-7.wav";
    SampleList[6] = "c5-6b.wav";
    SampleList[7] = "c5-5.wav";
    SampleList[8] = "c5-4b.wav";
    SampleList[9] = "c5-3.wav";
    SampleList[10] = "c5-2b.wav";
    SampleList[11] = "c5-1.wav";
  }
  
  void populateCharList()
  {
    charList[0] = 'z';
    charList[1] = 's';
    charList[2] = 'x';
    charList[3] = 'd';
    charList[4] = 'c';
    charList[5] = 'v';
    charList[6] = 'g';
    charList[7] = 'b';
    charList[8] = 'h';
    charList[9] = 'n';
    charList[10] = 'j';
    charList[11] = 'm';
  }
}

