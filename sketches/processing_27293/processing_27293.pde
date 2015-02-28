
float sized;
int a = 20; 
float[] webx = new float[20];
float[] weby = new float[20];
float[] mvx = new float[20];
float[] mvy = new float[20];
void setup(){
size(450,450);
strokeWeight(.1);
stroke(64,128,187);
smooth();
frameRate(60);
for(int i=0; i < a; i++){
  webx[i]=random(450);
}
for(int i=0; i < a; i++){
  weby[i]=random(10,230);
}
for(int i=0; i < a; i++)
{
mvx[i] =random(-1,1);
mvy[i] =random(-1,1);
}


}

void draw(){
  
  
  if(mousePressed)setup();
  sized=random(10,20);
  for(int i=0; i < a; i++){
ellipse(webx[i],weby[i],1,1);
webx[i] = webx[i] + mvx[i];
weby[i] = weby[i] + mvy[i];
}

//BOUNCY BOUNCE
  for(int i=0; i < a; i++){ 
   if(webx[i] > width){
  mvx[i] = mvx[i] * -1;
 } 
  if(webx[i] < 0){
  mvx[i] = mvx[i] * -1;
 } 
  if(weby[i] > height){
   mvy[i] = mvy[i] * -1;
 } 
 if(weby[i] < 0){
  mvy[i] = mvy[i] * -1;
 } 
 //gravity
 mvy[i] += 0.1; 
 }
 
colorMode(HSB, 255);
color c = color(webx[1],weby[1], 255);
stroke(c);


  line(webx[0],weby[0],webx[1],weby[1]);
  line(webx[1],weby[1],webx[2],weby[2]);
  line(webx[2],weby[2],webx[3],weby[3]);
  line(webx[3],weby[3],webx[4],weby[4]);
  line(webx[4],weby[4],webx[5],weby[5]);
  line(webx[5],weby[5],webx[6],weby[6]);
  line(webx[6],weby[6],webx[7],weby[7]);
  line(webx[7],weby[7],webx[8],weby[8]);
  line(webx[8],weby[8],webx[9],weby[9]);
  line(webx[9],weby[9],webx[10],weby[10]);
  line(webx[10],weby[10],webx[11],weby[11]);
  line(webx[11],weby[11],webx[12],weby[12]);
  line(webx[12],weby[12],webx[13],weby[13]);
  line(webx[13],weby[13],webx[14],weby[14]);
  line(webx[14],weby[14],webx[15],weby[15]);
  line(webx[15],weby[15],webx[16],weby[16]);
  line(webx[16],weby[16],webx[17],weby[17]);
  line(webx[17],weby[17],webx[18],weby[18]);
  line(webx[18],weby[18],webx[19],weby[19]);
  line(webx[19],weby[19],webx[0],weby[0]);

  //FADE
  fill(0,0,0,5);
  rect(0,0,1024,786);
  noFill();

  
 
 
}

                
                                
