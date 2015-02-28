
          int temperature = 30;
int pHLevel = 7;
int envSpeed = 30;
ArrayList<Substrate> subs;
ArrayList<Enzyme> enz;


void setup(){
  size(700,600);
  background(255);
  smooth();  
   subs = substratePopulator(100);
   enz = enzymePopulator(10);
}

void draw(){
  
  background(0);
  PFont font = loadFont("Tahoma-12.vlw"); 
  textFont(font);
  String t = "Temperature ";
  String p = "pH ";
  text( t + temperature, 25, 50);
  text( p + pHLevel, 500, 50);
  
  for(int i = 0; i < enz.size()-1; i++) {  
    enz.get(i).display();
    frameRate(envSpeed);
  }
 
  
  for(int j = 0; j < subs.size() - 1; j++) {
    getSubstrate(j).display();
   }
   
    if(temperature >= 100) {
      temperature = 100;
    } else if( temperature <= 0) {
      temperature = 0;
    } 
    if(pHLevel >= 14) {
      pHLevel = 14;
    } else if(pHLevel <= 0) {
      pHLevel = 0;
    }
    
   if(pHLevel != 0 || pHLevel != 14 || temperature != 0 || temperature != 100) {
     move();
   }
   
   
    
}




//Returns a substrate in the ArrayList at a certain index
Substrate getSubstrate(int i)
{
  return (Substrate)subs.get(i);
}

//Starts off with a certain number of enzymes
ArrayList enzymePopulator(int a)
{
  ArrayList<Enzyme> beg = new ArrayList<Enzyme>();
 
  while (a > 0)
  {
   float x = random(width);
    Enzyme e = new Enzyme(int(x), (int)random(height));
    a--;
    beg.add(e);
    println(x);
  }
  return beg;
}

//Starts off with a certain number of substrates
ArrayList substratePopulator(int a)
{
  ArrayList<Substrate> beg = new ArrayList<Substrate>();
 
  while (a > 0)
  {
   Substrate s = new Substrate((int)random(height), (int)random(width));
    a--;
    beg.add(s);
  }
  return beg;
}

//Creates a substrate
void createSubstrate() {
 Substrate a = new Substrate((int)random(height), (int)random(width));
 subs.add(a);
 a.display();
 }

//Creates an enzyme, which breaks down substrates
void createEnzyme() {
  Enzyme e = new Enzyme((int)random(height), (int)random(width));
  enz.add(e);
  e.display();
}

void mousePressed() {
   createSubstrate();
}

void keyPressed(){
  if(key == 't' || key == 'T') {
    temperature += 10;
    if(temperature > 30) {
      envSpeed -= 1;
    } else if(temperature < 30) {
      envSpeed += 1;
    }
   }
  else if(key == 'g' || key == 'G') {
    temperature -= 10;
     if(temperature > 30) {
      envSpeed += 1;
    } else if(temperature < 30) {
      envSpeed -= 1;
    }
  } else if(key == 'p' || key == 'P') {
    pHLevel += 1;
    if(pHLevel > 7) {
      envSpeed -= 1;
    } else if(pHLevel < 7) {
      envSpeed += 1;
    }
  } else if(key == 'l' || key == 'L') {
    pHLevel -= 1;
    if(pHLevel > 7) {
      envSpeed += 1;
    } else if(pHLevel < 7) {
      envSpeed -= 1;
    }
    } else if(key == 'e' || key == 'E') {
    createEnzyme();
  }
 
}

void move(){
    for(int i = 0; i < enz.size()-1; i++) {  
      int next = enz.get(i).getEnzymeX() + 1;
      Enzyme a = new Enzyme(next, enz.get(i).getEnzymeY());  
      enz.set(i, a);
  }
}


class Substrate {
  private int xloc = 0;
  private int yloc = 0;
  public Substrate(int h, int w) {
    xloc = h;
    yloc = w;
  }
  void display() {
    fill(100,100,100);
    ellipse(xloc, yloc, 25,25);
  }
  
  public int getSubstrateX() {
    return xloc;
  }
  
  public int getSubstrateY(){
    return yloc;
  }

}

class Enzyme {
  private int xloc = 0;
  private int yloc = 0;
 
  public Enzyme(int h, int w) {
    xloc = h;
    yloc = w;
  }
  
  void display() {
  smooth();
  fill(0, 255, 0);
  ellipse(xloc, yloc, 50, 30);
  }
  
  public int getEnzymeX() {
    return xloc;
  }
  
  public int getEnzymeY() {
    return yloc;
  }
 
}



