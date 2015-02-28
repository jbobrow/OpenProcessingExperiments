
int temperature = 30;
int pHLevel = 7;
int envSpeed = 15;
ArrayList<Substrate> subs;
ArrayList<Enzyme> enz;
ArrayList<Product> pro;


void setup(){
  size(700,600);
  background(255);
  smooth();  
   subs = substratePopulator(100);
   enz = enzymePopulator(10);
   pro = new ArrayList<Product>();
}

void draw(){
  frameRate(30);
  background(255);
  
  //Displays enzymes
  for(int i = 0; i < enz.size()-1; i++) {  
    enz.get(i).display();
  }
 
  //Displays products
  for(int i = 0; i < pro.size() - 1; i++){
     pro.get(i).display();
   }
   
   //Displays substrates
  for(int j = 0; j < subs.size() - 1; j++) {
    subs.get(j).display();
   }
   
  //Makes products
  for(int i = 0; i < enz.size() - 1; i++) {
    for(int j = 0; j < subs.size() - 1; j++) {
      if(enz.get(i).getEnzymeX() == subs.get(j).getSubstrateX() || enz.get(i).getEnzymeY() == subs.get(j).getSubstrateY()){
          Substrate temp = subs.get(j);
          Product p = new Product(temp.getSubstrateX(), temp.getSubstrateY());
          pro.add(p);
          subs.remove(subs.get(j));
          
      }
    }
  }
   
   //Limits the temperature and pH levels in this simulation
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
    
   //Checks for denaturing conditions 
   if(pHLevel == 0 || pHLevel == 14 || temperature == 0 || temperature == 100) {
     for(int i = 0; i < enz.size() - 1; i++){
       enz.remove(enz.get(i));
     }
   }

  move();
  productMove();
  fill(0);
    PFont font = loadFont("Tahoma-52.vlw"); 
    textFont(font);
    String t = "Temperature ";
    String p = "pH ";
    text( t + temperature, 25, 50);
    text( p + pHLevel, 500, 50);
    
}

//Starts off with a certain number of enzymes
ArrayList enzymePopulator(int a) {
  
  ArrayList<Enzyme> beg = new ArrayList<Enzyme>();
  while (a > 0)
  {
    float x = random(width);
    Enzyme e = new Enzyme(int(x), (int)random(height));
    a--;
    beg.add(e);
  }
  return beg;
}

//Starts off with a certain number of substrates
ArrayList substratePopulator(int a) {
  
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

 }

//Creates an enzyme, which breaks down substrates
void createEnzyme() {
  Enzyme e = new Enzyme((int)random(height), (int)random(width));
  enz.add(e);
  
}

void mousePressed() {
   createSubstrate();
}


void keyPressed(){
  if(key == 't' || key == 'T') {
    temperature += 10;
    if(temperature > 30 && temperature < 100) {
      envSpeed -= 1;
    } else if(temperature < 30 && temperature > 0) {
      envSpeed += 1;
    }
   }
  else if(key == 'g' || key == 'G') {
    temperature -= 10;
     if(temperature > 30 && temperature < 100) {
      envSpeed += 1;
    } else if(temperature < 30 && temperature > 0) {
      envSpeed -= 1;
    }
  } else if(key == 'p' || key == 'P') {
    pHLevel += 1;
    if(pHLevel > 7 && pHLevel < 14) {
      envSpeed -= 1;
    } else if(pHLevel < 7 && pHLevel > 0) {
      envSpeed += 1;
    }
  } else if(key == 'l' || key == 'L') {
    pHLevel -= 1;
    if(pHLevel > 7 && pHLevel < 14) {
      envSpeed += 1;
    } else if(pHLevel < 7  && pHLevel > 0) {
      envSpeed -= 1;
    }
    } else if(key == 'e' || key == 'E') {
    createEnzyme();
  }
 
}

//Moves enzymes
void move(){
    for(int i = 0; i < enz.size()-1; i++) {  
      int next = enz.get(i).getEnzymeX() + envSpeed;
      if(enz.get(i).getEnzymeX() > width - 10) {
        Enzyme a = new Enzyme(0, enz.get(i).getEnzymeY());
        enz.set(i,a);
      } else{
      
      Enzyme a = new Enzyme(next, enz.get(i).getEnzymeY());  
      enz.set(i, a);
      
    }
   }
}

//Makes the products fall down
void productMove(){

    for(int i = 0; i < pro.size()-1; i++) {  
      int next = pro.get(i).getProductY() + 2;
      Product a = new Product(pro.get(i).getProductX(), next);  
      pro.set(i, a);
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
    fill(0,0,255);
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
  fill(255, 0, 0);
  ellipse(xloc, yloc, 50, 30);
  }
  
  public int getEnzymeX() {
    return xloc;
  }
  
  public int getEnzymeY() {
    return yloc;
  }
 
}

class Product {
  private int xloc = 0;
  private int yloc = 0;
  
  public Product(int h, int w) {
    xloc = h;
    yloc = w;
  }
  
  void display() {
    fill(255, 0, 255);
    ellipse(xloc, yloc, 25, 25);
  }
  
  public int getProductX() {
    return xloc;
  }
  
  public int getProductY(){
    return yloc;
  }
}
