
int[][] points = { {0,44}, {22, 42}, {42, 42}, {62, 43}, {82, 48}, {92, 53},
                 {95, 58}, {102, 68}, {107, 75}, {111, 83}, {113, 91}, {115, 99},
              {120, 102}, {123, 108}, {130, 112}, {132, 124}, {128, 127}, {120, 124},
           {128, 130}, {120, 150}, {115, 151}, {113, 150}, {110, 148}, {107, 146}, {103, 144},
         {106, 145}, {90, 146}, {83, 150}, {100, 151}, {116, 154}, {113, 156}, {103, 178}, {102, 166},
      {103, 164}, {101, 163}, {98, 162}, {90, 164}, {82, 167}, {76, 170}, {70, 173}, {64, 176}, {58, 180},
   {54, 184}, {70, 178}, {68, 182}, {64, 185}, {60, 188}, {55, 191}, {50, 194}, {45, 197}, {40, 200}, {35, 203}, 
 {30, 206}, {25, 209}, {20, 212}, {15, 215}, {10, 218}, {5, 221}, {0, 224}, {0,44} };
 

void setup() {

  size(200, 200);

  fill(255,0,0);

  smooth();

}



void draw() {

  background(0);

  translate(mouseX - 50, mouseY - 50);

  beginShape();

  for (int i = 0; i < points.length; i++) {

    vertex(points[i][0], points[i][1]);

  }

  endShape();

}


