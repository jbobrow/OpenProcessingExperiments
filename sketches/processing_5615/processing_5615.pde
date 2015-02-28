
int page=1;
PImage cock;
PImage space;
PImage planet;
PImage ark1;
PImage arkplasma;
PImage arkplasmafail;
PImage arktea;
PImage arkteafail;
PImage arkcrash;

PImage ocean;
PImage jungle;
PImage city;

PImage scroll;

PShape midf;
PShape neut;
PShape down;
PShape midb;
PShape hud;

float crashScale=1;
float crashTrans=0;
PImage crash; 
int scrollX=0;
int blur;
int timer=millis();
int robY=0;
int bar=0;
int adj=width/2;


void setup(){
cock=  loadImage("cockpit.png");
space= loadImage("space.jpg");
planet= loadImage("planet.jpg");
crash= loadImage("arkcrash.png");
ark1= loadImage("ark1.png");
arkplasma= loadImage("ark2.png");
arkplasmafail=loadImage("ark3.png");
arktea= loadImage("ark4.png");
arkteafail= loadImage("ark5.png");
arkcrash= loadImage("ark6.png");
scroll= loadImage("scrolymoly.jpg");

down= loadShape("down.svg");
neut= loadShape("neut.svg");
midf= loadShape("midf.svg");
midb= loadShape("midb.svg");
hud= loadShape("hud.svg");

ocean=loadImage("ocean.jpg");
jungle=loadImage("jungle.jpg");
city=loadImage("city.jpg");


size (640, 480);
smooth();
}

void draw(){
 
  
//planet background scales with frame refresh
 pushMatrix();
 scale(crashScale);
 crashScale+=.01;
 translate(0,-crashTrans);
 crashTrans+=1;
  image(planet,0,0);
  popMatrix();



  


 fill(0,35); // use black with alpha 10
 
  rectMode(CORNER);
 
  rect(0,0,width,height);
  
//float randy=radians(random(-2,2));
float randy=random(-4,4);
  float blur=sin(5);
  int y=mouseY;
int x=mouseX;




//translate(randy,randy);


if (crashTrans>=500)
  {
    imageMode(CORNER);
    image(scroll,scrollX,0);
              if (keyPressed)
              {
                
                if(key== 'a' || key== 'A')
              {
                
                scrollX+=10;
                shape(midb,width/2,robY);
                bar+=1;
              }
              if (key=='d' || key== 'D')
              {
                scrollX-=10;
                shape(midf,width/2,robY);
                bar+=1;
              }
                          if (scrollX<=-2560)
                          {
                            scrollX=-2560;
                          }
                          if (scrollX>=0)
                          {
                            scrollX=0;
                          }
             if(key=='w' || key=='W')
             {
               shape(neut,width/2,robY);
               robY-=5;
               bar+=1;
            }
            
            if(key=='s'||key=='S')
            {
              shape(down,width/2,robY);
              robY+=5;
              bar+=1;
            }
           
              }
               else{
              shape(neut,width/2,robY);
                }
                
 
 
 if(((scrollX<=-160&&scrollX>=-760)&&(robY>=325))||((scrollX<=-1780&& scrollX>=-2420)&&robY>=325))
{
  image(jungle,0,0);
     shape(hud,0,0);
    fill(0);
   rect(34,438,bar,25); 
 
  }
 
 
 if((scrollX>=-160 && robY>=325)||((scrollX>=-3200&&scrollX<=-2420)&&robY>=325))
   {
     image(ocean,0,0);
     shape(hud,0,0);
    fill(0);
   rect(34,438,bar,25); 
   }

if((scrollX<=-800&&scrollX>=-1780)&&robY>=325){
   image(city,0,0);
     shape(hud,0,0);
    fill(0);
   rect(34,438,bar,25);
}

if(bar>=585){
  exit();
}

  }
  










else  if(crashTrans>=460)
  {
    image(arkcrash,randy,randy);
  }
  

  
    else if ((mousePressed)&&((mouseX>=100 && mouseX<=210)&&(mouseY>=0&&mouseY<=75)))
  {
    image(arkplasmafail,randy,randy);
  }

else if ((mouseX>=100 && mouseX<=210)&&(mouseY>=0&&mouseY<=75))
  {
    image(arkplasma,randy,randy);
  }
  
else if ((mousePressed)&&((mouseX>=375 && mouseX<=425)&&(mouseY>=0&&mouseY<=50)))
  {
    image(arkteafail,randy,randy);
  }
  
else if ((mouseX>=375 && mouseX<=425)&&(mouseY>=0&&mouseY<=50))
  {
    image(arktea,randy,randy);
  }


else
  {
    image(ark1,randy,randy);
  }

 filter(BLUR,blur);
 
 

 
// 
// if(page==2)
// {
//image(scroll,x,y);
// }
 

  
 
  println(crashTrans);
}

