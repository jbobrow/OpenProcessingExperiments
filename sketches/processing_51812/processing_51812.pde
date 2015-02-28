
// Budapest public transport lines
// Peter Tempfli -- mailto:tempflip((at))gmail.com
////////////////////////////////////////////////////////////
// Program uses data provided by bkv.hu in General Transit Feed Specification (a google standard)
// Data was pre-processed by a simple python script in order to make less computing with Processing
/////////////////////////////////////////////////////////////
// Zooming: + / -
// moving: drap&drop the mouse

class megallo {
  public String id, nev;
  public float szel,hossz;
  //szettorjuk a bemenetet a tabulatorok menten
  megallo(String bemenet) {
    String temp[] = split(bemenet,"\t");
    this.id=temp[0];
    this.nev=temp[1];    
    this.szel=float(temp[2]);
    this.hossz=float(temp[3]);
  }
}

class utvonal {
  public String id, nev, megallo1, megallo2, szin;
  public int tipus;
  utvonal(String bemenet) {
    String temp[] = split(bemenet,"\t");
    this.id=temp[0];
    this.nev=temp[1];    
    String temp2[] = split(temp[2]," / ");
    this.megallo1=temp2[0];
    this.megallo2=temp2[1];
    this.tipus=int(temp[3]);
    this.szin=temp[4];  
  }
}

class route_stop {
  public String stop, route;
  route_stop(String bemenet) {
     String temp[] = split(bemenet,"\t");
     this.route=temp[0];
     this.stop=temp[1];
  }
}

String[] adat, adat2, adatRoutesStops;
float minSzel=MAX_FLOAT;
float minHossz=MAX_FLOAT;
float maxSzel=MIN_FLOAT;
float maxHossz=MIN_FLOAT;

PFont f;
megallo[] lista;
utvonal[] routes;
route_stop[] r_s;
color bgcolor;
color toll;
int zoomX1, zoomX2, zoomY1, zoomY2;

void setup () {
  // beolvassuk a megallokat
  adat=loadStrings("stops.txt");
  lista = new megallo[adat.length];
  for (int i=0; i < adat.length; i++) {
    lista[i]=new megallo(adat[i]);
    
    // megkeressuk a legnagyobb es legkisebb szelesseget
    if (lista[i].szel > maxSzel) {maxSzel=lista[i].szel;}
    if (lista[i].szel < minSzel) {minSzel=lista[i].szel;}
    if (lista[i].hossz > maxHossz) {maxHossz=lista[i].hossz;}
    if (lista[i].hossz < minHossz) {minHossz=lista[i].hossz;}
  }
  
  // beolvassuk az utvonalakat
  adat2=loadStrings("routes.txt");
  routes=new utvonal[adat2.length];
  for (int i=0; i < adat2.length; i++) {
    routes[i]=new utvonal(adat2[i]);
  }
  // beolvassuk, hogy melyik utvonalnak hol vannak a megalloi
  adatRoutesStops=loadStrings("routes_and_stops.txt");
  r_s=new route_stop[adatRoutesStops.length];
  for (int i=0; i < adatRoutesStops.length; i++) {
    r_s[i] = new route_stop(adatRoutesStops[i]);
  }

  //atmenetileg atirjuk a koordinatakat (zoomolunk)
  minHossz=19;
  maxHossz=19.19;
  minSzel=47.4;
  maxSzel=47.6;
  
  //ezek a megjelenes altalanos beallitasai
  size(800,800);
  bgcolor=color(200,130,152);
  toll=color(255);
  background(bgcolor);
  fill(255,255,255);
  stroke(255,255,255);
  f = loadFont("Ubuntu-60.vlw");
  textFont(f,20);
  ellipseMode(CENTER);
  smooth();
  routes_rajzol();
}

void draw() {
  // kiirjuk, hogy hol van a kurzor
  fill(bgcolor);
  stroke(toll);
  rect(10,10,150,55);
  fill(toll);
  float dHossz = map(mouseX,0,width,minHossz,maxHossz);
  float dSzel = map(mouseY,0,height,maxSzel,minSzel);
  text("H : "+ dHossz,20,30);
  text("Sz: "+ dSzel,20,60);
}

