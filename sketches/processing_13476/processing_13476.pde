
// image centered at 75,50


// Declaring a variable of type PImage
PImage pupil;
PImage white;
PImage eyelid;
PImage skin;
PImage angry;
PImage blood;
int timer = 0;
int skitter = 0;
int rmouseX = 0;
int rmouseY = 0;
int bloodx = 0;
int bloody = 0;
float fac = 5;
float easing = .1;
boolean back = false;



void setup() {
  frameRate(30);
  size(600,600);
  // Make a new instance of a PImage by loading an image file
  pupil = loadImage("pupil.png");
  white = loadImage("white.png");
  eyelid = loadImage("eyelid.png");
  skin = loadImage("skin.png");
  angry = loadImage("angry.png");
  blood = loadImage("blood.png");
}

void mousePressed()
{
  pushMatrix();
  bloodx = mouseX;
  bloody = mouseY;
}

void mouseReleased()
{
  popMatrix();
}


void draw() {
  background(240+skitter,max(185-skitter,65),max(150-skitter,30));
  
  //determine variable values
  
  if(rmouseX < mouseX){rmouseX+=fac;}
  else if(rmouseX > mouseX){rmouseX-=fac;}else{rmouseX=mouseX;}
  
  if(rmouseY < mouseY){rmouseY+=fac;}
  else if(rmouseY > mouseY){rmouseY-=fac;}else{rmouseY=mouseY;}
  
  if(mousePressed == true){skitter++;translate(random(skitter/40)-skitter/80,random(skitter/40)-skitter/80);}
  else{skitter=10;}
  
  
  
  //tile background
  if(back == true)
  {
    for(int btx = 0; btx < width; btx += 300)
    {
      for(int bty = 0; bty < height; bty += 300)
      {
        image(skin,btx,bty);
      }
    }
  }
  
  //draw blood if needed
  if(skitter>10){tint(255,skitter);image(blood,bloodx-150,bloody-150);tint(255,255);}
  
  //lets start drawing eyes!
  for(int etx = 0; etx < width-50; etx += 100)
  {
    for(int ety = 0; ety < height-50; ety += 100)
    {
      tint(255,255);
      //draw the whites
      image(white,etx,ety);
      
      
      if(dist(etx+50,ety+50,mouseX,mouseY) > 35)
      {
        image(pupil,
        
        constrain((etx)+((26*(rmouseX-(etx))/width))+
        (random(max((skitter/10)-skitter/20,2))-max(skitter/20,1)),etx-13,etx+13),
        
        constrain((ety)+((26*(rmouseY-(ety))/height))+
        (random(max((skitter/10)-skitter/20,2))-max(skitter/20,1)),ety-13,ety+13));
      }
      else
      {
        image(angry,
        constrain(rmouseX-50+(random(skitter)-skitter/2),etx-13,etx+13),
        constrain(rmouseY-50+(random(skitter)-skitter/2),ety-13,ety+13));
      }
      
      
      //////////////////////
      image(eyelid,etx,ety);
    }
  }
  fac = dist(rmouseX,rmouseY,mouseX,mouseY)*easing;
}


