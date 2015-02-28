
Layer myLayer1;
Layer myLayer2;
 
int nLayers = 7;
Layer[] myLayer  = new Layer[nLayers];
 
 
float yLand = 0;
float ySpeedLand;
 
PImage a;
void setup(){
 
  ySpeedLand = 0.5;
 
  frameRate(24);
  size(655,420,P2D);
  background(0);
  smooth();
  a = loadImage("GRID.jpg");
 
  for (int L=0;L<nLayers;L++){
    int nInvs = (2*(L*(L)))+1;//num invasors per row
    int  nParts = (2+nLayers)-(L);// num parts*parts in each invasor
    int rdmSise = (nLayers+1)-(L);
    float Speed = 1+(9-(L*1.6));
    float rdmSpeed = 1+(L-(L/2));
    color col = color(254-(L*5),255-(L*25),0+(L*10));
    //(n invaros, n parts, random sise, speed, random speed, color)
    myLayer[L]= new Layer(nInvs,  nParts, rdmSise,     Speed, rdmSpeed,     col);
 
  }
}
void draw(){
  image(a, 0, yLand);
 
  for(int nL=nLayers-1;nL>=0;nL--){
    myLayer[nL].Up();
  }
 
 
  yLand-=ySpeedLand;
  if (yLand<=-300 || yLand>=0){
    ySpeedLand*=-0.5;
  }
}

class Invasor {
  int xpos;
  float ypos;
 
  int sise; //pix size of each part
  int Parts; //ncols and nrows. now it works with odd an even numbers!;)
 
  float yspeed;
  float speed;
  float speedCorrect;
 
  int offset = 1;
 
  int[] x;
  int[] y;
  int[] pos;
  int[] partcol;
 
  int[]col = {95,112,255}; //paints for de parts, (with more grays works very fine too)
 
 
float oddOrEven;
 
