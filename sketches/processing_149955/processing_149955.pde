
int pen = 8; //Size of "pen"
int s, rot;
int px[][] = new int[13][16];
int py[][] = new int[13][16];
 
size(512,512);
translate(width/2, height/2);
background(64);

//Calculate octogons
for (rot=0; rot<16; rot++) {
  if (rot%2 != 0) {
    for (s=12; s>=0; s--) {
      px[s][rot] = int((2*s+8)*pen*cos(radians(22.5*rot)));
      py[s][rot] = int((2*s+8)*pen*sin(radians(22.5*rot)));
    }
  }
}

//White backgroind
noStroke();
fill(255);
beginShape();
for (rot=0; rot<16; rot++) {
  if (rot%2 != 0)
    vertex(px[12][rot],py[12][rot]);
}
endShape(CLOSE);

//Calculate half of octogons' edges
for (s=12; s>=0; s--) {
  px[s][0] = px[s][1];
  py[s][0] = (py[s][1]+py[s][15])/2;

  px[s][4] = (px[s][3]+px[s][5])/2;
  py[s][4] = py[s][3];

  px[s][8] = px[s][7];
  py[s][8] = (py[s][7]+py[s][9])/2;

  px[s][12] = (px[s][11]+px[s][13])/2;
  py[s][12] = py[s][11];
}

