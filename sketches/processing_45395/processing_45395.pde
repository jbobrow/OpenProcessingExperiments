
int bCount=39;
PImage bg = new PImage();
War[] b = new War[bCount];
 
int[] val = {
  30000,
  183766,
  386,
  2116,
  43000, 
  36077,  
  86128,  
  62247,
  25000,  
  2500,
  300158,
  15437,
  4800,
  5000,
  1430,
  1509,
  700,
  1168,
  1615,
  1814,
  6643,
  74402,
  60000,
  150000,
  4527,
  8433,
  3800,
  12700,
  3450,
  23123,
  10000,
  300000,
  50000,
  57358,
  8040,
  2237,
  50000,
  20000,
  40059,
};
String[] name = {
  " 2011 Libyan civil war",
  " Iraq War",
  " War in South Ossetia",
  " 2006 Lebanon War",
  " Mexican Drug War",
  " War in Somalia",
  " War in Afghanistan",
  " War in North-West Pakistan",
  " Shia Insurgency in Yemen",
  " Sudanese nomadic conflicts",
  " War in Darfur",
  " Balochistan Conflict",
  " South Thailand Insurgency",
  " Conflict in the Niger Delta",
  " Gaza War",
  " Insurgency in the North Caucasus",
  " 2009 Nigerian sectarian violence",
  " Yemeni al-Qaeda crackdown",
  " Second Ivorian Civil War",
  " First Ivorian Civil War",
  " Second Intifada",
  " Second Chechen War",
  " Ituri Conflict",
  " Second Liberian Civil War",
  " Kargil War",
  " Kosovo War",
  " 1997 rebellion in Albania",
  " Nepalese Civil War",
  " Insurgency in Ogaden",
  " First Chechen War",
  " 1994 civil war in Yemen",
  " Burundi Civil War",
  " Civil war in Tajikistan",
  " Bosnian War",
  " War in Abkhazia",
  " War of Transnistria",
  " Sierra Leone Civil War",
  " Croatian War of Independence",
  " Gulf War",
};

PVector[] xy ={
  new PVector(470,310), //libya
  new PVector(545, 309), //Iraq
  new PVector(534, 270), //Ossetia
  new PVector(521, 292), //Lebanon
  new PVector(172, 335), //Mexico
  new PVector(546, 380), //Somalia
  new PVector(584, 296), //afghan
  new PVector(600, 299), //Pakisstan
  new PVector(550, 350), //yemen
  new PVector(517, 350), //sudan
  new PVector(513, 350), //darfur
  new PVector(600, 317), //Balochistan
  new PVector(695, 375), //thailand
  new PVector(445, 377), //Niger Delta
  new PVector(519, 303), //Gaza
  new PVector(538, 270), // N. Caucasus
  new PVector(450, 368), // Nigeris Sect
  new PVector(550, 352), //yemen
  new PVector(419, 373), //Ivoery Coast
  new PVector(421, 371), //1st Ivoery Coast
  new PVector(519, 300), //Infifada
  new PVector(538, 270), // Chechen
  new PVector(505, 380), //Ituri
  new PVector(411, 373), //Liberia
  new PVector(631, 299), //Kagil War
  new PVector(478, 273), //Kosovo War
  new PVector(478, 277), //Alabanian War
  new PVector(645, 315), //Nepal
  new PVector(546, 375), //Somalia
  new PVector(538, 270), //1st Chechen
  new PVector(550, 352), //yemen civil war
  new PVector(510, 400), //burundi
  new PVector(585, 277), //Tajik
  new PVector(470, 263), //Kosovo War
  new PVector(534, 270), // Abkhazia
  new PVector(495, 260), // Transnistria
  new PVector(403, 369), //Liberia
  new PVector(470, 261), //Kosovo War
  new PVector(545, 309), //Gulf War
};
 
void setup() {
  size(900,600 );
  bg = loadImage("map.png");
  background(bg);
  smooth();
  int btIndex=0;
  int t = 0;
  for (int x=100;x<width-2;x+=50) {
    for (int y=100;y<height-2;y+=50) {
      if(t<3){
       t++;
      x+=90;y+=0;
      }
      if (btIndex<bCount) {
        b[btIndex]= new War(btIndex, xy[btIndex].x, xy[btIndex].y, val[btIndex], name[btIndex]);
        btIndex++;
      }
    }
  }
  noFill();
}
 
void draw() {
  background(bg);
  fill(232,232,232);
  rect(0, 0, width, 45);
  fill(0,0,0);
  textAlign(CENTER);
  text("Military Conflicts Since 1990", width/2, 30);  
 
  for (int i=0;i<bCount;i++) {
    b[i].render();
  }
}
 
class War {
  int id=0;
  int val;
  float x;
  float y;
  float r;
  float m=1;
  String name;
 
  public War(int id, float x, float y, float r, String name) {
    this.id=id;
    this.x=x;
    this.y=y;
    val=(int)r;
    this.r=map(r, 0, 120000, 5, 50);
    m=30/r;
    this.name=name;
  }
 
  void render() {
    stroke(255);
    fill(255,0,0,100);
    noStroke();
    
    ellipse(x, y, r, r);
    if (dist(x, y, mouseX, mouseY) <r/2) {
      fill(255,0,0,127);
      noStroke();
      ellipseMode(CENTER);
      ellipse(x, y, r, r);      
      fill(0,0,0);
      textAlign(CENTER);
      text(""+name+": "+val, x, y+2);
    }
  }
}

