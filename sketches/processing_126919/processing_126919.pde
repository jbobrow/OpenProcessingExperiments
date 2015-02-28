
/*@pjs preload="apple2.png";*/

int  Ys=10; //y speed
int  Xs=7;  //x speed

int  Ys2=20; //y2 speed
int  Xs2=11; //x2 speed

int  Ys3=2; //y3 speed
int  Xs3=5; //x3 speed

int  Ac=360; //apple color

int  mode=0; //apple color kirikae
int  modeE=0; //kazu kirikae
int  modeS=0; //hutosa kirikae
int  modeR=0; //shikaku  kirikae

int  Ek=0; //en kazu
int  es=0; //en ookisa
int  sw=2; //sen ookisa

int  appleX=249; //apple yoko gensun
int  appleY=300; //apple tate gensun

//apple ugokanai
float yz = random(50,400);
float xz = random(40,165);
float yz2 = random(50,400);
float xz2 = random(205,410);


//apple ugoiteru
float Yz = random(50,200);
float Xz = random(40,165);
float Yz2 = random(100,400);
float Xz2 = random(205,410);
float Yz3 = random(200,300);
float Xz3 = random(205,410);

PImage img;   



void setup() 
{
  colorMode(HSB, 360);
  size(450, 450 );
  background(360); //haikei
  smooth();
  noStroke();
  frameRate(30);
  ellipseMode(CENTER);
  imageMode(CENTER);
  rectMode(CENTER);
}


void draw() 
{
background(360);//haike


//mouse tyuuou mitudo kirikae
if(mouseButton == CENTER &&mousePressed) 
{
    modeE = (modeE + 1) % 3; 
}


//en mitudo
  if(modeE == 0) //en sukunai
{
    Ek=90;
} 
else if(modeE==1) //en hutuu
{
    Ek=70;
}
else if(modeE==2) //en ooi
{
    Ek=55;
} 


//sen ookisa kirikae
if((keyPressed == true) && (key == 's')) 
{
    modeS = (modeS + 1) % 3; 
}


//sen hutosa
  if(modeS == 0) //en sukunai
{
    sw=1;
} 
else if(modeS==1) //en hutuu
{
    sw=2;
}
else if(modeS==2) //en hutuu
{
    sw=3;
}


//katati kirikae
if((keyPressed == true) &&(key == 'k')) 
{

    modeR = (modeR + 1) % 2;
}

//en kurikaesi sen nomi
for(int maruW = 0;maruW < width; maruW+=Ek)
{
        for(int maruH = 0;maruH < height; maruH+=Ek)
        {
            noFill();
            strokeWeight(sw);
            stroke(maruW ,250,200,240); 
//katati syurui 
              if(modeR == 0) 
                  {
                  ellipse(maruW+45,maruH+45, es,es);        
                  } 
              else 
                  {
                  rect(maruW+45,maruH+45, es,es);
                  }
         }
}
//mouse hidariosi en ookikunaru 
if(mouseButton == LEFT)
{
es+=15;    
}
//en zyougen
if(es>1250)
   {
      es=0;
   }


//gazou
img = loadImage("apple2.png");//gazou yomikomi
tint(360,0,Ac);//gazou iro
image(img, Yz, Xz,appleX/3,appleY/3);
image(img, Yz3, Xz3,appleX/5,appleY/5);
image(img, Yz2, Xz2,appleX/15,appleY/15);
image(img, yz, xz,appleX/12,appleY/12); 
image(img, yz2, xz2,appleX/4,appleY/4); 


//apple idou sokudo    
 Yz=Yz+Ys;
 Xz=Xz+Xs;
//apple2 modoru 
if(Yz>400||Yz<50)
  {
    Ys=-Ys;
  }
if(Xz>410||Xz<40)
  {
    Xs=-Xs;
  }
//apple2 idou sokudo  
 Yz2=Yz2+Ys2;
 Xz2=Xz2+Xs2;
//apple2 modoru 
 if(Yz2>400||Yz2<50)
  {
    Ys2=-Ys2;
  }
if(Xz2>410||Xz2<40)
  {
    Xs2=-Xs2;
  }
//apple3 idou sokudo  
 Yz3=Yz3+Ys3;
 Xz3=Xz3+Xs3;
//apple3 modoru 
 if(Yz3>400||Yz3<50)
  {
    Ys3=-Ys3;
  }
if(Xz3>410||Xz3<40)
  {
    Xs3=-Xs3;
  }


//apple kotae
  if(mode == 0) 
{
    Ac=360;
} 
else
{
    Ac=0;
}


//mouse migi apple henka
if(mouseButton == RIGHT &&mousePressed) 
{
    mode = (mode + 1) % 2; 
}




}


void keyPressed() {
  switch(key) {
    case 'c':
      if(mode == 1) 
        {
          mode = (mode + 1) % 2;
        }
       if(modeR == 1) 
        {
          modeR = (modeR + 1) % 2;
        }
      es=0;//en syokika        
      //apple idou
      yz = random(50,400);
      xz = random(40,165);
      yz2 = random(50,400);
      xz2 = random(205,410);
      
      Yz = random(50,200);
      Xz = random(40,165);
      Yz2 = random(100,400);
      Xz2 = random(205,410);
      Yz3 = random(200,300);
      Xz3 = random(205,410);
      break;
  }
}

