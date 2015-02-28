
int[] unsortedSelection;
int[] sortedSelection;
int lowest = -1;
int place;
int i;
int k;
int low;
int tempK;
int tempDrawS;
int tempDrawNS;
    

    void setup() {
      size(500,500);
      background(0);
      unsortedSelection  = new int[width/2];
      sortedSelection  = new int[width/2];
      for(int j = 0; j < width/2; j++){
        unsortedSelection[j] = (int)(Math.random() * (height - 1) + 1);
    }
    lowest = -1;
      i = 0;
      k = 0;
      place = -1;
      low = height + 1;
    }

    void draw() {
      if(i < width/2){
          if(k < width/2){
          tempK = unsortedSelection[k];
            if(tempK > 0 && tempK < low){
              low = tempK;
              place = k;
              lowest = place;
              drawN();
            }
            k++;
          }else{
            drawN();
            tempK = unsortedSelection[place];
            sortedSelection[i] = tempK;
            unsortedSelection[place] = -tempK;
            lowest = -1;
            k = 0;
            i++;
            low = height + 1;
          }
      }else{
        for(int j = 0; j < width/2; j++){
            unsortedSelection[j] = (int)(Math.random() * (height - 1) + 1);
        }
        for(int j = 0; j < width/2; j++){
            sortedSelection[j] = -1;
        }
        lowest = -1;
        i = 0;
          place = -1;
          low = height + 1;
      }
    }
    void drawN() {
      background(0);
        for(int i = 0; i < width/2; i++){
          stroke(255,255,0);
          tempDrawS = sortedSelection[i];
          tempDrawNS = unsortedSelection[i];
          if(tempDrawS > 0){
            line(i,height - tempDrawS, i, height);
          }
          if(tempDrawNS > 0){
            if(i == lowest){
                stroke(0,255,255);
                line(i + width/2 ,height - tempDrawNS, i + width/2, height);
              }else{
                 stroke(0,255,0);
                line(i + width/2 ,height - tempDrawNS, i + width/2, height);
              }
          }
      }
    }


