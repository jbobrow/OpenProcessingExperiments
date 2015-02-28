
/*************************
      
      Seiya Iwasaki
            21-3-2014

*************************/

/** dec gloval editable var **/
int scr_s = 600;                     // screen size
int squ_n = 20;                      // the number of square
float speed = 1.6;                   // animation speed
int Saturation = 40;                 // square's saturation
int Brightness = 90;                 // square's brightness
int Opacity = 80;                    // square's opacity
/** dec gloval var **/
int[][] squ_p = new int[squ_n][2];        // squ_p[][] = [0 - squ_n][position = x or y]
float[][] squ_s = new float[squ_n][3];    // squ_s[][] = [0 - squ_n][size = max,current,flag]
int[][] squ_c = new int[squ_n][3];        // squ_c[][] = [0 - squ_n][color = H,S,B]
int count = 100;                          // counter

/*** setup ***/
void setup(){
  size(scr_s,scr_s);
  colorMode(HSB,360,100,100);
  background(0,0,99,0);
  smooth();
  strokeWeight(2);              // stroke size = pixel
  
  /** all square's init **/
  for(int i = 0; i < squ_n; i++){
    setpos(i);
    setsize(i);
    setcolor(i);
  }
}

/*** main ***/
void draw(){
  
  /** reset scr **/
  rescr();
  
  /** draw squares **/
  for(int i = 0; i < int(count/100); i++){
    fill(squ_c[i][0],squ_c[i][1],squ_c[i][2],Opacity);
    stroke(squ_c[i][0],squ_c[i][1]+20,squ_c[i][2],Opacity);
    rect(squ_p[i][0],squ_p[i][1],squ_s[i][1],squ_s[i][1]);
    
    /* add square size */
    if(squ_s[i][2] == 0){
      squ_s[i][1] += speed;
    }else{
      squ_s[i][1] -= speed;
    }
    
    /* compare max size and current size */
   if(squ_s[i][0] <= squ_s[i][1]){
     squ_s[i][2] = 1;                  // flag = 1
   }else if(squ_s[i][1] <= 0){         // if current size <= 0 then update square setting
     setpos(i);
     setsize(i);
     setcolor(i);
   } 
  }
  
  /** add count **/
  if(count < (squ_n * 100)){
    count++;
  }
}

/*** setting square position ***/
void setpos(int n){
  squ_p[n][0] = int(random(-100, (scr_s - 100)));  // X
  squ_p[n][1] = int(random(-100, (scr_s - 100)));  // Y
}

/*** setting square size ***/
void setsize(int n){
  squ_s[n][0] = random(60, (scr_s / 2));        // size = 60 - (scr_s / 2)
  squ_s[n][1] = 0;                              // current size = 0
  squ_s[n][2] = 0;                              // flag = 0
}

/*** setting square color ***/
void setcolor(int n){
  squ_c[n][0] = int(random(0,359));   // H
  squ_c[n][1] = Saturation;           // S
  squ_c[n][2] = Brightness;           // B
}

/*** reset screen ***/
void rescr(){
  noStroke();
  fill(0,0,99);
  rectMode(CORNER);
  rect(0,0,scr_s,scr_s);
}
