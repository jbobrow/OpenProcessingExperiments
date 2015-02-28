
import processing.opengl.*;

int max;
int z;

String[] nombres = {"H",
"He",
"Li",
"Be",
"B",
"C",
"N",
"O",
"F",
"Ne",
"Na",
"Mg",
"Al",
"Si",
"P",
"S",
"Cl",
"Ar",
"K",
"Ca",
"Sc",
"Ti",
"V",
"Cr",
"Mn",
"Fe",
"Co",
"Ni",
"Cu",
"Zn",
"Ga",
"Ge",
"As",
"Se",
"Br",
"Kr",
"Rb",
"Sr",
"Y",
"Zr",
"Nb",
"Mo",
"Tc",
"Ru",
"Rh",
"Pd",
"Ag",
"Cd",
"In",
"Sn",
"Sb",
"Te",
"I",
"Xe",
"Cs",
"Ba"

};

int[] affinity = {-73,
21,
-60,
19,
-27,
-122,
7,
-141,
-328,
29,
-53,
19,
-43,
-134,
-72,
-200,
-349,
35,
-48,
10,
-18,
-8,
-51,
-64,
47,
-16,
-64,
-112,
-118,
47,
-29,
-116,
-78,
-195,
-325,
39,
-47,
-5,
-30,
-41,
-86,
-72,
-53,
-101,
-110,
-54,
-126,
32,
-29,
-116,
-103,
-190,
-295,
41,
-45,
-14
};

int[] radios = {53,
31,
167,
112,
87,
67,
56,
48,
42,
38,
190,
145,
118,
111,
98,
88,
79,
71,
243,
194,
184,
176,
171,
166,
161,
156,
152,
149,
145,
142,
136,
125,
114,
103,
94,
88,
265,
219,
212,
206,
198,
190,
183,
178,
173,
169,
165,
161,
156,
145,
133,
123,
115,
108,
298,
253
};

int[] groups={2,2,6,2,6,2,10,6,2,10,6,2};
int[] periods={2,8,8,18,18,2};

class Atom{
  String name; //name
  int aR; //atomicRadius;
  int aN;  //atomicNumber;
  int eA; // electroAffinity
  
  int h; // hue (color of atom)¿?
  float radius;
  
  float xx,yy,zz;
  
  public boolean light;
  
  Atom(String s, int r, int n,int a) {
   name=s;
   aR=r;
   aN=n+1;
   eA=-a;
   light=false;
       float angulo=0;
    float espiral=0;
    float minX,maxX;
    minX=0;
    maxX=width;
    h=80;
    switch(groups[group()]){
      case 2:
      minX=0;
      maxX=width/9;
      h=30;
      break;
      case 10:
      minX=width/9;
      maxX=2*width/3;
      h=140;
      break;
      case 6:
      minX=2*width/3;
      maxX=width;
      h=230;
      break;
    }
    //minX = (width/3)*(l()-1)+15;
    //maxX = l()*width/3-15;
    float wide= (maxX-minX)/groups[group()];
    radius = map(aR,50,300,5,height/18);
    //float radius=height/56;
    //float x = map(free(),1,18,minX,maxX);
    //float x = wide*(1+2*(free()-1))/2+minX;
    
    yy = map(aN,1,radios.length,15,height-15);
    espiral = map(aN,1,radios.length,0,width/2);
    angulo = map (el(),1,periods[n()],0,2*PI);
    xx = width/2+espiral*cos(angulo);
    zz = z+espiral*sin(angulo);    
  }
  
  void display() {
    fill(h,map(eA,-50,350,0,255),255);
    pushMatrix();
    translate(xx,yy,zz);
    sphere(radius);
    
    if (light) {
      noFill();
      stroke(20,20);
      sphere(radius*1.5);
      noStroke();
      
      
    }
    popMatrix();
    if (light) {
      PFont metaBold;
// The font "Meta-Bold.vlw" must be located in the 
// current sketch's "data" directory to load successfully
metaBold = loadFont("Manzanita-48.vlw");
textFont(metaBold, 80); 
      text(name,3*width/4,10);
    }
  }
  
  
  // Devuelve 
  int n() {
    int nn = aN;
    int i;
    for (i=0;nn>periods[i];i++)
      nn-=periods[i];
    return i;
  }
  
  int el() {
    int nn = aN;
    int i;
    for (i=0;nn>periods[i];i++)
      nn-=periods[i];
    return nn;
  }
  
  int l(){
    int nn = aN;
    int i;
    int aux=0;
    for (i=0;nn>=groups[i];i++)
      nn-=groups[i];
    switch (groups[i]) {
      case 2: 
        aux=1;
        break;
      case 6: aux=3;
      break;
      case 10: aux=2;
      break;
    }
    return aux;
  }
  
  int free() {
    int nn = aN;
    int i;
    for (i=0;nn>groups[i];i++)
      nn-=groups[i];
    return nn;
  }
  
  int group() {
     int nn = aN;
    int i;
    int aux=0;
    for (i=0;nn>groups[i];i++)
      nn-=groups[i];
    return i;
  }
  
  float proyX() {
    return screenX(xx,yy,zz);
  }
  
  float proyY() {
    return screenY(xx,yy,zz);
  }
  
  void highlight() {
    light=true;
  }
}

Atom[] atomos = new Atom[56];
float radioCam;

void setup() {
   z=-85;
  
 
  max=radios.length;
  //max=1;
    size(600,600,P3D);
  //fill(200,0,200);
  //background(255,0,255);
  sphereDetail(30);
  noStroke();
  
  for (int i =0;i<radios.length;i++) {
    atomos[i]=new Atom(nombres[i],radios[i],i,affinity[i]);
  }
    radioCam=(height) / tan(PI*60.0 / 360.0);
  camera(width/2,height/2,z-radioCam,width/2.0,height/2.0,z,0,1,0);
}

void draw(){
  
  colorMode(RGB);
  background(140,140,140);
  colorMode(HSB);
  lights();
  stroke(0,0,0);
  line(width/2,10,z,width/2,height-10,z);
  noStroke();
  for(int i=0;i<max;i++) {
    atomos[i].display();
  }
}  
  void mouseDragged() {
   
    /*if (mouseButton==LEFT) z+=5;
    else if (mouseButton==RIGHT) z-=5;
    translate(mouseX,0,0);
    println (z);*/
    //translate(width/2,height/2,-85);
    camera(width/2+radioCam*cos(map(mouseX,0,width,0,2*PI)),height/2,z+radioCam*sin(map(mouseX,0,width,0,2*PI)), width/2.0, height/2.0, z, 0, 1, 0);
    //translate(0,0,0);
  }
  
  void mouseMoved() {
    float distancia=width*height;
    float d;
    int atomo=0;
    for(int i=0;i<max;i++) {
      d=sq(mouseX-atomos[i].proyX())+sq(mouseY-atomos[i].proyY());
      if(d<distancia) {
        distancia=d;
        atomo=i;
      }
      atomos[i].light=false;
    }
    atomos[atomo].highlight();
  }



