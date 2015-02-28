

class Grid {
  int len = 16;
  int pos = 0;
  int res = 8;
  int tempo = 10;
  boolean first[];
  int on[];

  String notes[]= {
    "C2", "D2", "E2", "F2", "G2", "A2", "B2", 
    "C3", "D3", "E3", "F3", "G3", "A3", "B3", 
    "C4", "D4", "E4", "F4", "G4", "A4", "B4", 
    "C5", "D5", "E5", "F5", "G5", "A5", "B5", 
    "C6", "D6", "E6", "F6", "G6", "A6", "B6", 
    "C7", "D7", "E7", "F7", "G7", "A7", "B7",
  } 
  ;

  int pat[][];

  Grid(int _len) {
    len = _len;
    on = new int[notes.length];
    first = new boolean[notes.length];
    for (int i = 0 ; i < first.length;i++) {
      first[i] = true;
      on[i] = 0;
    }

    pat = new int[len][notes.length];
  }

  void draw() {

    int cntx = 0;
    int cnty = 0;

    stroke(255, 50);


    for (int y = res*notes.length-1;y > 0 ;y -= res) {
      cntx=0;

      fill(255);
      text(notes[cnty], res*len+5, y+res);

      for (int x = 0;x < res*len;x += res) {

        //note on
        if (cntx==pos) {
          fill(#ffcc00);
          rect(x, y, res, res);



          if (first[cnty] && pat[cntx][cnty]>0) {
            on[cnty] = 127;

            /// clipping patch
            int multi = 0;
            for (int i =0 ; i<notes.length;i++) {
              if (pat[cntx][i]>0)
                multi++;
            }

            float amp = 0.5/(float)multi;

            out.playNote(0, 0.5, new ToneInstrument( notes[cnty], amp, disWave, out ) ); 

            first[cnty] = false;
          }
        }

        if (over(x, y)) {
          fill(255);
          rect(x, y, res, res);

          if (mousePressed) {
            if (mouseButton==LEFT)
              pat[cntx][cnty] = 1;
            else
              pat[cntx][cnty] = 0;
          }
        }

        // notes coloring 
        if (cnty%2==0)
          fill(#ffcc00, 200);
        else
          fill(#ff0000, 200);

        if (pat[cntx][cnty]>0) {
          fill(255);
        }

        stroke(0);
        rect(x, y, res, res);
        cntx++;
      }
      cnty++;
    }

    int c =0 ;
    for (int i = res*notes.length-1 ; i>0;i-=res) {
      fill(255, on[c]);

      noStroke();

      if (on[c]>0)
        rect(0, i, res*len, res);

      if (on[c]>0)
        on[c]-=5;

      c++;
    }

    if (frameCount%tempo==0) {
      pos++;
      for (int y = 0;y < notes.length;y ++) {
        first[y] = true;
      }
    }


    if (pos>len) {
      pos=0;
    }
  }

  /////////////////////////

  void clearAll() {
    for (int y = 0 ; y < notes.length;y++) {
      for (int x = 0 ; x < len;x++) {
        pat[x][y] = 0;
      }
    }
  }

  /////////////////////////

  boolean over(int x, int y) {
    boolean answr = false;

    if ((mouseX>x && mouseX<x+res) && (mouseY>y && mouseY<y+res) )
      answr = true;

    return answr;
  }
}


