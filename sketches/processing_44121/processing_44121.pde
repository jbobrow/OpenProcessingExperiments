
//Vortex//Alejandro González//60rpm.tv/i//Pubic Domain/////////////////////////////////////////
//Just playing with some particles and convolution (the latter based on dotlassie´s fast blur// 
//algorithm (credits below)////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////

int h=450,w=900,s=w-1,M=-1;  //some constant values here
P[] p = new P[1000];         //1000 particles
LinkedList<PVector> a;       //x attractors

////////////////////////////////////////////////////////////////////////////////////////////

void setup(){
  size(w,h,P2D); background(0); stroke(M);
  for(int i=0;i<p.length;i++) p[i]=new P();
  a= new LinkedList<PVector>();
}

void draw(){
  for(int i=0;i<p.length;i++) {p[i].update(a); p[i].display();}
  convolutionMask(M);
}

////////////////////////////////////////////////////////////////Some basic interaction here

//Click to add attractors
void mousePressed(){a.add(new PVector(mouseX,mouseY));}  

//Restart
void keyPressed(){setup();}


///////////////////////////////////////////////////////////////////////////////////////////
//Particle class with motion provoked by attractors connected with some magnetism to the particles
//Particles wanders around the 'gravity center' of the poles. That will be our vortex.

class P {
  float d,k,m,h; PVector l,s,a;
  
  P(){
    l= new PVector(random(width),random(height)); //random location
    a=new PVector(); s=new PVector();             //acceleration, speed
    h=random(1);
    m=.01;                                        //magnetic force
  }

  //Some magnetic attraction -- inverse to distance, proportional to the magnetic force 
  void update (LinkedList<PVector> A){
    if (A!=null){
      for(PVector v:A) 
        if((d=PVector.dist(l,v))>0){
          a=PVector.sub(v,l);
          a.mult(m/d);
          s.add(a);
          l.add(s);}
    }
  }
  
  void display(){
    point(l.x,l.y);
  }
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
//Studying Dotlassie's fast blur //http://www.openprocessing.org/visuals/?visualID=5383,/////////////////////
//I realized more than a blur effect it's some kind of clever convolution generic tool with a constant mask//
//value, as useful to make a blur as to get different effects////////////////////////////////////////////////
//Thus experimenting I came into this sketch... ^-^////////////////////////////////////////////////////////
/////////////////////////////////////////////////////////////////////////////////////////////////////////////

void convolutionMask(int m){ 
  loadPixels();
  int[] p=pixels;
  for(int y=1;y<h-1;y++){ 
    int yw1=y*w+1, yws=y*w+s;
    for(int i=yw1;i<yws;i++) {
      //Apply AND to a reduced convolution kernel of four pixels(+) and get the average value (>>2=/4)
      p[i]=((p[i-w]&m)+(p[i+w]&m)+(p[i-1]&m)+(p[i+1]&m))>>2;
    }
  }
  updatePixels();
}

