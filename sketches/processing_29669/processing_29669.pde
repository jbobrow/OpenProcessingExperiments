
 import processing.opengl.*;

int units = 4;
int[] digi = {2,2,2,2};
int[] nums = {100,60,60,24};
int[] cnt = {520,460,400,340};
int[] mgn = {100,100,100,100};
int[] gSize = new int[units];

PGraphics[] PG = new PGraphics[units];

PFont font;
Calendar c;

int h,m,s;
float msInit,msDraw;
float initCheck;
boolean start=false;
int ms;
color col;

void setup() {
  size(400,300,OPENGL);
  for(int i=0; i<units; i++) gSize[i] = cnt[i]*2 + mgn[i]; 
  font = loadFont("YentiEGP-Extra-SJIS-40.vlw");
  colorMode(HSB,360,100,100,100);
  col = color(240,100,70);
      
  for (int i=0; i<units;i++){
    PG[i] = createGraphics(gSize[i],gSize[i],JAVA2D);
    PG[i].beginDraw();
    PG[i].textAlign(CENTER,BASELINE);
    PG[i].colorMode(HSB,360,100,100,100);
    PG[i].smooth();
    PG[i].background(0,0);
    PG[i].textFont(font,40);
    PG[i].noStroke();
    PG[i].fill(col);
    PG[i].textAlign(BOTTOM);
    PG[i].translate(PG[i].width*0.5, PG[i].height*0.5);
    for (int j=0; j<nums[i]; j++) {
      PG[i].pushMatrix();
      PG[i].rotate( radians( 360.0/nums[i]) * j   );
      PG[i].text(nf((nums[i]-j)%nums[i],digi[i]),cnt[i],0);
      PG[i].popMatrix(); 
    }
    PG[i].endDraw();
}

frameRate(30);

}

void draw() {  
  background(0);
    c = Calendar.getInstance();
    ms = c.get(Calendar.MILLISECOND);
    s =  c.get(Calendar.SECOND);
    m =  c.get(Calendar.MINUTE);
    h =  c.get(Calendar.HOUR_OF_DAY);
    
    //////////////////////////////////////////////////////////////
    imageMode(CENTER);
    
    float
    unitMs = ms,
    unitS  = s + (unitMs * 0.001),
    unitM  = m + (unitS / 60.0),
    unitH  = h + (unitM / 60.0),
    
    rotMs =map(unitMs,0,1000,0,360),
    rotS = map(unitS,0,60,0,360),
    rotM = map(unitM,0,60,0,360),
    rotH = map(unitH,0,24,0,360);
    
    noStroke();
    fill(map(unitMs,0,1000,200,50));
    rect(10,(height*0.5)+0,width-20,5);
    
    pushMatrix();
    translate(  -width*0.5, height*0.5);
    
    pushMatrix();
    rotate( radians(rotS));
    image(PG[1],0,0);
    popMatrix();

    pushMatrix();
    rotate( radians(rotM));
    image(PG[2],0,0);
    popMatrix();

    pushMatrix();
    rotate( radians(rotH));
    image(PG[3],0,0);
    popMatrix();    

    pushMatrix();
    rotate( radians(rotMs));
    image(PG[0],0,0);
    popMatrix();    
    popMatrix();

    textFont(font);
    noStroke();
    fill(240,100, map(unitMs,0,1000,50,20));
    text(":",186,height*0.5);
    text(":",248,height*0.5);
    text(",",309,height*0.5+2);
}


