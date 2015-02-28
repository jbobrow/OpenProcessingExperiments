
PImage bg;

States state[] = new States[50];
int timer;
int year;
boolean run = true;
boolean showMap = false;

void setup() {
  size(574,350);
  bg = loadImage("us_map.jpg");
  timer = 0;
  year = 1987;
  
  state[0] = new States(375,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0); //AL
  state[1] = new States(320,190,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //AK 
  state[2] = new States(120,275,0,0,0,0,1,0,5,2,1,0,1,0,0,1,0,1,0,0,1,0,0,0,1,1,0,0,1); //AZ
  state[3] = new States(130,200,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //AR
  state[4] = new States(55,170,1,3,16,19,20,33,15,16,5,3,12,6,5,12,6,8,0,9,10,0,1,0,14,5,4,2,4); //CA
  state[5] = new States(190,140,0,0,0,0,0,0,1,2,0,0,1,0,0,1,0,2,0,1,1,0,0,0,1,1,0,0,0); //CO  
  state[6] = new States(515,105,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,1,0,0,1,0,0,0,1,1,0,0,2); //CT  
  state[7] = new States(487,142,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0); //DE   
  state[8] = new States(430,290,0,0,0,1,3,0,5,8,4,0,4,2,0,4,1,3,0,0,5,0,0,0,3,0,0,0,0); //FL     
  state[9] = new States(410,225,0,0,0,0,0,0,1,1,1,0,1,0,0,0,1,1,0,1,1,0,0,0,1,1,0,0,0); //GA   
  state[10] = new States(60,300,0,0,0,0,0,0,0,0,0,1,0,1,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0); //HI   
  state[11] = new States(105,80,0,0,0,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0); //ID    
  state[12] = new States(250,125,0,0,0,1,0,1,2,2,2,0,1,0,0,1,0,1,0,2,1,0,0,0,1,1,0,0,2); //IL   
  state[13] = new States(380,130,0,0,0,0,0,0,0,2,0,0,1,0,0,1,0,1,0,0,1,0,0,0,0,0,0,0,0); //IN  
  state[14] = new States(305,100,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2,0,0,0,0,0,0,0,0); //IA   
  state[15] = new States(260,145,0,0,0,0,3,0,0,2,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0); //KS
  state[16] = new States(390,160,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //KY     
  state[17] = new States(320,240,0,0,0,0,0,0,1,2,1,0,0,1,0,0,1,0,0,1,0,1,0,0,1,0,0,0,0); //LA  
  state[18] = new States(550,55,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0); //ME  
  state[19] = new States(475,135,0,0,0,0,0,0,1,1,1,0,1,1,0,0,1,1,0,0,1,0,0,0,1,0,1,0,0); //MD  
  state[20] = new States(525,97,0,0,0,0,0,1,1,3,2,0,1,1,0,3,2,1,0,0,2,0,0,0,1,1,0,0,0); //MA  
  state[21] = new States(395,90,0,0,0,0,0,1,1,3,1,0,1,2,0,1,1,2,0,0,2,0,0,0,1,1,0,0,0); //MI   
  state[22] = new States(300,50,0,0,0,1,3,2,1,2,0,0,1,0,0,1,2,1,0,1,1,0,0,0,1,0,0,0,0); //MN
  state[23] = new States(345,220,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //MS  
  state[24] = new States(320,150,0,0,0,0,0,0,0,1,0,0,0,1,0,0,2,1,0,0,2,0,0,0,2,0,0,0,0); //MO  
  state[25] = new States(155,35,0,0,0,1,1,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0); //MT   
  state[26] = new States(250,110,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0); //NE  
  state[27] = new States(80,130,0,0,0,0,0,0,1,0,0,0,0,0,0,1,0,1,0,2,2,0,0,0,1,0,0,1,0); //NV  
  state[28] = new States(525,85,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0); //NH  
  state[29] = new States(495,130,0,0,0,1,0,2,1,2,0,0,0,2,0,2,1,2,0,1,2,1,0,0,0,4,0,1,0); //NJ 
  state[30] = new States(185,200,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0); //NM    
  state[31] = new States(490,90,0,0,0,1,0,1,1,15,5,1,5,7,0,8,7,5,0,6,9,0,0,0,10,4,2,3,2); //NY  
  state[32] = new States(450,180,0,0,0,0,0,0,0,2,0,0,1,0,0,0,1,2,0,0,2,0,0,0,0,0,0,0,0); //NC  
  state[33] = new States(240,30,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0); //ND       
  state[34] = new States(415,125,0,0,0,0,0,1,1,8,2,0,1,2,0,1,1,2,0,1,3,0,0,0,0,0,0,1,0); //OH   
  state[35] = new States(275,185,0,0,0,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,1,0,0,0,0,0,0,0,0); //OK    
  state[36] = new States(45,80,0,0,0,0,0,0,1,1,1,0,1,0,0,0,0,0,0,1,1,0,0,0,0,0,0,0,0); //OR   
  state[37] = new States(465,115,0,0,0,1,0,0,2,6,3,0,1,2,0,1,2,2,0,1,2,0,0,0,2,0,0,0,2); //PA  
  state[38] = new States(525,105,0,0,0,0,0,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,2); //RI   
  state[39] = new States(435,205,0,0,0,0,0,0,1,1,3,0,0,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0); //SC
  state[40] = new States(245,70,0,0,0,2,3,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //SD  
  state[41] = new States(380,180,0,0,0,0,1,0,1,0,1,0,0,1,0,1,1,0,0,0,1,0,0,0,1,0,0,0,0); //TN    
  state[42] = new States(260,240,0,0,0,0,0,1,12,7,3,0,2,2,0,3,3,3,0,2,2,0,0,0,2,1,1,0,2); //TX   
  state[43] = new States(135,140,0,0,0,0,0,0,1,1,0,0,1,0,0,1,0,1,0,1,1,0,0,0,1,0,0,0,0); //UT  
  state[44] = new States(515,70,0,0,0,0,0,0,0,0,0,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //VT     
  state[45] = new States(460,155,0,0,0,0,0,0,4,1,0,0,1,0,0,3,0,1,0,0,1,0,0,0,0,1,0,0,2); //VA   
  state[46] = new States(50,30,0,0,0,0,0,3,1,3,1,0,1,1,1,3,2,3,0,1,1,0,0,0,1,0,0,0,0); //WA
  state[47] = new States(430,150,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //WV   
  state[48] = new States(345,70,0,0,0,1,1,3,1,4,0,0,1,2,0,0,3,1,0,1,1,0,0,0,0,0,0,0,0); //WI
  state[49] = new States(175,90,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0); //WY
  
}

void draw() {
  if(showMap == true){
  image(bg, 0, 0); //shows the map
  }
  else{
  background(0); //black bg
  }
  timer++;
  
    if (timer % 80 == 0) {
      if(run == true){ //if not paused
      for (int a=0;a<state.length;a++) {
          state[a].changeAmount(); //goes to next year's concert stats
         }
    if(year<2013){  
      year++;
    }
    else{
      year = 1987; //resets year after 2013
    }
      }
      }
  for (int b=0;b<state.length;b++) {
    state[b].display(); //shows states
    textSize(30);
    fill(255);
    text(year, 490, 340); 
    
    if(run == false){
      if(year == 1990){
        textSize(20);
        fill(255);
        text("39/Smooth", 10, 340); //first studio album!
      }
      if(year == 1992){
        textSize(20);
        fill(255);
        text("Kerplunk", 10, 340); 
      }
      if(year == 1994){
        textSize(20);
        fill(255);
        text("Dookie", 10, 340); 
      }
      if(year == 1995){
        textSize(20);
        fill(255);
        text("Insomniac", 10, 340); 
      }
      if(year == 1997){
        textSize(20);
        fill(255);
        text("Nimrod", 10, 340); 
      }
      if(year == 1999){
        textSize(20);
        fill(255);
        text("Life Without Warning Tour", 10, 340); 
      }
      if(year == 2000){
        textSize(20);
        fill(255);
        text("Warning", 10, 340); 
      }
      if(year == 2002){
        textSize(20);
        fill(255);
        text("Pop Disaster Tour", 10, 340); 
      }
      if(year == 2004){
        textSize(20);
        fill(255);
        text("American Idiot", 10, 340); 
      }
      if(year == 2005){
        textSize(20);
        fill(255);
        text("American Idiot World Tour", 10, 340); 
      }
      if(year == 2009){
        textSize(20);
        fill(255);
        text("21st Century Breakdown", 10, 340); 
      }
      if(year == 2010){
        textSize(20);
        fill(255);
        text("21st Century Breakdown World Tour", 10, 340); 
      }
      if(year == 2012){
        textSize(20);
        fill(255);
        text("¡Uno! ¡Dos! ¡Tré!", 10, 340); 
      }
      if(year == 2013){
        textSize(20);
        fill(255);
        text("99 Revolutions Tour", 10, 340); 
      }
    }
  }
  
}
void keyPressed() { //pause if any key is pressed
 if(run == true){
      run = false; 
    }
 else{
      run = true;
    }
}

void mousePressed(){
  if(showMap == false){
      showMap = true;
  }
  else{
      showMap = false;
  }
}
class States {
  int xPos;
  int yPos;
  float amount[] = new float[27]; //accounts for each index in carrying out each state's mission
  int currentIndex = 0;
 
  States(int _xPos, int _yPos, float _0, float _1, float _2, float _3, float _4, float _5, float _6, float _7, float _8, float _9, float _10, float _11, float _12, float _13, float _14, float _15, float _16, float _17, float _18, float _19, float _20, float _21, float _22, float _23, float _24, float _25, float _26) {
    xPos = _xPos;
    yPos = _yPos;
    amount[0] = _0;
    amount[1] = _1;
    amount[2] = _2;
    amount[3] = _3;
    amount[4] = _4;
    amount[5] = _5;
    amount[6] = _6;
    amount[7] = _7;
    amount[8] = _8;
    amount[9] = _9;
    amount[10] = _10;
    amount[11] = _11;
    amount[12] = _12;
    amount[13] = _13;
    amount[14] = _14;
    amount[15] = _15;
    amount[16] = _16;
    amount[17] = _17;
    amount[18] = _18;
    amount[19] = _19;
    amount[20] = _20;
    amount[21] = _21;
    amount[22] = _22;
    amount[23] = _23;
    amount[24] = _24;
    amount[25] = _25;
    amount[26] = _26;
  }
  void changeAmount() {
    currentIndex++;
    if (currentIndex >= amount.length) { //restarts from the first index
      currentIndex = 0;
    }
  }
  void display() {
    noStroke();
    fill(0,255,0 );
    ellipse(xPos, yPos, int(amount[currentIndex])*2, int(amount[currentIndex])*2);
  }
}



