
/*

    Visualization for displaying node connectivity in a semiotic analysis of animated infographics
    A Mind map of denotative and connotative nodes was created and exported into a text file.
    This text file was then imported into Processing to find out the relative size of each node by its number of links. This was tried to find out if a visual repsesentation could clear out connections in a complex – if not messy – mind map.
    
    
    Clearly not working.
    
    Created by Hannu Kulju / 2014 

@pjs preload="http://http://www.animoottori.net/muut/stuxnet_2.txt"; //Link to file containing nodes.

*/


ArrayList nodes;        // <Node>
ArrayList inner; //IntList inner = new IntList();      // For tracking connections between nodes 
ArrayList linses; //IntList lines = new IntList();
ArrayList jarjestys; //IntList jarjestys = new IntList(); //  for organizing the nodes by amount of links
int matka = 5;                     //  Gap between nodes
float nopeus = .25;                //  Speed of nodes
float purkuNopeus = 80.0;          //  = Speed for reducing overlapping between nodes
float toleranssi = 15;             //  extra gap for nodes belonging to same group
float reunaToleranssi = 10;        //  Margin to image borders
float vetoKerroin = .5;
float tyontoKerroin = 1.25;
color[] colors = {#CCCCCC, #F50707, #D407F5, #072CF5, #07F5E7,#07F53C,#F4F5C7, #A74105,#D8F08C};
boolean found = false;


void setup() {
  //    Basic settings for project
  size(800, 800);
  ellipseMode(CENTER);
 
  //    Get nodes
  String noodit[] =  loadStrings("stuxnet_2.txt");    //Poimitaan rakenne

  nodes = new ArrayList();        // <Node>
  
   inner = new ArrayList(); 
   lines = new ArrayList();
   jarjestys = new ArrayList(); 

  int currLevel = 0;     //  Track last intendation
  for (int i = 0; i < noodit.length; i++) {
    int spaces = 0;      //  Current intendation in source file
    while (noodit[i].charAt(spaces * 4) == " ") { // tab = 4 empty spaces
      spaces++;
    }
    //  Remove intendation from line
    noodit[i] = noodit[i].substring(spaces*4);
    int doubleDash = noodit[i].indexOf(":");            //  Locate ':'
    int count = int(noodit[i].substring(0, doubleDash)); //  Extract running number
    noodit[i] = noodit[i].substring(doubleDash+1);        //  Remove number and ':'
    doubleDash = noodit[i].indexOf("(");                //  Locate '(' at end
    int colNum = 0;
    boolean denotative = false;                                 //  Havainnon taso on Denotatiivinen
   
    if (doubleDash >= 0) {
      denotative = noodit[i].charAt(doubleDash + 3) == "D";  // check for denotative/connotative
      colNum = int(noodit[i].substring(doubleDash+1, doubleDash+2));  //  Poimitaan numero sulkumerkin jÃ�Â¤lkeen
      noodit[i] = noodit[i].substring(0, doubleDash);      //  Poistetaan sulkumerkit ja loput tiedot
    }
     
    if (!listHasValue(lines,count)) lines.add(new int(count));
    //lines.sort();

    //  Add new node
    int tehty = indexOfNode(count);
     
    if (tehty < 0) {
      nodes.add(new Node(count, colNum, noodit[i]));
      
      tehty = nodes.size()-1;
    }
    
    Node uusin = nodes.get(tehty);

   
    // Go back levels of intendation
    for (int l = currLevel-spaces; l > 0; l--) {
      inner.remove(inner.size()-1);  //  remove from list
    }
  
    if (inner.size()==0 || spaces > currLevel) {
      inner.add(new int(tehty));  // Add current node ID to inner
    } else {
      inner.set(inner.size()-1, tehty);             //  Kun on sama mÃ�Â¤Ã�Â¤rÃ�Â¤
    }
  
    //  Tarkistetaan sisennys suhteessa edelliseen
    if (spaces > 0 && inner.size() > 1) {
      int yhteys = inner.get(inner.size()-2);
      if (yhteys >= 0) {
        nodes.get(yhteys).addLink(tehty);
      }
      uusin.addLink(yhteys); // Add connection of the previous upper level node to this newest
     
    }
     
    currLevel = spaces;
  }
}

void draw() {
  boolean finished = false;  // Track if there is nothing more to push around
  background(#000000);

  Node piirrossa;

  // Suurimman arvon tarkistamista varten
  int suurin = -1;  //  TÃ�Â¤hÃ�Â¤n kerÃ�Â¤tÃ�Â¤Ã�Â¤n suurimman noden ID
  int kierros = jarjestys.size();
  for (int n = 0; n < nodes.size (); n++) {

    //  MÃ�Â¤Ã�Â¤ritetÃ�Â¤Ã�Â¤n noodi, jota muutokset koskevat
    piirrossa = nodes.get(n);
    //  Tarkistetaan kumpi on suurempi

    //  MikÃ�Â¤li lista on toistaiseksi tyhjÃ�Â¤, lisÃ�Â¤tÃ�Â¤Ã�Â¤n sinne ensimmÃ�Â¤inen
    if (jarjestys.size() == kierros && !listHasValue(jarjestys,n)) {
      jarjestys.add(new int(n));
      suurin = piirrossa.getConAm();   // Set aside the biggest value so far
    }
      //  
    else if (!listHasValue(jarjestys,n) && piirrossa.getConAm() > suurin) {
      jarjestys.set(kierros, n);  // Replace the previous value with this bigger one
      suurin = piirrossa.getConAm(); // Track the biggest value so far
    }

    //  Luodaan noodi muihin vertaamista varten
    Node toinenPaa;

    PVector plusV   = new PVector();
    PVector miinusV = new PVector();

    int koskettelu = 0;  //  Track overlapping nodes and far of nodes belonging to same group
    for (int i = 0; i < nodes.size (); i++) {

      if (i !=n) {
        toinenPaa = nodes.get(i);
        float lisaX = 0;
        float lisaY = 0;
        // Lasketaan onko sittenkin lyhempi matka ruudun reunan yli
        if (piirrossa.pos.x < toinenPaa.pos.x &&
         piirrossa.pos.x + width - toinenPaa.pos.x < toinenPaa.pos.x - piirrossa.pos.x) {
          lisaX -= width; // SeinÃ�Â¤n kautta on lyhempi
        } else if (toinenPaa.pos.x + width - piirrossa.pos.x < piirrossa.pos.x - toinenPaa.pos.x) {
          lisaX += width; // SeinÃ�Â¤n kautta jÃ�Â¤lleen lyhempi
        }
        if (piirrossa.pos.y < toinenPaa.pos.y &&
         piirrossa.pos.y + height - toinenPaa.pos.y < toinenPaa.pos.y - piirrossa.pos.y) {
          lisaY -= height; // SeinÃ�Â¤n kautta on lyhempi
        } else if (toinenPaa.pos.y + height - piirrossa.pos.y < piirrossa.pos.y - toinenPaa.pos.y) {
          lisaY += height; // SeinÃ�Â¤n kautta jÃ�Â¤lleen lyhempi
        }
        //  Create the a new vector to calculate movement
        PVector addOn = new PVector(toinenPaa.pos.x+lisaX, toinenPaa.pos.y+lisaY);
        addOn.sub(piirrossa.pos);

        float etaisuus = PVector.dist(toinenPaa.pos, piirrossa.pos);
        addOn.mult((float)(toinenPaa.getRad()/piirrossa.getRad())*nopeus); // The bigger node the less others affect

        //  Jos ollaan liian lÃ�Â¤hellÃ�Â¤, lisÃ�Â¤tÃ�Â¤Ã�Â¤n pakokerrointa
        if (etaisuus < (float)(toinenPaa.getRad()+piirrossa.getRad()+matka)) addOn.mult(2.0*piirrossa.getRad());

        if (piirrossa.hasLink(toinenPaa.getID())) {
          float lahennin = pow(nopeus*(float)(etaisuus-(toinenPaa.getRad()+piirrossa.getRad()+matka)), 2)*nopeus;
          if (etaisuus < (float)toinenPaa.getRad()+piirrossa.getRad()+matka) {
            addOn.mult(-purkuNopeus*lahennin);
            koskettelu++;
          } else if (etaisuus > toinenPaa.getRad()+piirrossa.getRad()+matka+toleranssi) koskettelu++;
          addOn.mult(lahennin);
          plusV.add(addOn);
        } else {
          //  Jos on tarpeeksi kaukana, ei vaikuta ollenkaan
          if (etaisuus > toinenPaa.getRad()+piirrossa.getRad()+matka+toleranssi) addOn.mult(0);
          //  Muutoin vaikuttaa
          else {
            addOn.mult(purkuNopeus/2.0);
            miinusV.add(addOn);
            koskettelu++;
          }
        }
      }
    }


    //  TÃ�Â¤ssÃ�Â¤ varsinainen viivan muutos
    plusV.mult(vetoKerroin);
    miinusV.mult(tyontoKerroin);
    plusV.sub(miinusV);
    // TyÃ�Â¶nnetÃ�Â¤Ã�Â¤n pallerot vielÃ�Â¤ reunalta takaisin
    miinusV = new PVector (0, 0);
    if       (piirrossa.pos.x < reunaToleranssi+piirrossa.getRad())           miinusV.x = reunaToleranssi + piirrossa.getRad() - (width-piirrossa.pos.x);
    else if  (piirrossa.pos.x > width-(reunaToleranssi+piirrossa.getRad()))   miinusV.x = reunaToleranssi + piirrossa.getRad() - piirrossa.pos.x;
    if       (piirrossa.pos.y < reunaToleranssi+piirrossa.getRad())           miinusV.y = reunaToleranssi + piirrossa.getRad() - (height-piirrossa.pos.y);
    else if  (piirrossa.pos.y > height-(reunaToleranssi+piirrossa.getRad()))  miinusV.y = reunaToleranssi + piirrossa.getRad() - piirrossa.pos.y;
    
    //    Multiply the push away from the borders a bit bigger
    miinusV.mult(purkuNopeus);  
    
    plusV.add(miinusV);    // Subtract the overall direction from the nodes that don't belong to the same group
    plusV.div(piirrossa.getRad());
    // Speed change accoding to amount of colliding nodes
    plusV.mult(nopeus*(float)(koskettelu/(nodes.size()/2.0))); 
    piirrossa.pos.add(plusV);
    piirrossa.checkPos();

    for (int i=0; i < piirrossa.links.size(); i++) {
      int linkityt = piirrossa.links.get(i);
      if (linkityt >= 0) {
        Node toinen = nodes.get(linkityt);
        stroke(colors[piirrossa.colNumber], 128);
        
        line(piirrossa.pos.x, piirrossa.pos.y, toinen.pos.x, toinen.pos.y);
      }
    }
    //if (koskettelu == 0) finished = true; // jos jotkut pallerot osuvat toisiinsa, ei voida lopettaa
  }
  noStroke();
  for (int n=0; n < nodes.size (); n++) {
    piirrossa = nodes.get(n);
    piirrossa.drawNode();
  }
  if (!found && jarjestys.size() == nodes.size()) {
    Node check;
    for(int i= jarjestys.size()-1; i >= 0;--i) {
      check = nodes.get(jarjestys.get(i));
      println(check.getConAm()+": "+check.nimi);
    }
    found = true;
  }
  // When all nodes have found their places (haven't seen that happening)
  if (finished) {
    noLoop();
  }
}

int indexOfNode(int ID) {
  Node linkitty;
  for (int last = 0; last < nodes.size (); last++) {      //  KÃ�Â¤ydÃ�Â¤Ã�Â¤n kaikki noodit lÃ�Â¤pi
    linkitty = nodes.get(last);                           //  TyhjÃ�Â¤n noodin paikalle asetetaan testattava
    if (ID == linkitty.getID()) {  //  Tarkistetaan onko ko. noodin ID oikea.
      return last;
    }
  }
  return -1;
}
boolean listHasValue(ArrayList aList,int num) {
    for(int i=0; i < aList.size();i++) {
        if (num == aList.get(i)) return true;
    }
    return false;
}

class Node {
  ArrayList links = new ArrayList(); // = new IntList();
  int ID;
  int colNumber;
  float x,y;
  float mult = .4; // Size increment for amount of connections
  public PVector pos;
  String nimi;
  int nollaKoko = 9;

  Node (int num, int colNum, String name) {
    nimi = name;
    ID = num;
    colNumber = colNum; 
    //links = new ArrayList();
    pos = new PVector(random(width),random(height));
    
  }
  void addLink(int num) {
    if(links.size() == 0 || !hasLink(num)) {
      links.add(new int(num));
      //links.sort();
    }
  }
  
  int getID()  {
    return ID;
  }
  int getConAm() {
    return links.size();
  }
  float getRad() {
    return nollaKoko+links.size()*mult;
  }
  
  void checkPos() {
    if (pos.x < 0) pos.x += width;
    else if (pos.x > width) pos.x -= width;
    if (pos.y < 0) pos.y += height;
    else if (pos.y > height) pos.y -= height;
  }
  
  // class function
  boolean hasLink(int num) {
    for(int i=0; i < links.size();i++) {
        if (num == links.get(i)) return true;
    }
    if (links.size()==0) return true;
    else return false;
}
  
  void drawNode() {
    fill(colors[colNumber],168);
    float rad = nollaKoko+links.size()*mult;
    ellipse(pos.x,pos.y,rad*2.0,rad*2.0);
    
    if (pos.x + rad > width)  ellipse(pos.x - width,pos.y,rad*2.0,rad*2.0);
    else if (pos.x - rad < 0) ellipse(pos.x + width,pos.y,rad*2.0,rad*2.0);
    if (pos.y + rad > height) ellipse(pos.x,pos.y - width,rad*2.0,rad*2.0);
    else if (pos.y - rad < 0) ellipse(pos.x,pos.y + width,rad*2.0,rad*2.0);
    
    fill(#000000,255);
    textAlign(CENTER, CENTER);
    text(ID,pos.x,pos.y);
  }
}
