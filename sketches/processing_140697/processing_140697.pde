
/**********************************

        Seiya Iwasaki
             19-3-2014
          
**********************************/

//dec gloval editable var 
int sc_size = 700;                      // screen size
int noc = 5;                            // number of circle
int max_b = 20;                         // max number of balls on circle
float max_s = 0.6;                      // max speed of balls = angle
int b_size = 15;                        // ball size = pixel
int ioc = 120;                          // interval of circles = pixel * 2
int iob = 10;                           // interval of balls = angle
int rtal = 130;                         // range to adapt lines = pixel
int ssoc = 1;                           // strokesize of circle = pixel
int ssob = 6;                           // strokesize of ball = pixel
//dec gloval var
int[] nob = new int[noc];                     // number of ball on each circle
float[][] aob = new float[noc][max_b];        // angle of ball on each circle
float[][][] pob = new float[noc][max_b][2];   // position of all balls. [][][]=[circle][ball][X or Y]
float[] sob = new float[noc];                 // speed of balls
float Cx = sc_size / 2, Cy = sc_size / 2;     // center positon X and Y
float R = 10;                                 // rdius of circle

void setup(){
  size(sc_size,sc_size);
  colorMode(HSB,360,100,100);
  background(0,0,99);
  smooth();
  init_gv();
  R = 10;
}

void draw(){
  
  /** reset screen **/
  rescr();
  
  /** start animation **/
  if(R < (ioc / 2)){
    R += 3;
  }else if(R > (ioc / 2)){
    R = ioc / 2;
  }
  
  /** draw circles **
  noFill();
  stroke(0,0,80);
  strokeWeight(ssoc);
  for(int i = 0; i < noc; i++){
    ellipse(Cx, Cy, 2*R + (2*R * i),2*R + (2*R * i));
  }*/
  
  /** draw lines **/
  noFill();
  stroke(0,75,99,95);
  strokeWeight(ssoc);
  for(int i = 0; i <= noc - 1; i++){
    for(int j = 0; j < nob[i]; j++){
      for(int m = noc - 1; m >= i; m--){
        if(i == 0 && m == 0) break;
        for(int k = 0; k < nob[m]; k++){
          if(int(sqrt(sq(pob[m][k][0] - pob[i][j][0]) + sq(pob[m][k][1] - pob[i][j][1]))) <= rtal){
            line(pob[m][k][0], pob[m][k][1], pob[i][j][0], pob[i][j][1]);
          }
        }
      }
    }
  }
  
  /** draw balls **/
  fill(0,0,40,90);
  stroke(0,0,25,95);
  strokeWeight(ssob);
  for(int i = 0; i < noc; i++){
    for(int j = 0; j < nob[i]; j++){
      pob[i][j][0] = Cx + ( (R+(R*i)) * cos(radians(aob[i][j])) );
      pob[i][j][1] = Cy + ( (R+(R*i)) * -sin(radians(aob[i][j])) );
      ellipse(pob[i][j][0], pob[i][j][1], b_size, b_size);
      aob[i][j] += sob[i];
      if(aob[i][j] >= 360){
        aob[i][j] -= 360;
      }
    }
  }
        
  /** Updating speed regulation **/
  //delay(10);          // stop program milliseconds 1/1000 s
                        // not available in javascript
  
  /** reset **/
  if(mouseButton == LEFT){
    setup();
  }
}

/*** init gloval var ***/
void init_gv(){
  int j = 1;
  
  /** init nob[] & sob[] **/
  for(int i = 0; i < noc; i++){                        // count = number of circles
     nob[i] = int(random(10,max_b));                   // random number of balls on each circle
     sob[i] = random(0,max_s) * j;                     // random speed of balls on each circle
     j = j * (-1);
  }
  
  /** init aob[][] **/
  for(int i = 0; i < noc; i++){
    for (j = 0; j < nob[i]; j++){                  // count = number of balls on No.i circle
      aob[i][j] = random(0,360);                       // adapt random angle to each ball
      for(int k = 0; k < j; k++){                      // count = number of else balls on same circle
        if(abs(aob[i][j] - aob[i][k]) <= iob){         // compared with the position of else balls on the same circle
          j--;
          break;
        }
      }
    }
  }
}

/*** reset screen ***/
void rescr(){
  noStroke();
  fill(0,0,99);
  rectMode(CORNER);
  rect(0,0,sc_size,sc_size);
}
