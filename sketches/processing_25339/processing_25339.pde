

// made by adam schmidt
//all comments ending with~ uncomment for noise mode
//float incr = 1; ~
//float zn =0;~
int t =1;
metaball[] meta = new metaball[10];

int b = 30;
float denom1 = 9*pow(b,6);
float denom2 = 9*pow(b,4);
float denom3 = 9*pow(b,2);

float maxRadius = pow(b,2);

void setup(){
  size(640,480);
  for(int i =0; i< meta.length;i++){
    int xcc = int(random(-10,10));
    int ycc =int(random(-10,10));
    int yps =int(random(0,height));
    int xps = int(random(0,width));
    int t = floor(random(0,2))*2-1;
    int re = int(random(1,255));
    int gr = int(random(1,255));
    int bl = int(random(1,255));

    int n = (round(random(0,1))*2)-1;
    println(n);
    meta[i] = new metaball(xps,yps,xcc,ycc,random(30,3000),re,gr,bl,n);

  }
   

}
void draw(){
  background(0);
  loadPixels();
 // float yn=0;~

  for(int y=0; y< height;y++){
  //  yn = yn+.009;~
   // float xn=0;~
    for(int x=0; x< width;x++){
     // xn = xn+.009;~
      color argb = pixels[int(x)+int(y)*width];
      
      int colr=0;
      int colg=0;
      int colb=0;
/*~      if(t== 2){
        colr = noise(xn,yn,zn)*-120;
        colg = noise(xn,yn,zn)*-120;
        colb = noise(xn,yn,zn)*-120;//subtract
      }
      else if(t==1){
        colr =0;
        colg = 0;//nonr regular
        colb =0;
      }
      else{
        colr = noise(xn,yn,zn)*55;//add
        colg = noise(xn,yn,zn)*55;
        colb = noise(xn,yn,zn)*55;
      }~*/
      float value = 0;
      for(int i =0; i< meta.length;i++){
        value += meta[i].retrieveValue(x,y);
      }
      if ((value < 0.58) && (value > 0.4)) {
          pixels[(x)+(y)*width] = color(255, 255);
        }
    }
  }
  updatePixels();

 // zn=zn+.2;~
//saveFrame("metarainbow-####.tif"); 
 /* for(int i =0; i< meta.length;i++){
    meta[i].update();
  }
*/
}
void keyPressed(){
  for(int i =0; i< meta.length;i++){
    meta[i].update();
  }
}

class metaball{
  //int p;
  float xpos,ypos,xcc,ycc;
  int rs,gs,bs;
  //float strength;
  metaball(int xp,int yp, int xc,int yc,float stre,int r,int g,int b,int ne){
    xpos = xp;//10
    ypos = yp;//10
    xcc = xc;
    ycc =yc;
   // p =round(random(2,2));
   // strength= stre;
    rs =round(ne*r*stre);
    gs =round(ne*g*stre);
    bs = round(ne*b*stre);

  }
  void update(){
    xpos = xpos+xcc;
    ypos = ypos+ycc;
    if(ypos>=height){
      ycc = -ycc;
      ypos =height;
    }
    if(ypos<=0){
      ycc=-ycc;
      ypos = 0;
    }
    if(xpos>=width){
      xcc = -xcc;
      xpos =width;
    }
    if(xpos<=0){
      xcc = -xcc;
      xpos = 0;
    }
  }
  
  float retrieveValue(int x, int y) {
    //return 200.0F / (sq(x-xpos)+sq(y-ypos) + 0.0001);
    float r = sq(x-xpos)+sq(y-ypos); //distance squared
    float value = 0;
    if ( r < maxRadius)
    {
      value = (1 -((4*pow(r,3))/ denom1) +
                    ((17*pow(r,2)) / denom2) -
                    ((22*r) / denom3));
    }
    return value;
      
      
  }
}   


