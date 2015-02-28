
class Emotion {
  int selectedImage;
  int _happy=0;
  int _sad=0;
  PImage [] smile;
  int _total;
  int _totSad;
  int _totHappy;
 

  Emotion(int happy, int sad) {
    smile = new PImage [4];
    _happy=happy;
    _sad=sad;
    
    for (int i =0; i<smile.length; i++) {
      smile[i] = loadImage("bild" + i + ".gif");
    }//ladda bilder
    }

    void checkText(String msg) {

      String[] happy = new String[6];
      happy[0] =":)";
      happy[1] =":D";
      happy[2] ="=)";
      happy[3] =":P";
      happy[4] =";)";
      happy[5] ="(:";

      String[] sad = new String[6];
      sad[0] =":(";
      sad[1] ="=(";
      sad[2] =":/";
      sad[3] =":S";
      sad[4]=":'(";
      sad[5]=";(";

      for (int i = 0; i < happy.length; i++) {
        if ( msg.indexOf(happy[i]) != -1) {
          _happy ++;
          _totHappy ++;
        }
      }
      println(_happy);

      for (int i = 0; i < sad.length; i++) {
        if ( msg.indexOf(sad[i]) != -1) {
          _sad ++;
          _totSad ++;
        }
      }
      println(_sad);
    }

PImage getMoodImage() {

      if (_sad < 10) {
        selectedImage =0;
      }    
      else if (_sad > 15 && _sad < 25) {
        selectedImage =1;
      }    
      else if (_sad > 25 && _sad < 32) {
        selectedImage = 2;
      }
      else if (_sad >=32) {
        selectedImage = 3;
      }
      return smile[selectedImage];
    }
    
int totHappy(){    
  return _totHappy;
}

int totSad(){
  return _totSad;
}
    
void reset() {
      _sad=0;
      _happy =0;
    }
  }

