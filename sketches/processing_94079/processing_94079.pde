
float[] unRate = new float[48];
float[] pop = new float[48];
float[] income = new float[48];
PImage[] states = new PImage[49];
boolean[] flags = new boolean[48];

//3139 x 1524

PImage alabama;
PImage arizona;
PImage arkansas;
PImage california;
PImage colorado;
PImage connecticut;
PImage delaware;
PImage florida;
PImage georgia;
PImage idaho;
PImage illinois;
PImage indiana;
PImage iowa;
PImage kansas;
PImage kentucky;
PImage louisiana;
PImage maine;
PImage maryland;
PImage massachusetts;
PImage michigan;
PImage minnesota;
PImage mississippi;
PImage missouri;
PImage montana;
PImage nebraska;
PImage nevada;
PImage newhampshire;
PImage newjersey;
PImage newmexico;
PImage newyork;
PImage northcarolina;
PImage northdakota;
PImage ohio;
PImage oklahoma;
PImage oregon;
PImage pennsylvania;
PImage rhodeisland;
PImage southcarolina;
PImage southdakota;
PImage tennessee;
PImage texas;
PImage utah;
PImage vermont;
PImage virginia;
PImage washington;
PImage westvirginia;
PImage wisconsin;
PImage wyoming;
PFont font;






void setup(){
  size(850, 600);
  background(255);
  font = createFont("Arial", 32);
  fill(0);
  textFont(font, 32);
  textAlign(CENTER);
  
  alabama = loadImage("alabama.gif");
  arizona = loadImage("arizona.gif");
  arkansas = loadImage("arkansas.gif");
  california = loadImage("california.gif");
  colorado = loadImage("colorado.gif");
  connecticut = loadImage("connecticut.gif");
  delaware = loadImage("delaware.gif");
  florida = loadImage("florida.gif");
  georgia = loadImage("georgia.gif");
  idaho = loadImage("idaho.gif");
  illinois = loadImage("illinois.gif");
  indiana = loadImage("indiana.gif");
  iowa = loadImage("iowa.gif");
  kansas = loadImage("kansas.gif");
  kentucky = loadImage("kentucky.gif");
  louisiana = loadImage("louisiana.gif");
  maine = loadImage("maine.gif");
  maryland = loadImage("maryland.gif");
  massachusetts = loadImage("massachusetts.gif");
  michigan = loadImage("michigan.gif");
  minnesota = loadImage("minnesota.gif");
  mississippi = loadImage("mississippi.gif");
  missouri = loadImage("missouri.gif");
  montana = loadImage("montana.gif");
  nebraska = loadImage("nebraska.gif");
  nevada = loadImage("nevada.gif");
  newhampshire = loadImage("newhampshire.gif");
  newjersey = loadImage("newjersey.gif");
  newmexico = loadImage("newmexico.gif");
  newyork = loadImage("newyork.gif");
  northcarolina = loadImage("northcarolina.gif");
  northdakota = loadImage("northdakota.gif");
  ohio = loadImage("ohio.gif");
  oklahoma = loadImage("oklahoma.gif");
  oregon = loadImage("oregon.gif");
  pennsylvania = loadImage("pennsylvania.gif");
  rhodeisland = loadImage("rhodeisland.gif");
  southcarolina = loadImage("southcarolina.gif");
  southdakota  = loadImage("southdakota.gif");
  tennessee = loadImage("tennessee.gif");
  texas = loadImage("texas.gif");
  utah = loadImage("utah.gif");
  vermont = loadImage("vermont.gif");
  virginia = loadImage("virginia.gif");
  washington = loadImage("washington.gif");
  westvirginia = loadImage("westvirginia.gif");
  wisconsin = loadImage("wisconsin.gif");
  wyoming = loadImage("wyoming.gif");
  
  
  states[1] = alabama;
  states[2] = arizona;
  states[3] = arkansas;
  states[4] = california;
  states[5] = colorado;
  states[6] = connecticut;
  states[7] = delaware;
  states[8] = florida;
  states[9] = georgia;
  states[10] = idaho;
  states[11] = illinois;
  states[12] = indiana;
  states[13] = iowa;
  states[14] = kansas;
  states[15] = kentucky;
  states[16] = louisiana;
  states[17] = maine;
  states[18] = maryland;
  states[19] = massachusetts;
  states[20] = michigan;
  states[21] = minnesota;
  states[22] = mississippi;
  states[23] = missouri;
  states[24] = montana;
  states[25] = nebraska;
  states[26] = nevada;
  states[27] = newhampshire;
  states[28] = newjersey;
  states[29] = newmexico;
  states[30] = newyork;
  states[31] = northcarolina;
  states[32] = northdakota;
  states[33] = ohio;
  states[34] = oklahoma;
  states[35] = oregon;
  states[36] = pennsylvania;
  states[37] = rhodeisland;
  states[38] = southcarolina;
  states[39] = southdakota;
  states[40] = tennessee;
  states[41] = texas;
  states[42] = utah;
  states[43] = vermont;
  states[44] = virginia;
  states[45] = washington;
  states[46] = westvirginia;
  states[47] = wisconsin;
  states[48] = wyoming;
  
  
  
  
 //scale(800./3139);
  
  String[] st;
  String[] lines = loadStrings("unemployment.txt");
  
   for(int i = 0; i < 48; i++){
    st = lines[i].split("\t");
    unRate[i] = float(st[1]);
  }
  
  lines = loadStrings("pop.txt");
  
   for(int i = 0; i < 48; i++){
    st = lines[i].split("\t");
    pop[i] = float(st[1])/1000000;
  }
  
  lines = loadStrings("income.txt");
  
   for(int i = 0; i < 48; i++){
    st = lines[i].split("\t");
    income[i] = float(st[1])/8000;
  }
  
}


float c = 0;
float s = 150;

void draw(){
  if (info == 0){
    display(unRate);
    text("Unemployment", 425, 70);
  }else if (info == 1){ 
    display(pop);
    text("Population", 425, 70);
  }else if (info == 2){ 
    display(income);
    text("Median Income", 425, 70);
  }
}

int info;

void mousePressed(){
  c = 0;
  s = 150;
  background(255);
  flags = new boolean[48];
  info = (info+1)%3;
}


PImage temp;
float r;
float g;
float b;
float a;

void display(float[] data){
  for(int i = 1; i < 49; i++){
    if(data[i-1] > c)
      image(states[i],25, s);
    else if (data[i-1] <= c && !flags[i-1]){
      flags[i-1] = true;
      temp = new PImage(800, 388);
      try{
        temp = (PImage)states[i].clone();
      } catch(Exception e){
        println(e);
      }
      for(int loc = 0; loc < temp.pixels.length; loc++){
     
        r = red (temp.pixels[loc]);
        g = green (temp.pixels[loc]);
        b = blue (temp.pixels[loc]);
        a = alpha(temp.pixels[loc]); 
        r *= 1.5;
        g *= 1.5;
        b *= 1.5;
        r = constrain(r,0,255); 
        g = constrain(g,0,255);
        b = constrain(b,0,255);
        color c = color(r,g,b,a);
        temp.pixels[loc] = c;
      }
      temp.updatePixels();
      image(temp,25, s);
    }   
  }
  c+=.4;
  s-=1;
}


