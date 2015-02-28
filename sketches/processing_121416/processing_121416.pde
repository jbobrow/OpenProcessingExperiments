
//each array of meteors represents the number of meteors that fell in a given decade. I wasn't sure how 2-dimensional arrays worked, so I had to do a little extra work...
Meteor[] meteorsA = new Meteor[1];
Meteor[] meteorsB = new Meteor[1];
Meteor[] meteorsC = new Meteor[1];
Meteor[] meteorsD = new Meteor[2];
Meteor[] meteorsE = new Meteor[3];
Meteor[] meteorsF = new Meteor[3];
Meteor[] meteorsG = new Meteor[57];
Meteor[] meteorsH = new Meteor[79];
Meteor[] meteorsI = new Meteor[91];
Meteor[] meteorsJ = new Meteor[98];
Meteor[] meteorsK = new Meteor[162];
int [] years = new int[12];
Star[] stars = new Star[50];
Pool[] pools = new Pool[12];
int counter;
int decade;

void setup(){
size(1000,1000);
counter=0;
decade=0;
for(int y=0; y<12; y++) {years[y]=1910+10*y;}
for(int s=0; s<stars.length; s++){stars[s]=new Star(random(0,width),random(0,2*height/5));}
for(int a=0; a<meteorsA.length; a++)  {meteorsA[a] = new Meteor(width,0); }
for(int b=0; b<meteorsB.length; b++)  {meteorsB[b] = new Meteor(width,0); }
for(int c=0; c<meteorsC.length; c++)  {meteorsC[c] = new Meteor(width,0); }
for(int d=0; d<meteorsD.length; d++)  {meteorsD[d] = new Meteor(width,0); }
for(int e=0; e<meteorsE.length; e++)  {meteorsE[e] = new Meteor(width,0); }
for(int f=0; f<meteorsF.length; f++)  {meteorsF[f] = new Meteor(width,0); }
for(int g=0; g<meteorsG.length; g++)  {meteorsG[g] = new Meteor(width,0); }
for(int h=0; h<meteorsH.length; h++)  {meteorsH[h] = new Meteor(width,0); }
for(int i=0; i<meteorsI.length; i++)  {meteorsI[i] = new Meteor(width,0); }
for(int j=0; j<meteorsJ.length; j++)  {meteorsJ[j] = new Meteor(width,0); }
for(int k=0; k<meteorsK.length; k++)  {meteorsK[k] = new Meteor(width,0); }

for(int p=0; p<pools.length; p++)
  {
    pools[p] = new Pool((width/2-((p+1)*width/pools.length/4)),height/2+(p*(height/2)/pools.length));
  }

}

void draw(){
  background(color(12,46,80));
  fill(150);

 stroke(0);
  rect(0,2*height/5,width,height);
  //for(int y=0; y<12; y++) {text(years[y], )}
  for(int s=0; s<stars.length;s++)  {stars[s].display();}
 // for(int p=0; p<pools.length;p++)  {pools[p].display();}
  for(int p=0; p<pools.length;p++)  {pools[p].display();fill(255); text(years[p],pools[p].xcenter,pools[p].ycenter);}
  counter++;
  
  if (counter % 300 == 0){decade++;}
  if (counter>30)    {for (int a=0; a<meteorsA.length;a++) {if (meteorsA[a].counted==false)  {meteorsA[a].display(); meteorsA[a].move(); meteorsA[a].splash(pools[decade]);}}}
  if (counter>300)   {for (int b=0; b<meteorsB.length;b++) {if (meteorsB[b].counted==false)  {meteorsB[b].display(); meteorsB[b].move(); meteorsB[b].splash(pools[decade]);}}}
  if (counter>600)   {for (int c=0; c<meteorsC.length;c++) {if (meteorsC[c].counted==false)  {meteorsC[c].display(); meteorsC[c].move(); meteorsC[c].splash(pools[decade]);}}}
  if (counter>900)   {for (int d=0; d<meteorsD.length;d++) {if (meteorsD[d].counted==false)  {meteorsD[d].display(); meteorsD[d].move(); meteorsD[d].splash(pools[decade]);}}}
  if (counter>1200)   {for (int e=0; e<meteorsE.length;e++) {if (meteorsE[e].counted==false)  {meteorsE[e].display(); meteorsE[e].move(); meteorsE[e].splash(pools[decade]);}}}
  if (counter>1500)   {for (int f=0; f<meteorsF.length;f++) {if (meteorsF[f].counted==false)  {meteorsF[f].display(); meteorsF[f].move(); meteorsF[f].splash(pools[decade]);}}}
  if (counter>1800)   {for (int g=0; g<meteorsG.length;g++) {if (meteorsG[g].counted==false)  {meteorsG[g].display(); meteorsG[g].move(); meteorsG[g].splash(pools[decade]);}}}  
  if (counter>2100)   {for (int h=0; h<meteorsH.length;h++) {if (meteorsH[h].counted==false)  {meteorsH[h].display(); meteorsH[h].move(); meteorsH[h].splash(pools[decade]);}}}  
  if (counter>2400)   {for (int i=0; i<meteorsI.length;i++) {if (meteorsI[i].counted==false)  {meteorsI[i].display(); meteorsI[i].move(); meteorsI[i].splash(pools[decade]);}}}  
  if (counter>2700)   {for (int j=0; j<meteorsJ.length;j++) {if (meteorsJ[j].counted==false)  {meteorsJ[j].display(); meteorsJ[j].move(); meteorsJ[j].splash(pools[decade]);}}}  
  if (counter>3000)   {for (int k=0; k<meteorsK.length;k++) {if (meteorsK[k].counted==false)  {meteorsK[k].display(); meteorsK[k].move(); meteorsK[k].splash(pools[decade]);}}}
  if (counter>3600) {counter=0;}  
 }
  
  
  
