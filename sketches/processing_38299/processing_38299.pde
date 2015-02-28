
//import processing.pdf.*;

int x1=5;
int y1=5;
int x2=10;
int y2=10;
int spacing=20; 
int secondspacing= 50;

void setup () {
  size (500, 500);
  background (#FFF700);

  size (500, 500); 
  smooth ();
//  beginRecord(PDF, "wallpaper_part_one.pdf");
}


void draw () {
  for (int i=0; i<= 500; i=i+spacing) {
    for (int j= 0; j<=500; j=j+spacing) {
      fill (#A6FCF0+i);
      strokeWeight (1);
      stroke (95, 6, 3);
      for (int k=0; k<=25; k=k+5) {
        ellipse (x1+i, y1+j, 20-k, 20-k);
      }

      for (int m=0; m<=500; m=m+secondspacing) {
        for (int r=0; r<=500; r=r+secondspacing) {
          fill (#E0FF9B+r/7);
          strokeWeight (2);
          stroke(#9B09E0+r); 
          for (int c=0; c<=25; c=c+5) {
            rect (x2+m, y2+r, 30-c, 30-c);
          }
        }
      }
    }
  }
  // endRecord();
}

                
                                
