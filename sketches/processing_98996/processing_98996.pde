
Lines[] nLines;
void setup() {


  //SETTINGS FOR THE FIBONACCI SERIES
  int floors = 20;                                //FLOORS OR STAGES INTERPRETED AS HOW MANY LOOPS TO DO WITHING THE SERIES
  int serieAnte = 1;                              //INITIAL SETTINGS TO START CALCULATING THE SERIES
  int seriePred = 0;
  int serieResu = 0;
  int fibonacciSum = 0;                           //TOTAL SUM OF THE WHOLE SERIE
  int[] fibonacciSeries = new int[floors];        //ARRAY OF THE SERIES
  int fibosIndex = 0;                             //INDEX TO ITERATE THROUGH THE SERIES
  int branchID = 0;                               //TOTAL OF BRANCHES CREATED
  //SETTINGS FOR THE TREE
  int y1 = 499;                                    //TREE'S ROOT
  int x1 = 255;
  float plusAngle = 0;                             //INCREASSING ANGLE TO GIVE THE SUBSEQUENT BRANCHES MORE RATIO TO MOVE
  float angleRatio = PI/15;                        //ANGLE'S RATIO ALLOWED
  float scale = 140;                               //INITIAL STEM'S HEIGHT
  float thikness = 9;                              //INITIAL STEM'S THICKNESS
  float rule = 1.3;                                //DECREASE REASON
  float r, g, b;                                   //COLORS



  size(500, 500);
  smooth();
  //GET THE FIBONACCI SERIES AND THE SUM PF THE WHOLES SERIES
  for (int i = 0; i < floors ;i++) {
    serieResu = seriePred + serieAnte;
    seriePred = serieAnte;
    serieAnte = serieResu;
    fibonacciSeries[i] = serieResu;               //STORE EACH ELEMENT OF THE SERIES IN AN ARRAY
    fibonacciSum = fibonacciSum + serieResu;
  }

  nLines  = new Lines[fibonacciSum];              //ALLOCATION OF THE TOTAL AMOUNT OF BRANCHES TO BE CREATED
  //INITIAL COLORS
  r = 153;
  g = 102;
  b = 0;

//THIS IS SUPPOSED TO BE THE STEM 
  nLines[0] = new Lines(x1, y1, plusAngle, scale, thikness, r - 0.5, g + 1, b);  
  nLines[0].singleLine();
  branchID++;

//HERE IS WHERE THE MAGIC HAPPENS
  for (int i = 1; i < floors; i++) {      //LOOP AS MANY FLOORS SET
    int m = fibonacciSeries[i-1];         //FROM THE SERIES ARRAY GET THE RANGE OF LOOPS FOR THE SUBSEQUENT AMOUNT OF NEW BRANCHES
    int n = fibonacciSeries[i];
    scale = scale / rule;                 //SCALE THE NEW BRANCHES AND THICKNESS
    thikness = thikness / rule;
    x1 = nLines[branchID-1].x2;           //FROM THE PREVIOUS BRANCH GET IT'S FINAL SEGMENT'S COORDINATES SO WE MAY DRAW A NEW LINE FROM A STARTING POINT
    y1 = nLines[branchID-1].y2;
    int max = 0;                          //NUM OF BIFURCATIONS PER BRANCH
    
    for(int j = 0; j < n; j++){
      r = r - 0.5;                         //FOR EACH NEW BRANCH DEGRADE COLOR TIL WE FIND A SOLID GREEN
      g = g + 1;
      b = 0;
      nLines[branchID] = new Lines(x1, y1, plusAngle, scale, thikness, r , g , b ); //FROM THE RANGE THAT IS THE TOATAL OF UNITS BETWEEN EACH SERIE'S ELEMENTS , DRAW A NEW BRANCH
      nLines[branchID].singleLine();
      max++;
     if(max >= 2){                          //ONLY TWO NEW ELEMENTS PER BRANCH
       branchID++;                          //IF THE NUMBER IS EXCEDED ADVANCE TO THE NEW PREVIOUS BRANCH I MEAN THE ONE STANDING IN THE STAGE BELLOW
       x1 = nLines[m-1].x2;
       y1 = nLines[m-1].y2;
       m++;
     }else{
       branchID++;
     } 
    }
    plusAngle = plusAngle + angleRatio;          //FOR EVERY STAGE FLOOR LOOP OPEN THE ANGLE
    
  }

}



//USE THIS CLASS TO MAKE AN ARRAY OF SEGMENTS(LINES)
class Lines {
  int x1, x2, y1, y2;
  float oscilationAngle;
  float oscilationAngleRatio = HALF_PI;
  float scale;
  float fret = 255;
  float fretScale = 17.817;
  float thikness;
  float rColor, gColor, bColor;


  Lines(int _x1, int _y1, float _oscilationAngleRatio, float _scale, float _thikness, float _rColor, float _gColor, float _bColor) {
    x1 = _x1;
    y1 = _y1;
    oscilationAngleRatio =  _oscilationAngleRatio;
    scale = _scale;
    thikness = _thikness;
    rColor = _rColor;
    gColor = _gColor;
    bColor = _bColor;
  }

  void singleLine() {
    stroke(rColor, gColor, bColor);
    strokeWeight(thikness);

    fret = scale/fretScale;
    scale = scale - fret;

    oscilationAngle = random(((5*PI)/12) - oscilationAngleRatio , (7*PI)/12 + oscilationAngleRatio);
    x2 = x1 + int(cos(oscilationAngle) * scale);
    y2 = y1 -  int(sin(oscilationAngle) * scale);

    line(x1, y1, x2, y2);
  }
}



