
Snoep Snoep1;

PImage Poppetje;
PImage Snoep;
PImage background;

float SnoepX = random(width);
int   SnoepY;
int   Speed;
int   richting;
int   Score;
PFont lettertype;

void setup(){
  size(600,700);
  Poppetje = loadImage ("poppetje.png");
  Snoep = loadImage ("snoep.png");
  background = loadImage ("background.jpg");
 
  
  richting = 3;
  SnoepY = -20 ; 
  Score  =  0;
  
}

void draw(){
  background(background);
  tekenPoppetje();
  Snoep1 = new Snoep();
  Snoep1.display();
  Snoep1.speed();
  Snoep1.drop();
  Check();
  showScore();
  Limit();
}

void showScore()  //Laat de score bovenaan het scherm zien//
{
  lettertype = loadFont("lettertype.vlw");
  textFont(lettertype);
  fill(255);
  text("Score: " + Score, 20, 40);
}

void tekenPoppetje(){  //Tekent de vanger onder aan het scherm//
  image(Poppetje,mouseX-100,503);
}

void Check(){  //Kijkt na of het snoepje de vanger aanraakt.// 
              //Als dat wel zo is dan word het snoepje op een willekeurige x breedte neergezet en iets buiten het scherm.// 
    
    if (dist(SnoepX, SnoepY, mouseX, 520) < 100)
    {
      SnoepX = random(0, 600);
      SnoepY = -20;
      Score++;
      richting+=1;
    }
  
    println(Score);
}

void Limit(){  //Limiteerd de snelheid van de vallende snoepjes omdat anders het spel na een bepaald punt onmogelijk is.//
  if(richting == 20){
    richting = 19;}
}

class Snoep { 
 
  

void display(){    //tekent de snoepjes//
  image(Snoep, SnoepX-35, SnoepY);}


void speed(){    //geeft de snelheid aan de snoepjes//
  SnoepY = SnoepY + richting;
  
}

void drop(){    //Als het snoepje de grond raakt krijgt hij een willekeurige X en word hij boven aan het scherm weer gespawned.//
  if(SnoepY > height){
    SnoepY = 0;}
    
 if (SnoepY == 0){
   SnoepX = random(width);}}
   
}


