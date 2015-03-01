
//walking dinosaur and rider
int frames=13;
int panel=0;
int xmovement=0;
PImage walk=new PImage[frames];
//background images
int bframes=12;
int bgindex=0;
float timr=0.0;
PImage[] pretty=new PImage[bframes];


//PFont font;



 
void setup(){
  size(950,600);
  frameRate(13);

 // font=createFont("CurlzMT.vlw",36,true);
  pretty[0]=requestImage("Pic0.jpg");//Anchorage skyline, found
  pretty[1]=requestImage("Pic1.jpg");//overhead of Saint Elias Mountains, photo taken by me
  pretty[2]=requestImage("Pic2.jpg");//Alaska, Kenai Peninsula, photo taken by me
  pretty[3]=requestImage("Pic3.jpg");//Longwood Gardens, PA, photo taken by me
  pretty[4]=requestImage("Pic4.jpg");//Longwood Gardens, PA, photo taken by me
  pretty[5]=requestImage("Pic5.jpg");//Chicago, Soldier Field, photo taken by me
  pretty[6]=requestImage("Pic6.jpg");//Chicago, Bean, phot found
  pretty[7]=requestImage("Pic7.jpg");//Chicago, night skyline, photo found
  pretty[8]=requestImage("Pic8.jpg");//New York City Theater Distric, photo found
  pretty[9]=requestImage("Pic9.jpg");//Central Park, New York, photo found
  pretty[10]=requestImage("Pic10.jpg");//Disney World entrence, photo found
  pretty[11]=requestImage("Pic11.jpg");//Welcome to Intercorse, PA, photo found
 
 //setup to run dino walking
  for(int i=0;i<walk.length;i++){
    walk[i]=loadImage("Dino"+i+".png");
 } 

}

void draw(){
  //fill(#166A1B);
//  textAlign(LEFT);
 // text("I've been ev-er-y-where man.",740,625);
 
  

  fill(#166A1B);
  rect(0,0,750,600);
  
  //setups background images 
  timr=timr+(1.0/13.0);
  if(timr>5){
    bgindex+=1;
    timr=0;
  }
  if(bgindex<0||bgindex>=pretty.length){
    bgindex=0;
  }
  image(pretty[bgindex],0,0,width,600);
  
  
  panel=(panel+1) % frames;
  image(walk[panel%frames],455,325);

}
  




