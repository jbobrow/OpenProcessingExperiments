
//Original code by NoahBuddy of the openprocessing.org's forum
//Particle effect code code by Harukit www.harukit.com
//Modified by Owaun Scantlebury

public boolean dobounce= false;
public boolean forward = true; 
public boolean up = false; 
public int px=0; 
public int py =0; 
public int ly=0; 
public int lx=0; 
int pNum =1;
float rr,gg,bb,dis;
int gain = 5;
float[] cc = new float[3];
ParticleV[] pf = new ParticleV[pNum];


void keyPressed(){
  if (key=='d')dobounce = !dobounce;
  if (key=='c'){
    for(int i=0;i<3;i++){
      cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
    }

    for(int i=0;i<pNum;i++){
      pf[i] = new ParticleV(random(width),random(height),random(0.1,0.3));
    }
  } 
}
class Particle {
  float x = 0, y = 0, vx = 0, vy = 0;
  int maxDist = 0, lifeSpan = 0, col = 0;
  boolean live = false;

  Particle(float ix, float iy, int id, int ic) {
    x = ix;
    y = iy;
    maxDist = id;
    col = ic;
  }

}


//float HALFPI = PI / 2, SIXTEENTHS = PI / 16, THIRTYSECONDS = PI / 32;
int NUMSHOTS = 1024, maxRange = 0;
float OX = 0, OY = 0;//, GRAV = 4.7, gunangle = 0;
boolean staron = true;




Particle[] spray;

public PFont font1;  

public color []A;
void setup() {

  size(600,200,P2D);// P2D or P3D only for high framerate!!!

  loadPixels();
  A= pixels;
  // smooth();

  font1 = createFont("arial",12); 

  textFont(font1, 12); 

  maxRange = width * height;

  // OX = width / 2;
  // OY = height / 2;

  spray = new Particle[NUMSHOTS];

  for (int i=0; i<NUMSHOTS; i++) {
    spray[i] = new Particle(OX, OY, 800, color(255));
  }
  for(int i=0;i<3;i++){
    cc[i]=random(40)+random(40)+random(40)+random(40)+random(40);
  }
  for(int i=0;i<pNum;i++){
    pf[i] = new ParticleV(random(width),random(height),random(0.1,0.3));
  }
}

void draw() {
  for(int i=0;i<pNum;i++){
    pf[i].update();
  }

  if (!online)  this.frame.setTitle(str(frameRate)  +" fps"   );
  if (dobounce)
  {
    bounce(true,3,1,5);
    OX = px;
    OY = py;
    mouseX=px;
    mouseY=py;
    mousePressed();

  }
  if (mousePressed && !dobounce){

    OX = mouseX;
    OY=mouseY; 
  }
  else
  {
    frameRate(3000); 
  }
  float tmpang = 0;


  // background(0); // this is really important!!!

  for(int i=0; i<NUMSHOTS; i++) {

    if (!(spray[i].live)) {
      if (staron) {
        tmpang = random(1) * TWO_PI;
        spray[i].vx = random(2) * cos(tmpang);
        spray[i].vy = random(2) * sin(tmpang);

        spray[i].x = OX;
        spray[i].y = OY - 1;
        spray[i].lifeSpan = 0;
        spray[i].col = color((int)random(127) + 128, (int)random(127) + 128, (int)random(127) + 128);
        spray[i].live = true;
      }

    } 
    else {
      spray[i].x = spray[i].x + spray[i].vx;
      spray[i].y = spray[i].y + spray[i].vy;

      int offs = (int)(spray[i].y * width + spray[i].x);

      if ((offs >= 0) && (offs < maxRange)) {
        stroke(spray[i].col,124);
        //    point(spray[i].x, spray[i].y);
        color col = get((int)spray[i].x,(int) spray[i].y);
        int pos=(int) spray[i].y*width+(int)spray[i].x;
        rr = col >> 16 & 0xff;
        gg = col >> 8 & 0xff;
        bb = col  & 0xff;

        //  for(int ix=0;ix<pNum;ix++){
        //   dis =dist(pf[ix].xpos,pf[ix].ypos,(int)spray[i].x,(int) spray[i].y)/2;
        dis =dist(mouseX,mouseY,(int)spray[i].x,(int) spray[i].y)/2;
        rr += cc[0]/dis-gain;
        gg += cc[1]/dis-gain;
        bb += cc[2]/dis-gain;
        //   }

        stroke(color(rr,gg,bb));
        // set((int)spray[i].x,(int) spray[i].y, color(spray[i].col)) ;

        set((int)spray[i].x,(int) spray[i].y,color(rr,gg,bb));
        // if ((int)spray[i].x> 0 &&(int) spray[i].y>0)  A[(int)spray[i].x+(width)*(int) spray[i].y]= color(rr,gg,bb);
        if (pos>=0 && pos <pixels.length) {
          //set((int)spray[i].x,(int) spray[i].y, color(spray[i].col)) ;
          //  pixels[pos]=color(rr,gg,bb);
          stroke(color(rr,gg,bb));
          // rotateY(radians(i));
          point(spray[i].x, spray[i].y);
          int _y = (int)pos / width;
          int _x = (int)pos - (_y*width);
          //  point(_x,_y);

        }

      } 
      else {
        spray[i].live = false;
      }

      spray[i].lifeSpan = (int)(abs(spray[i].x - OX) + abs(spray[i].y - OY));

      if (spray[i].lifeSpan > spray[i].maxDist) {
        spray[i].live = false;
      }

    }

  }
  fill(233,23,23);
  text("fps: "+frameRate,50,20); 

}




void bounce(boolean rnd, int by, int lo, int hi){ 
  if (forward){ 
    if (rnd)px+=random(lo,hi);  
    if (!rnd){ 
      px+=by;  
    } 
  }  


  if (!forward){ 
    if(rnd)px-=random(lo,hi);   
    if (!rnd){ 
      px-=by;  
    } 
  } 

  if (up){ 
    if (rnd)py-=random(lo,hi*2);  
    if (!rnd){ 
      py+=by; 
    } 
  } 

  if (!up){ 
    if(rnd)py+=random(lo,hi*2);  
    if (!rnd){ 
      py-=by; 
    }   

  } 


  if (px>width)forward = false; 
  if (px<0)    forward = true; 
  if (py>height)up     = true; 
  if (py<0     )up     = false; 
}



class ParticleV{
  float xpos,ypos,del;
  ParticleV(float x,float y,float d){
    xpos=x;
    ypos=y;
    del = d;
  }
  void update(){

    xpos += (mouseX-xpos)*del;
    ypos += (mouseY-ypos)*del;

  }
}


