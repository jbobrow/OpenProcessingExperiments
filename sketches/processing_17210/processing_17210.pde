
PGraphics reference;
int next;
String[] fl ;
truc[] trucs;
String currType;
boolean weiss=false, inited=false;

void setup() {
  size(750,340);
  PFont typo = createFont("arial",10,false);
  textFont(typo, 10);
  trucs = new truc[0];
  smooth();
  stroke(255);
  strokeWeight(.5);
  for(int a=0;a<300;a++) {
    new truc();
  }
  background(0);
  textAlign(CENTER, CENTER);
  text("Chargement des typographies", width/2, height/2);
  currType="";
  next();
  textAlign(LEFT, BOTTOM);
}

void draw() { 
  if(!inited){
  fl = PFont.list();   
  inited=true;
  } else {
  fill(0,40);
  rect(-1,-1,width+1,height+1);
  for(int a=0;a<trucs.length;a++) {
    trucs[a].dessine();
  } 
  if(millis()>next) {
    next();
  } 
  fill(140,30);
  float ll = textWidth(currType);
  text(currType, width-ll, height-4); 
  }
}


void next() {
  if(weiss) {
    reference = createGraphics(width, height, JAVA2D);
    reference.beginDraw();
    reference.background(255);  
    reference.fill(0);
    reference.textAlign(LEFT, TOP);
    currType = fl[floor(random(fl.length))]; 
    PFont ff = createFont(currType, 250);
    reference.textFont(ff, 250); 
    float top = reference.textAscent(); 
    float bot = reference.textDescent();
    float hauteur = bot-top;  
    float largeur = reference.textWidth("2011"); 
    //reference.text("2011", ,random(height-top));
    reference.text("2011",random(width-largeur),random(height-top-20));
    reference.endDraw(); 
    for(int a=0;a<trucs.length;a++) {
      trucs[a].an = trucs[a].an+PI;
      /* if(random(5)<1){
       trucs[a].x=random(width);
       trucs[a].y=random(height);
       }*/
    }
    next=millis()+ceil(random(2000,5000));
    weiss=false;
  }
  else {
    weiss=true; 
    reference = createGraphics(width, height, JAVA2D);
    reference.beginDraw();
    reference.background(255);  
    reference.endDraw(); 
    next=millis()+1000;
  }
}

class truc {
  float x, y, l, an;
  truc() {
    x=random(width);
    y=random(height);
    l=8;
    an= random(TWO_PI);
    trucs = (truc[]) append(trucs, this);
  }
  void dessine() {  
    an+=random(-0.05,0.05);
    float  newan = getAround(x,y,l,an); 
    x=x+cos(newan)*l;
    y=y+sin(newan)*l;
    for(int a=0;a<trucs.length;a++) {
      truc t = trucs[a];
      if(t!=this) {
        float d = dist(t.x,t.y,x,y);
        float dd = (t.l+l)/2; 
        if(d<14) {

          line(x,y,t.x,t.y);
        }
        if(d<dd) {
          x=t.x+((x-t.x)/dd)*d;
          y=t.y+((y-t.y)/dd)*d;
        }
      }
    } 
    an = newan;
    if(x<2) {
      x=2;
      an+=random(-0.5,0.5);
    }
    if(y<2) {
      y=2;
      an+=random(-0.5,0.5);
    }
    if(x>(width-2)) {
      x=width-2;
      an+=random(-0.5,0.5);
    }
    if(y>height-22) {
      y=height-22;
      an+=random(-0.5,0.5);
    }


    //ellipse(x,y,l,l);
  }
}

float getAround(float x, float y, float l, float an) {
  float toreturn = an;
  float ang=TWO_PI/11;
  float[] vide = new float[0];
  float[] plein = new float[0];
  for(int a=0;a<11;a++) {
    float[] coords = {
      x+cos(ang*a)*(l), y+sin(ang*a)*(l)
    };
    int ix = round(coords[0]);
    int ig = round(coords[1]);
    if(ix>0 && ig>0 && ix<width && ig<height) {
      float c=brightness(reference.get(ix, ig));  
      if(c<128) {
        plein = (float[]) append(plein, ang*a);
      } 
      else {
        vide = (float[]) append(vide, ang*a);
      }
    }
  }  
  if(plein.length>0) {
    int n=floor(random(plein.length)); 
    toreturn =plein[n] ;
  } 
  else {
    if(vide.length>0) {
      int n=floor(random(vide.length)); 
      toreturn =an+random(-0.5,0.5); //vide[n] ;
    }
  }
  return toreturn;
}

void mouseReleased() {

  next = millis()-400;
}


