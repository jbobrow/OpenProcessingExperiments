
  // Hilbert L System - Jim Bumgardner, for both Processing and Processing.js
  // some extension by Markus Greim to identify prime numbers 
  
  String axiom = "A";
  String[] rules = {"A", "lBfrAfArfBl",  // production rules copied from wikipedia article on Hilbert curve
                    "B", "rAflBfBlfAr"};
  HashMap rulesH = new HashMap();
  
  int nbrGenerations = 4;
  float lineLength = 0;
  String lsys;
  
  void setup()
  {
    size(500,500);
    noLoop();
    setupLSystem();
  }
  
  void setupLSystem()
  {
    for (int j = 0; j < rules.length; j += 2) {
      rulesH.put(rules[j], rules[j+1]);
    }
  }
  
  String lsysGen(String lsys, String[] rules, int nbrGenerations)
  {
    while (nbrGenerations > 0) {
      String dst = "";
      for (int i = lsys.length()-1; i >= 0; --i) {
        String ch = lsys.substring(i,i+1);
        if (rulesH.containsKey(ch))
          dst += rulesH.get(ch);
        else
           dst += ch;
      }
      lsys = dst;
      --nbrGenerations; // 1 down
    }
    return lsys;
  }
  
  // Angles are in integer amounts (1 = 90 degrees) to avoid rounding error
  void lsysDraw(String src, float sx, float sy, float len, int angD) 
  {
    // Table of 90 degree sin/cos values
    int[][] sincos  = {{1,0},{0,1},{-1,0},{0,-1}}; 
  
    float px = sx;
    float py = sy;
     
    int steps = 0;
    // println("Drawing at " + px + "," + py);
    beginShape();
    vertex(px,py);
    
    for (int i = 0; i < src.length(); ++i) {
       String ch = lsys.substring(i,i+1);
       if (ch.equals("f")) {
         px += sincos[angD][0]*len;
         py += sincos[angD][1]*len;
         vertex(px,py);
         
             
       } else if (ch.equals("l")) {
         angD = (angD+3)%4; // Counter-clockwise turn
       } else if (ch.equals("r")) {
         angD = (angD+1)%4;  // Clockwise turn
       }
    }
    endShape();
  }
  
  
String lsysGen(String lsys, String[] rules, int nbrGenerations)
  {
    while (nbrGenerations > 0) {
      String dst = "";
      for (int i = lsys.length()-1; i >= 0; --i) {
        String ch = lsys.substring(i,i+1);
        if (rulesH.containsKey(ch))
          dst += rulesH.get(ch);
        else
           dst += ch;
      }
      lsys = dst;
      --nbrGenerations; // 1 down
    }
    return lsys;
  }
  
  // Angles are in integer amounts (1 = 90 degrees) to avoid rounding error
  void lsysDrawprime(String src, float sx, float sy, float len, int angD) 
  {
    // Table of 90 degree sin/cos values
    int[][] sincos  = {{1,0},{0,1},{-1,0},{0,-1}}; 
  
    float px = sx;
    float py = sy;
     
    int steps = 0;
    // println("Drawing at " + px + "," + py);
    beginShape();
    vertex(px,py);
    
    for (int i = 0; i < src.length(); ++i) {
       String ch = lsys.substring(i,i+1);
       if (ch.equals("f")) {
         px += sincos[angD][0]*len;
         py += sincos[angD][1]*len;
         vertex(px,py);
         steps = steps +1;
         if (prime(steps)){
             stroke(100);
             }
             else
             {
             stroke(19);
             }
             
             
       } else if (ch.equals("l")) {
         angD = (angD+3)%4; // Counter-clockwise turn
       } else if (ch.equals("r")) {
         angD = (angD+1)%4;  // Clockwise turn
       }
    }
    endShape();
  }  
  
  
  
 boolean prime(int n)
{
  if (n <= 1)  return false;
  else
  {
    if (n == 2 || n == 3)
    {
      return true;
    }
    if (n % 6 != 1 && n % 6 != 5)
    {
      return false;
    }
    for (int i = 1; 6*i+1 <= int(sqrt(n))+1; i++)
    {
      if (n % (6*i-1) == 0)  return false;
      if (n % (6*i-1) == 0)  return false;
    }
    return true;
  }
}
  
  
  void draw()
  {
    lsys = lsysGen(axiom,rules, nbrGenerations);
    // println("--> " + lsys);
    background(255);
    stroke(118);
    noFill();
    smooth();
    
    float lineLength = width/2.0 * pow(.5, nbrGenerations-1);
    strokeWeight(lineLength/2.0);
    strokeCap(PROJECT);
    // strokeJoin(ROUND);
     lsysDraw(lsys, lineLength/2, height-lineLength/2, width/2 * pow(.5, nbrGenerations-1), 0);
    //lsysDrawprime(lsys, lineLength/2, height-lineLength/2, width/2 * pow(.5, nbrGenerations-1), 0);
    
  }
  
  void mouseClicked()
  {
    if (mouseX > width/2) {
      nbrGenerations = min(8, nbrGenerations+1);
    }
    else {
      nbrGenerations = max(1, nbrGenerations-1);
    }
    redraw();
  }
  
  