stroke(0);
strokeWeight(pen);
for (rot=0; rot<14; rot++) {
  //1
  if (rot == 0) {
    for (s=9; s>2; s=s-3) {
      line (
        px[s][rot],
        py[s][rot]+pen,
        px[s-1][rot],
        py[s-1][rot]+pen
      );
      line (
        px[s][rot],
        py[s][rot]+pen,
        px[s][rot],
        py[s][rot+1]
      );
      line (
        px[s-1][rot],
        py[s-1][rot]+pen,
        px[s-1][rot],
        py[s-1][rot+1]
      );

      line (
        px[s][rot],
        py[s][rot]-pen,
        px[s-1][rot],
        py[s-1][rot]-pen
      );
      line (
        px[s][rot],
        py[s][rot]-pen,
        px[s][15],
        py[s][15]
      );
      line (
        px[s-1][rot],
        py[s-1][rot]-pen,
        px[s-1][15],
        py[s-1][15]
      );
    }
    for (s=12; s>9; s--)
      line (
        px[s][15],
        py[s][15],
        px[s][rot+1],
        py[s][rot+1]
      );
    for (s=7; s>0; s=s-3)
      line (
        px[s][15],
        py[s][15],
        px[s][rot+1],
        py[s][rot+1]
      );
     line (
       px[0][15],
       py[0][15],
       px[0][rot+1],
       py[0][rot+1]
     );
  }
  //3
  if (rot == 4) {
     line (
       px[12][rot-1],
       py[12][rot-1],
       px[12][rot+1],
       py[12][rot+1]
     );
     line (
       px[12][rot]-pen,
       py[12][rot],
       px[7][rot]-pen,
       py[7][rot]
     );
     line (
       px[7][rot]-pen,
       py[7][rot],
       px[7][rot+1],
       py[7][rot+1]
     );
     line (
       px[6][rot]-pen,
       py[6][rot],
       px[1][rot]-pen,
       py[1][rot]
     );
     line (
       px[6][rot]-pen,
       py[6][rot],
       px[6][rot+1],
       py[6][rot+1]
     );
     line (
       px[1][rot]-pen,
       py[1][rot],
       px[1][rot+1],
       py[1][rot+1]
     );
     line (
       px[11][rot]+pen,
       py[11][rot],
       px[6][rot]+pen,
       py[6][rot]
     );
     line (
       px[5][rot]+pen,
       py[5][rot],
       px[0][rot]+pen,
       py[0][rot]
     );
     line (
       px[11][rot]+pen,
       py[11][rot],
       px[11][rot-1],
       py[11][rot-1]
     );
     line (
       px[6][rot]+pen,
       py[6][rot],
       px[6][rot-1],
       py[6][rot-1]
     );
     line (
       px[5][rot]+pen,
       py[5][rot],
       px[5][rot-1],
       py[5][rot-1]
     );
     line (
       px[0][rot-1],
       py[0][rot-1],
       px[0][rot+1],
       py[0][rot+1]
     );
     for (s=10; s>1; s=s-2) {
       if (s!=6) {
         line (
           px[s][rot]-3*pen,
           py[s][rot],
           px[s+1][rot]-3*pen,
           py[s+1][rot]
         );         
         line (
           px[s][rot]+3*pen,
           py[s][rot],
           px[s-1][rot]+3*pen,
           py[s-1][rot]
         );         
         line (
           px[s][rot]+3*pen,
           py[s][rot],
           px[s][rot-1],
           py[s][rot-1]
         );         
         line (
           px[s-1][rot]+3*pen,
           py[s-1][rot],
           px[s-1][rot-1],
           py[s-1][rot-1]
         );         
         line (
           px[s][rot]-3*pen,
           py[s][rot],
           px[s][rot+1],
           py[s][rot+1]
         );         
         line (
           px[s+1][rot]-3*pen,
           py[s+1][rot],
           px[s+1][rot+1],
           py[s+1][rot+1]
         );         
       }
     }
  }
  //5
  if (rot == 8) {
    for (s=9; s>2; s=s-3) {
      line (
        px[s][rot],
        py[s][rot]-pen,
        px[s+1][rot],
        py[s+1][rot]-pen
      );
      line (
        px[s][rot],
        py[s][rot]-pen,
        px[s][rot],
        py[s][rot+1]
      );
      line (
        px[s+1][rot],
        py[s+1][rot]-pen,
        px[s+1][rot],
        py[s+1][rot+1]
      );

      line (
        px[s][rot],
        py[s][rot]+pen,
        px[s+1][rot],
        py[s+1][rot]+pen
      );
      line (
        px[s][rot],
        py[s][rot]+pen,
        px[s][rot-1],
        py[s][rot-1]
      );
      line (
        px[s+1][rot],
        py[s+1][rot]+pen,
        px[s+1][rot-1],
        py[s+1][rot-1]
      );
    }
    line (
      px[12][rot-1],
      py[12][rot-1],
      px[12][rot+1],
      py[12][rot+1]
    );
    for (s=11; s>1; s=s-3)
      line (
        px[s][rot-1],
        py[s][rot-1],
        px[s][rot+1],
        py[s][rot+1]
      );
    for (s=1; s>=0; s--)
      line (
        px[s][rot-1],
        py[s][rot-1],
        px[s][rot+1],
        py[s][rot+1]
      );
  }
  //7
  if (rot == 12) {
    for (s=11; s>1; s=s-3) {
      line (
        px[s][rot]-pen,
        py[s][rot],
        px[s][rot]-pen,
        py[s-1][rot]
      );
      line (
        px[s][rot]+pen,
        py[s][rot],
        px[s][rot]+pen,
        py[s-1][rot]
      );

      line (
        px[s][rot]-pen,
        py[s][rot],
        px[s][rot-1],
        py[s][rot-1]
      );
      line (
        px[s-1][rot]-pen,
        py[s-1][rot],
        px[s-1][rot-1],
        py[s-1][rot-1]
      );
      line (
        px[s][rot]+pen,
        py[s][rot],
        px[s][rot+1],
        py[s][rot+1]
      );
      line (
        px[s-1][rot]+pen,
        py[s-1][rot],
        px[s-1][rot+1],
        py[s-1][rot+1]
      );
    }
    for (s=12; s>=0; s=s-3)
      line (
        px[s][rot-1],
        py[s][rot-1],
        px[s][rot+1],
        py[s][rot+1]
      );
  }
  //2, 4, 6, 8
  if ((rot == 1) || (rot == 5) || (rot == 9) || (rot == 13)) {
    for (s=12; s>=0; s--) {
      line (
        px[s][rot],
        py[s][rot],
        px[s][rot+2],
        py[s][rot+2]
      );
    }
  }
}
