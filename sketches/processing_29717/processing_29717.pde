
//cloud Maker
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
PImage redgreencloud; //yellow
float [] alookup = new float [wd*ht];
PImage b;
float [] _x = new float [wd*ht];
float [] _y = new float [wd*ht];
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
void setup(){

  size(450,450);
  a=createImage(wd,ht,ARGB);
  redcloud = createImage(wd,ht,ARGB);
  greencloud= createImage(wd,ht,ARGB);
  bluecloud= createImage(wd,ht,ARGB);
  redbluecloud = createImage(wd,ht,ARGB);
  greycloud = createImage(wd,ht,ARGB);
  redgreencloud = createImage(wd,ht,ARGB);//yellow
  darkgreycloud =createImage(wd,ht,ARGB);
  now=0;
  background(-1);
  noStroke();
  lookup= createImage(wd,ht,ARGB);
  for (x[now]=0;x[now]<wd;x[now]+=rectsize){
    now=1;
    for (x[now]=0;x[now]<wd;x[now]+=rectsize){
      float z = dist(x[now],x[now-1],wd/2,ht/2)*res;
      //fill(1,255-z);
      int pos = x[now-1]+wd*x[now];
      if(z<wd){
      // a.set(x[now-1],x[now],z);
      lookup.pixels[pos]=color(z,z,z*2,255-z);
      bluecloud.pixels[pos]=color(z,z,z*2,255-z);
      redcloud.pixels[pos]=color(z*2,z,z,255-z);
      greencloud.pixels[pos]=color(z,z*2,z,255-z);
      redbluecloud.pixels[pos]=color(z*2,z,z*2,255-z);
      greycloud.pixels[pos]=color(z,z,z,255-z);
      //  darkgreycloud.pixels[pos]=color(z,z,z/2,255-z); //yellow fume
      //darkgreycloud.pixels[pos]=color(z,z/2,z,255-z); // dark purple
      darkgreycloud.pixels[pos]=color(z/2,z,z,255-z); //dark blue
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
      float z = dist(x[now],x[now-1],wd/2,ht/2);
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
                                