/*int decade=0;
while (decade<2)
{
 if (decade==0){  
  for(int a=0; a<meteorsA.length; a++) {
    if (meteorsA[a].counted==false)  {
        meteorsA[a].display(); 
        meteorsA[a].move(); 
        meteorsA[a].splash(pools[decade]);}
    if (meteorsA[a].counted==true && a==meteorsA.length-1) {decade++;}}
 }
if (decade==2){


for(int b=0; b<meteorsB.length; b++) {if (meteorsB[b].counted==false)  {meteorsB[b].display(); meteorsB[b].move(); meteorsB[b].splash(pools[decade]);}if (meteorsB[b].counted==true && b==meteorsB.length-1) {decade++;}}
}}
*/

/*pools.length;*/
  
class Meteor {
 
  float startPos;
  float xpos;
  float ypos;
  float speed;
  float radius; 
  boolean counted;
  
  Meteor(float a, float b){
    xpos = a;
    ypos = b; 
    radius = 25;
    speed = random(5,7);
    counted = false;
  }
  
  void display(){
    strokeWeight(0);
    fill(255,0,0);
    triangle(xpos-radius/2,ypos,xpos+radius/2,ypos,xpos+radius*2,ypos-radius*3);
        strokeWeight(0);
    fill(255,255,0);
    triangle(xpos-radius/3,ypos,xpos+radius/3,ypos,xpos+radius*1.3,ypos-radius*2);
        strokeWeight(0);
        fill(150);
    ellipse(xpos,ypos,radius,radius);
  }
  
  void move(){
    /*if (xpos>p.xcenter)
      {
        xpos=xpos-speed;
      }*/
      xpos = xpos-speed*(random(.5,1.5));
    ypos=ypos+speed;
  }
  
  void splash(Pool p){/*
    float distance = dist(xpos,ypos,p.xcenter,p.ycenter);
    if (counted == false)
    {
      if (distance < 20)
      {
        p.radiusA = p.radiusA+10;
        counted = true;
      } 
      
    }*/
    if (ypos > p.ycenter){p.radiusA = p.radiusA+10; counted=true;}
  }
}

class Star{
 float center;
 float side;
 float x;
 float y;
 
 Star(float xpos, float ypos)
{
x = xpos;
y = ypos;
side = random(7,15); 
} 
  void display(){
strokeWeight(random(0,3));
stroke(255,255,0);
  //fill(255);
line(x,y,x+side,y+side);
line(x,y+side,x+side,y);
  }
}

class Pool{

  float radiusA;
  float radiusB;
  float xcenter;
  float ycenter;
  
  Pool(float a, float b){
    xcenter = a;
    ycenter = b;
    radiusA = 0;
    radiusB = 20;
  }
  
  void display()
  {
    stroke(1);
    strokeWeight(1);
    line(xcenter+radiusA/2,ycenter,xcenter+radiusA/2+25,ycenter+radiusB);
    line(xcenter-radiusA/2,ycenter,xcenter-radiusA/2-25,ycenter+radiusB);
    
    fill(100);
    ellipse(xcenter,ycenter,radiusA,radiusB);
    }
}