  int j= 0;
  color rgb;
 
 
  Invasor(int tempXpos,float tempYpos, int tempSise, int tempParts, float tempSpeed, color tempRgb){
 
    xpos = tempXpos;
    ypos = tempYpos;
 
    sise = tempSise;
    Parts = tempParts;
 
    yspeed = tempSpeed;
    speed = tempSpeed;
     
    rgb = tempRgb;
 
    x = new int[Parts];
    y = new int[Parts];
    pos = new int[Parts];
    partcol = new int[Parts*Parts];
     
    oddOrEven = Parts%2;
 
    //parts position
    for(int i=0; i<Parts; i++){
      pos[i] = (offset);
      offset = offset + sise;
          }
 
    for (int a=0; a<Parts; a++){
      for (int b=0; b<Parts; b++){
        x[a] = pos[a];
        y[b] = pos[b];
      }
    }
 
    // parts paint//////////////////////
    //fill 1st half of invasor/////////////////
    for (int pc=0; pc<(Parts*ceil(Parts/2.0)); pc++){
      int rdm = round(random(col.length-1));
      partcol[pc]=col[rdm];
    }
 
    //copy to the 2nd half////////////////
   if (oddOrEven == 1.0){ ////(for odd invasors)//////
    for (int f=0;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2-1))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
  if (oddOrEven == 0.0){ ////(for even invasors)//////
    //copy to the 2nd half
    for (int f=1;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
 
 
  }
  void display() {
    for (int q=0; q<Parts; q++){
      for (int w=0; w<Parts; w++){
        strokeWeight(sise-3);
        stroke(rgb,10-partcol[j]);
        point(xpos+x[q],ypos+y[w]);
        j = j + 1;
        if(j == Parts*Parts){
          j = 0;
        }
      }
    }
 
 
  }
 
 
 
//////////////////////////////////
  void moveUp() {
    ypos = ypos - yspeed;
    if (ypos < 0-((sise*Parts)*1)) {
       
      //reload invasor/////////////////////////
      
       // parts paint/////////////////////////////
 
  //fill 1st half of invasor/////////////////////////////
  for (int pc=0; pc<(Parts*ceil(Parts/2.0)); pc++){
    int rdm = round(random(col.length-1));
    partcol[pc]=col[rdm];
  }
  //copy to the 2nd half
  if (oddOrEven == 1.0){ ////(for odd invasors)//////
    for (int f=0;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2-1))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
  if (oddOrEven == 0.0){ ////(for even invasors)//////
    //copy to the 2nd half//////////////////
    for (int f=1;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
   
      ypos = height+((sise*Parts)*4);
      speedCorrect = random(-1,1);
    }
  }
 
  void moveDown() {
    ypos = ypos + yspeed;
    if (ypos >= height+((sise*Parts)*2)) {
       
      //reload invasor///////////////////////////////
       
      // parts paint/////////////////////////////////////
  //fill 1st half of invasor//////////////////////////////
       for (int pc=0; pc<(Parts*ceil(Parts/2.0)); pc++){
    int rdm = round(random(col.length-1));
    partcol[pc]=col[rdm];
  }
  //copy to the 2nd half///
  if (oddOrEven == 1.0){ ///(for odd invasors)//////////////
    for (int f=0;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2-1))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
  if (oddOrEven == 0.0){ ////(for even invasors)//////
    //copy to the 2nd half
    for (int f=1;f<Parts;f=f+2){
      if(Parts>f){
        for (int pc=(Parts*ceil(Parts/2.0)+(Parts*(f/2))); pc<Parts*Parts; pc++){
          partcol[pc]=partcol[pc-(Parts*f)];
        }
      }
    }
  }
 
      ypos = 0-height-((sise*Parts)*2);
      speedCorrect = random(-1,1);
      yspeed = speed+speedCorrect;
    }
  }
}

class Layer {
 
  int nInvasors; //n invasors used/loaded
  int nParts; //n parts of each invasor ( ncols, nrows)
  int rdmSise; //amount of dif betwen each invasor sise
   
  float speed; // global speed
  float rdmSpeed; // random speed
   
  color col; // invaders color
 
  Invasor[] invasor = new Invasor[nInvasors];
  int []nSise = new int[nInvasors];
  int []xSpace = new int[nInvasors];
  float []nSpeed = new float[nInvasors];
        
     //(n invaros, n parts each invasor,    random sise,            speed,       random speed,         color)
  Layer(int tempInvasors, int tempParts, int tempRdmSise, float tempSpeed, float tempRdmSpeed, color tempCol){
     
     
  int nInvasors = tempInvasors; //n invasors used/loaded
  int nParts = tempParts; //n parts of each invasor ( ncols, nrows)
  int rdmSise = tempRdmSise; //amount of dif betwen each invasor sise
   
  float speed = tempSpeed; // global speed
  float rdmSpeed = tempRdmSpeed; // random speed
   
  col = tempCol; // invaders color
 
  invasor = new Invasor[nInvasors];
  nSise = new int[nInvasors];
  xSpace = new int[nInvasors];
  nSpeed = new float[nInvasors];
     
 
    for (int t=0;t<nInvasors;t++){
      int nSiseRelative = int(width/(nParts*nInvasors));
 
      nSise[t]= nSiseRelative + round(random(-rdmSise));
      xSpace[t]=((nSise[t]/2)+abs(rdmSise))+(t*(width/nInvasors));
      nSpeed[t]=speed*(random(0.5,rdmSpeed));
 
      invasor[t]= new Invasor((xSpace[t])+(rdmSise),height+((nSise[t]*nParts)*8),nSise[t],nParts,nSpeed[t],col);
    }
  }
  void Up() {
    for (int i = 0; i < invasor.length; i++) {
      invasor[i].moveUp(); // Move each object
      invasor[i].display(); // Display each object
    }
 
  }
  void Down() {
 
    for (int i = 0; i < invasor.length; i++) {
      invasor[i].moveDown(); // Move each object
      invasor[i].display(); // Display each object
    }
 
  }
} 

