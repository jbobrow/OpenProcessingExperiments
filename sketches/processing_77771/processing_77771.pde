
//AC12010 - DATA VISUALISATION
//GROUP 9

//global variables
String[] l = new String[31];
String[][] user = new String[25][7];
float la;
float ua;
PFont font;
int maxa;
int mina;

//constants to help readability
int USER_ID = 0;
int FLUID = 1;
int INT_CONF = 2;
int PROCESSING_SPEED = 3;
int SHORT_MEM = 4;
int LONG_MEM = 5;
int INT_USAGE = 6;
int AGE = 7;

//initialisations
void setup() {
  
  font = loadFont("BerlinSansFB-Reg-48.vlw");
  textFont(font);
  
  //set up file reading
  BufferedReader r = createReader("data.csv");
  
  //set up data arrays from file
  try {
    
    int i = 0; int j = 0;
    int id = -1;
    do {
      l = r.readLine().split(",");  //read line
      if (int(l[19]) != id) {       //if new user is found, add details to array
        id = int(l[19]);
        user[j] = subset(l,19,8);
        j++;
      };
      i++;
    } while (i < 330);
    
  } catch (IOException e) {
    e.printStackTrace();
    l = null;
  }

  //window settings
  size(600,600);
  frameRate(60);  
  
  maxa = maxAge();
  mina = minAge();
  
}

int maxAge() {
  int m = 0;
  for (int i = 0 ; i < 21 ; i++)
    if (int(user[i][AGE]) > m)
      m = int(user[i][AGE]);
  return m;
}

int minAge() {
  int m = 100;
  for (int i = 0 ; i < 21 ; i++)
    if (int(user[i][AGE]) < m)
      m = int(user[i][AGE]);
  return m;
}

//program loop
void draw() {
  
  la = min(max(mouseX/6,18),maxa);
  ua = min(max(la,mouseY/6),maxa);
  
  fill(255);
  stroke(255);
  background(0);

  textAlign(CENTER,CENTER);
  text("Data set: ages "+int(la)+" to "+int(ua), 300, 40);
  
  stroke(50);
  line(300,0,300,600);
  line(0,300,600,300);
  stroke(255);
    
  fill(128,0,0,128);
  beginShape();
  vertex(300-average(int(la),int(ua),FLUID)*200, 300);
  vertex(300, 300-average(int(la),int(ua),PROCESSING_SPEED)*300);
  vertex(300+average(int(la),int(ua),LONG_MEM)*200, 300);
  vertex(300, 300+average(int(la),int(ua),SHORT_MEM)*200);
  endShape(CLOSE);
  endShape();
  

  if (round(average(int(la),int(ua),FLUID)*100) != 0) {
    
    fill(0,128,0,128);
    text("Internet...",300,460);
    
    fill(255,255);
    textSize(14);
    
    text(round(average(int(la),int(ua),FLUID)*100)+"% Fluid Intelligence", 300-average(int(la),int(ua),FLUID)*200, 300);
    text(round(average(int(la),int(ua),PROCESSING_SPEED)*100)+"% Processing Speed", 300, 300-average(int(la),int(ua),PROCESSING_SPEED)*300);
    text(round(average(int(la),int(ua),LONG_MEM)*100)+"% Long Term Memory", 300+average(int(la),int(ua),LONG_MEM)*200, 300);
    text(round(average(int(la),int(ua),SHORT_MEM)*100)+"% Short Term Memory", 300, 300+average(int(la),int(ua),SHORT_MEM)*200);
    
    fill(0,128,0,128);
    
    text(round(average(int(la),int(ua),INT_CONF)*100)+"% Confidence",250,530);
    rect(300,500,-average(int(la),int(ua),INT_CONF)*200,20);
    text(round(average(int(la),int(ua),INT_USAGE)*100)+"% Usage",340,530);
    rect(300,500,average(int(la),int(ua),INT_USAGE)*200,20);
    
  } else {
    fill(128,0,0,128);
    text("NO DATA",300,300);
  }
  
  textSize(50);
  
}

//calculate average of field
//using lower and upper bounds for age
float average(int age_lower, int age_upper, int field) {
  float total = 0;
  int j = 0;
  for (int i = 0 ; i < 21 ; i++)
    if(int(user[i][AGE]) >= age_lower && int(user[i][AGE]) <= age_upper) {
      total += float(user[i][field]);
      j++;
    }
  return total/j;
}

