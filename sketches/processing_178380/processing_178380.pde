
//Project 3 



//images
PImage waves;
PImage ship;
PImage clouds;
PImage star_01;
PImage star_02;
PImage star_03;
PImage star_04;


int gameWord = 20;

float shipX = 0;
float  starMove = 1;


boolean victory = false;
void setup()
{
  
size(800,600);
//Wellcome Screen  ,Tribute to old DOS games
background(#000000);

waves = loadImage("waves.png");
ship = loadImage("ship.png");
clouds  = loadImage("clouds.png");
 star_01 = loadImage("star_01.png");
 star_02 = loadImage("star_02.png");
 star_03 = loadImage("star_03.png");
 star_04 = loadImage("star_04.png");
 
 
 
//2 yellow arcs
fill(#EEFF0F);
arc(width/2,100,600,120,3.14,6.28);

fill(#EEFF0F);
arc(width/2,500,600,120,0,3.14);

//the word "GAMES"
//G
fill(#4422aa);
rect(100,220,90,gameWord);
rect(70,255,gameWord,120); 
rect(100,385,90,gameWord);
rect(200,325,gameWord,50);
rect(140,300,50,gameWord);
//A
fill(#EA113C);
quad(300,220,245,405,245+gameWord,405,320,220);
quad(330,220,330+gameWord,220,330+55+gameWord,405,330+55,405);
rect(300,300,50,gameWord);
//M
fill(#1EAD34);
quad(445,220,445+gameWord,220,440,405,440-gameWord,405);
quad(475,220,475+gameWord,220,475+gameWord+20,270,475+gameWord , 270);
quad(475+gameWord+20+10,270,475+gameWord+20+10+gameWord,270,475+gameWord+20+10+gameWord+20,220,475+gameWord+20+10+gameWord,220);
quad(475+gameWord+20+10+gameWord+20+10,220,475+gameWord+20+10+gameWord+20+10+gameWord,220,475+gameWord+20+10+gameWord+20+10+gameWord+20,405,475+gameWord+20+10+gameWord+20+10+gameWord,405);
//E
fill(#FFC217);
rect(475+gameWord+20+10+gameWord+20+10+gameWord+20+10,220,gameWord,185);
rect(475+gameWord+20+10+gameWord+20+10+gameWord+20+10+gameWord+10,220,70,gameWord);
rect(475+gameWord+20+10+gameWord+20+10+gameWord+20+10+gameWord+10,220+80,70,gameWord);
rect(475+gameWord+20+10+gameWord+20+10+gameWord+20+10+gameWord+10,220+165,70,gameWord);



 
 
 
  
} // end setup

void draw()
{
   if ((keyPressed) &&  (!victory))
{
      background(clouds);
      image(waves,0,369);
  {
      
      
     
  } 
  
    if (key == ' ') 
    {
       image(ship,shipX,265);
       shipX = shipX + 2;
       if (shipX == 600)
         { 
           victory = true; 
         }
       
    }  
        
    // if (keyCode==RIGHT)  rect(100,100,100,100);
} //if (keyPressed)  

if (victory == true)
        {
         
       
          background(#000000);
        
          
            image(star_01,300-starMove,300+starMove*0.8,126,126);
            image(star_02,300+starMove+100,300+starMove*0.8,126,126);
            image(star_03,300+starMove+100,300-85-starMove*0.8,126,126);
            image(star_04,300-starMove,300-85-starMove*0.8,126,126);
            starMove = starMove + 1;
            
        }
}  //draw
  


