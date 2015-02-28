
import ddf.minim.*;
import ddf.minim.signals.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;

Minim m;
AudioSample twelve;
AudioSample eleven;
AudioSample nine;
AudioSample seven;
AudioSample five;
AudioSample four;
AudioSample two;
AudioSample zero;

PImage pinkcrystal;
PImage bluecrystal;
PImage blow;
PImage plow;
int hpc = 375;
int vpc = 250;
float pcs = 250;
float pdownsizer;
float pupsizer;

int hbc = 125;
int vbc = 250;
float bcs = 250;
float bdownsizer;
float bupsizer;


float r = 1.0;
float angle = 0;
float speed = 0.07;


float beat; 
float meal; 

int wisp;
int wilt;

void setup() {
  
  size(500,500);
  smooth();
  
  m = new Minim(this);
twelve = m.loadSample("12.mp3");
eleven = m.loadSample("11.mp3");
nine = m.loadSample("9.mp3");
seven = m.loadSample("7.mp3");
five = m.loadSample("5.mp3");
four = m.loadSample("4.mp3");
two = m.loadSample("2.mp3");
zero = m.loadSample("0.mp3");


  bluecrystal = loadImage("crystal.png");
  pinkcrystal = loadImage("crystal2.png");
  blow = loadImage("crystal3.png");
  plow = loadImage("crystal4.png");
}


void draw() {

  
imageMode(CENTER);
 background(216, 242, 255); 
 
  angle += speed;
  float sinval = sin(angle);
  float hover = sinval * r;
  
 pcs = pcs+(hover/2);
  bcs = bcs+(hover/2);

 
 
 image(pinkcrystal, hpc,vpc,pcs,pcs);
 
 image(bluecrystal, hbc,vbc,bcs,bcs);
 
 

pdownsizer = dist(hpc, vpc+(pcs/5), mouseX, mouseY);
pupsizer = dist(hpc, vpc-(pcs/5), mouseX, mouseY);
  
bdownsizer = dist(hbc, vbc+(bcs/5), mouseX, mouseY);
bupsizer = dist(hbc, vbc-(bcs/5), mouseX, mouseY);  
 
  
   
  if(isOverImage((hpc), (vpc), (pcs/(pinkcrystal.width+0.0)) ,pinkcrystal,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    hpc = hpc + (mouseX - pmouseX);
    vpc = vpc + (mouseY - pmouseY);
    
  }
  
    if(isOverImage((hbc), (vbc), (bcs/(bluecrystal.width+0.0)),  bluecrystal,mouseX,mouseY, 120)&&(mousePressed == true)&&(mouseButton == LEFT))
   {
    hbc = hbc + (mouseX - pmouseX);
    vbc = vbc + (mouseY - pmouseY);
    
  }
  
  if((pdownsizer < pcs/10) && (mousePressed == true) && (pcs >150))
  {

pcs = pcs - 2;
  }
  
    if((pupsizer < pcs/10) && (mousePressed == true) && (pcs <491))
  {
pcs = pcs + 2;
  }
  
   if((bdownsizer < bcs/10) && (mousePressed == true) && (bcs >150))
  {

bcs = bcs - 2;
  }
  
    if((bupsizer < bcs/10) && (mousePressed == true) && (bcs <491))
  {
bcs = bcs + 2;
  }
  
 // ********SOUND********// 
beat = round(dist(hbc,vbc,hpc,vpc));
if(wisp>0)
{wisp = wisp-5;}
if(wilt>0)
{wilt = wilt-5;}



meal=meal+1;
if(meal>beat)
{meal=0;
wilt=250;}



if(meal==round(beat/2))
{wisp=250;}

if((pcs >= 145) && (pcs < 193) && (meal==round(beat/2))) 
{twelve.trigger();}
if((pcs >= 193) && (pcs < 236) && (meal==round(beat/2))) 
{eleven.trigger();}
if((pcs >= 236) && (pcs < 278) && (meal==round(beat/2))) 
{nine.trigger();}
if((pcs >= 278) && (pcs < 321) && (meal==round(beat/2))) 
{seven.trigger();}
if((pcs >= 321) && (pcs < 363) && (meal==round(beat/2))) 
{five.trigger();}
if((pcs >= 363) && (pcs < 406) && (meal==round(beat/2))) 
{four.trigger();}
if((pcs >= 406) && (pcs < 448) && (meal==round(beat/2))) 
{two.trigger();}
if((pcs >= 448) && (pcs < 600) && (meal==round(beat/2))) 
{zero.trigger();}








if((bcs >= 145) && (bcs < 193) && (meal==0)) 
{twelve.trigger();}
if((bcs >= 193) && (bcs < 236) && (meal==0)) 
{eleven.trigger();}
if((bcs >= 236) && (bcs < 278) && (meal==0)) 
{nine.trigger();}
if((bcs >= 278) && (bcs < 321) && (meal==0)) 
{seven.trigger();}
if((bcs >= 321) && (bcs < 363) && (meal==0)) 
{five.trigger();}
if((bcs >= 363) && (bcs < 406) && (meal==0)) 
{four.trigger();}
if((bcs >= 406) && (bcs < 448) && (meal==0)) 
{two.trigger();}
if((bcs >= 448) && (bcs < 600) && (meal==0)) 
{zero.trigger();}



  

pushMatrix();
  tint(255,wisp);
  image(blow, hpc,vpc,pcs,pcs);
  noTint();
popMatrix();    
  
pushMatrix();
  tint(255,wilt);
  image(plow, hbc,vbc,bcs,bcs);
  noTint();
popMatrix();  
  
 if(hbc<0){hbc=0;}
 if(vbc<0){vbc=0;}
 if(vbc>500){vbc=500;}
 if(hbc>500){hbc=500;} 
 
 if(hpc<0){hpc=0;}
 if(vpc<0){vpc=0;}
 if(vpc>500){vpc=500;}
 if(hpc>500){hpc=500;}
  
  
 // ********************//    

  
}







boolean isOverImage(int imgX, int imgY, float scaleIn, PImage img, int x, int y, int tolerance) {
  
  try{

    img.loadPixels();
  
    int posX = (int)(((x - imgX)*(1/scaleIn) + img.width/2));
    int posY = (int)(((y - imgY)*(1/scaleIn) + img.height/2));
  
   // println(posX);
  //  println(posY);
    if(posX < 0 || posX > img.width || posY < 0 || posY > img.height)
      return false;
    else {
      int i = posY*img.width+posX;
   
  
  
      if(alpha(img.pixels[i]) > tolerance) {
        return true;
      }
      else {
        return false;
      }
    }
  }
  catch(Exception e ){println("a horrible thing just happened");return false;}
}



void stop()
{
 twelve.close();
 eleven.close();
 nine.close();
 seven.close();
 five.close();
 four.close();
 two.close();
 zero.close();
 
 m.stop();
 
  super.stop();
}

 
 

