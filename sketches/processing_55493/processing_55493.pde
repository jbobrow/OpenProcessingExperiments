
class Element {
  int x, y, w, h;
  int iloscWejsc;
  
  
  Element(int tempX,int tempY) {
    x = tempX;
    y = tempY;
    w = 100;
    h = 100;
    iloscWejsc = 1;
  }
  
    
  
  Element(int tempX,int tempY, int tempW, int tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    iloscWejsc = 1;
  }
  
  
  Element(int tempX,int tempY, int tempW, int tempH, int tempIW) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    iloscWejsc = tempIW;
  }
  
  void pokaz() {
    boolean wejscie[] = new boolean[4*iloscWejsc];
    int wejscieX[] = new int[4*iloscWejsc];
    int wejscieY[] = new int[4*iloscWejsc];
    int wyjscieX[] = new int[4*iloscWejsc];
    int wyjscieY[] = new int[4*iloscWejsc];

      
    int l = 0;
    
    for(int i = 0; i < iloscWejsc; i++) {
      wejscie[l] = false;
      wejscieX[l] = x + (i + 1) * (w/(iloscWejsc + 1));
      wejscieY[l] = y;
      
      wyjscieX[l] = wejscieX[l];
      wyjscieY[l] = y + (h/4);
      l++;
    }
    
    for(int i = 0; i < iloscWejsc; i++) {
      wejscie[l] = false;
      wejscieY[l] = y + (i + 1) * (h/(iloscWejsc + 1));
      wejscieX[l] = x;
      
      wyjscieX[l] = x + (w/4);
      wyjscieY[l] = wejscieY[l];
      l++;
    }
    
    for(int i = 0; i < iloscWejsc; i++) {
      wejscie[l] = false;
      wejscieY[l] = y + (i + 1) * (h/(iloscWejsc + 1));
      wejscieX[l] = x + w;
      
      
      wyjscieX[l] = x + w - (w/4);
      wyjscieY[l] = wejscieY[l];
      l++;
    }
    
    for(int i = 0; i < iloscWejsc; i++) {
      wejscie[l] = false;
      wejscieX[l] = x + (i + 1) * (w/(iloscWejsc + 1));
      wejscieY[l] = y + h;
      
      wyjscieX[l] = wejscieX[l];
      wyjscieY[l] = y + h - (h/4);
      l++;
    }      
    
    for(int i = 0; i<4*iloscWejsc; i++)
      while(!wejscie[i]) {
        int j = (int)random (4*iloscWejsc);
        if(!wejscie[j] && i != j) {
          bezier(wejscieX[i], wejscieY[i], wyjscieX[i], wyjscieY[i], wyjscieX[j], wyjscieY[j], wejscieX[j], wejscieY[j]);
          wejscie[i] = true;
          wejscie[j] = true;
        }
      }
      
  }

}

