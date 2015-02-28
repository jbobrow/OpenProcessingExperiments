
//cloud Maker v2
//Owaun Scantlebury
int rectsize = 1;
int wd=255;
int ht=255;
float res=4;
PImage a;
PImage tex;
PImage lookup;
PImage redcloud;
PImage greencloud;
PImage bluecloud;
PImage redbluecloud;
PImage darkgreycloud;
PImage greycloud;
PImage redgreencloud;
float [] alookup = new float [wd*ht];
PImage b;
float [] _x = new float [wd*ht];
float [] _y = new float [wd*ht];
PVector [] ka= new PVector [wd*ht];
PImage orig;
int [] x= new int [2];
String cloudcolour = "blue";
void keyPressed(){
  if(key =='r' || key =='R')cloudcolour = "red";
  if(key=='g' || key== 'G')cloudcolour="green";
  if(key=='b' || key =='B')cloudcolour = "blue";
  if(key=='e') cloudcolour = "grey";
  if(key=='G')cloudcolour = "darkgrey";
  if(key=='y')cloudcolour = "redgreen"; //yellow
  if(key=='m')cloudcolour= "mauve"; //purple

}
int _x1;
int _ly;
int _y1;


float distx2(float ax,float b, float c,float d){
  c =(c-ax);
  if (c<0)c=-c;
  d = (d-b);
  if (d<0)d=-d;

  ax=0;
  b=0;
  //    int dx=int(abs(c-ax));
  //    int dy=int(abs(d-b));
  //    c=c-dx;
  //    d=d-dy;
  float retval = 0;
  int pos = int(c)+wd*int(d);
  // retval = a.get(int(c),int(d))>>16&255;
  retval = ka[pos].x;
  return retval;
}

void setup(){
  mouseX=wd;
  mouseY=0;
  size(800,450);
  float xm =wd/2;
  float ym=ht/2;

  for (int i =0;i<wd*ht;i++){
    _y1 = int(i/wd);
    //ly = y;
    _x1  = i-(_y1*wd);
    float dis =dist(_x1,_y1,0,0);
    ka[i]=new PVector(dis,_x1,_y1);
  }
  a=createImage(wd,ht,ARGB);
  redcloud = createImage(wd,ht,ARGB);
  greencloud= createImage(wd,ht,ARGB);
  bluecloud= createImage(wd,ht,ARGB);
  redbluecloud = createImage(wd,ht,ARGB);
  greycloud = createImage(wd,ht,ARGB);
  redgreencloud = createImage(wd,ht,ARGB);
  darkgreycloud =createImage(wd,ht,ARGB);
  now=0;
  background(-1);
  noStroke();
  lookup= createImage(wd,ht,ARGB);
  for (x[now]=0;x[now]<wd;x[now]+=rectsize){
    now=1;
    for (x[now]=0;x[now]<wd;x[now]+=rectsize){
      float z = distx2(x[now],x[now-1],wd/2,ht/2)*res;
      //fill(1,255-z);
      int pos = x[now-1]+wd*x[now];
      if(z<wd){

        float k = distx2(x[now],x[now-1],xm,ym);
        int _x = x[now];
        int _y= x[now-1];
        float R = distx2(_x,_y,0,0);
        float G = distx2(_x,_y,wd-1,0);
        float B = distx2(_x,_y,wd-1,ht-1);   
        float A = distx2(_x,_y,0,ym-1); 

        // a.set(x[now-1],x[now],z);
        float alph = 255-z;
        lookup.pixels[pos]=color(z,z,z*2,255-z);
        //  bluecloud.pixels[pos]=color(z,z,z*2,255-z);
        bluecloud.pixels[pos]=color(R,G,B,alph);

        //redcloud.pixels[pos]=color(z*2,z,z,255-z);
        redcloud.pixels[pos]=color(R,B,G,alph);

        //greencloud.pixels[pos]=color(z,z*2,z,255-z);
        greencloud.pixels[pos] = color(G,B,R,alph);
        //
        //redbluecloud.pixels[pos]=color(z*2,z,z*2,255-z);
        redbluecloud.pixels[pos]=color(G,R,B,alph);
        //        greycloud.pixels[pos]=color(z,z,z,255-z);
        greycloud.pixels[pos]=color(B,G,R,alph);
        //  darkgreycloud.pixels[pos]=color(z,z,z/2,255-z); //yellow fume
        //darkgreycloud.pixels[pos]=color(z,z/2,z,255-z); // dark purple
        //        darkgreycloud.pixels[pos]=color(z/2,z,z,255-z); //dark blue
        darkgreycloud.pixels[pos]=color(B,R,G,alph);
        redgreencloud.pixels[pos]=color(z*2,z*2,z,255-z);
      }
      alookup[pos]=z;

      //rect(x[now],x[now-1],rectsize,rectsize);

    }
    now=0;
  }

  for (x[now]=0;x[now]<wd;x[now]+=rectsize){
    now=1;
    for (x[now]=0;x[now]<wd;x[now]+=rectsize){
      float z = distx2(x[now],x[now-1],wd/2,ht/2);
      fill(1,255-z);
      rect(x[now],x[now-1],rectsize,rectsize);

    }
    now=0;
  }

  background(-1);
  b=get();
  imageMode(3);
}

int now;
void draw(){
  //this.frame.setTitle(cloudcolour+" colour clouds");
  //  mouseX-=int(random(0,1));
  //  mouseY++;
  // mousePressed=true;
  if(mousePressed) {
    if(cloudcolour =="blue" )image(bluecloud, mouseX,mouseY);
    if(cloudcolour =="red"  )image(redcloud,  mouseX,mouseY);
    if(cloudcolour =="green")image(greencloud,mouseX,mouseY);
    if(cloudcolour=="mauve")image(redbluecloud,mouseX,mouseY);
    if(cloudcolour=="redgreen")image(redgreencloud,mouseX,mouseY);
    if(cloudcolour=="grey")image(greycloud,mouseX,mouseY);
    if(cloudcolour=="darkgrey")image(darkgreycloud,mouseX,mouseY);



  }
}
void draw1(){
  // background(-1);
  //image(b,0,0);
  for (x[now]=0;x[now]<wd;x[now]+=rectsize){
    now=1;
    for (x[now]=0;x[now]<wd;x[now]+=rectsize){
      float z = dist(x[now],x[now-1],mouseX,mouseY)*res;
      //  int pos =mouseX+wd*mouseY;
      //float z= lookup.pixels[pos];
      // float z=alookup[pos];
      //  color paw  =color(z,z,z*2,255-z); //255-z

      color paw  =color(z,z,z*2,255-z); //255-z
      //set(x[now],x[now-1],paw);

      if(z>120)
      {
        fill(paw);
        //point(x[now],x[now-1]);
        rect(x[now],x[now-1],rectsize,rectsize);
      }

    }
    now=0;
  }
  fill(-1,230);
  //ellipse(mouseX,mouseY,30,30);
  //blend(g,0,0,wd,ht,0,0,wd,ht,OVERLAY);
  //b.copy(g,0,0,wd,ht,0,0,wd,ht);
  // b=get();
}