void routes_rajzol() {
  color szin=color(0,0,0);
  int elozoX=500;
  int elozoY=500;
  String elozoRoute="";
  utvonal akt_route;
  for (int i=0; i < adatRoutesStops.length; i++) {
    megallo akt_megallo=keres_id(r_s[i].stop);
    int x1=int(map(akt_megallo.hossz,minHossz,maxHossz,0,width));
    int y1=int(map(akt_megallo.szel,maxSzel,minSzel,0,height));
    
    //valamiert sok a 0,0 koordinataju megallo, ezeket nem vesszuk figyelembe
    if (x1 == 0 || y1 == 0) { continue;}
    
    // az elozoRoute az elozo kirajzolt megallo-hoz tartozo route.
    // tehat, ha megegyezi, ugyanazon a vonalon vagyunk, es vonalak kell huzni
    if(r_s[i].route.equals(elozoRoute)) {
      line(elozoX,elozoY,x1,y1);
    }
    // ha nem, akkor felulvizsgaljuk a beallitasokat
    else {
      //kikeressuk, milyen tipusu az uj route es beallitjuk a vonal szinet
      akt_route=route_keres(r_s[i].route);
      if (akt_route.tipus==0) { // villamos
        szin=color(255,255,0); 
        strokeWeight(3);
      }
      else if (akt_route.tipus==1) { // metro
        szin=color(255,0,0);
        strokeWeight(6);
      }
      else if (akt_route.tipus==2) { // hev
        szin=color(0,200,0);
        strokeWeight(3);
      }
      else if (akt_route.tipus==3) { // busz
        szin=color(0,0,int(random(200))+55);
        strokeWeight(1);
      }
      stroke(szin);
    }
    
    elozoX=x1;
    elozoY=y1;
    elozoRoute=r_s[i].route;
    ellipse(x1,y1,6,6);
  } 
}


//egy adott megallora keres
megallo keres_id(String m) { 
  megallo e;
  e = new megallo("aa\taa\taa/aa\t\t\t\t\t");
  for(int i=0; i < adat.length; i++) {
    if(lista[i].id.equals(m)) {
      e=lista[i];
      break;  
    }
  } 
  return e;
}

//egy adott utvonalra keres az IDje alapjan
utvonal route_keres(String route_id) {
  utvonal u = new utvonal("HP61	H8H	Örs vezér tere M+H / Cinkota H	3	1188FF");
  for(int i=0;i<adat2.length;i++) {
    ///println(route_id+" "+routes[i].id);
    if(routes[i].id.equals(route_id)) {
      u=routes[i];
      break;
    }
  }
  return u;
}

void mousePressed() {
  zoomX1=mouseX;
  zoomY1=mouseY; 
}

void mouseReleased() {
  zoomX2=mouseX;
  zoomY2=mouseY; 
  move();
}

// az terkep mozgatasa -- az egerrel huzgaljuk jobbra-balra
void move() {
  int xmove=zoomX1-zoomX2;
  int ymove=zoomY1-zoomY2;

  float move=map(xmove,0,width,minHossz,maxHossz)-minHossz;
  minHossz=minHossz+move;
  maxHossz=maxHossz+move;
  
  move=map(ymove,0,width,minSzel,maxSzel)-minSzel;
  move=move * -1; //mert a szelessegi korok az egyenlitonel kezdodnek 0val 
  minSzel=minSzel+move;
  maxSzel=maxSzel+move;
  
  background(bgcolor);
  routes_rajzol();
}

// itt csinaljuk a zoomolast + es - gombra
void keyPressed () {
  float zoom=0.2;
  float hosszKit=maxHossz-minHossz; // a hosszusag es a szelesseg kiterjedese
  float szelKit=maxSzel-minSzel;
  if(key == '+') {  //a zoomolas nem mas, mint a megjelenitett terulet szukitese
    minHossz=minHossz + hosszKit * zoom; 
    maxHossz=maxHossz - hosszKit * zoom; 
    minSzel=minSzel + szelKit * zoom; 
    maxSzel=maxSzel - szelKit * zoom; 
  }
  if(key == '-') {  
    minHossz=minHossz - hosszKit * zoom; 
    maxHossz=maxHossz + hosszKit * zoom; 
    minSzel=minSzel - szelKit * zoom; 
    maxSzel=maxSzel + szelKit * zoom; 
  } 
  if (keyCode == ESC) {
    exit(); 
  }
  background(bgcolor);
  routes_rajzol();
}


