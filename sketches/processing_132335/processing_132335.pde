
 //class voetbal
Circle eersteCircle;           
Circle tweedeCircle;
Circle derdeCircle;
Circle vierdeCircle;
Circle vijfdeCircle;

//class vanger
Vanger vanger;                 


PImage bg;
PImage voetbal;
PImage goal;
int image;


//muziek
import ddf.minim.*;          
AudioPlayer player;
Minim minim;


void setup(){
  size(700,500);
  bg = loadImage("voetbalveld.jpg");  
  goal = loadImage("goal.png");
  voetbal = loadImage("1__cover_voetbal.png");  
  
  //muziek
  minim = new Minim(this);
  player = minim.loadFile("gamemuziek.mp3", 2048);
  player.play();
  
  
  eersteCircle = new Circle(50,50,35,4); 
  tweedeCircle = new Circle(250,120,35,5);
  derdeCircle = new Circle(400,20,35,5);
  vierdeCircle = new Circle(100,100,35,6);
  vijfdeCircle = new Circle(20,20,35,7);  
 
  vanger = new Vanger(mouseX,450); 

  
}

void draw(){
  
  background(bg);    
  eersteCircle.updateCircle();
  eersteCircle.testCircle();
  eersteCircle.tekenCircle();
  
  tweedeCircle.updateCircle();
  tweedeCircle.testCircle();
  tweedeCircle.tekenCircle();
  
  derdeCircle.updateCircle();
  derdeCircle.testCircle();
  derdeCircle.tekenCircle();
  
  vierdeCircle.updateCircle();
  vierdeCircle.testCircle();
  vierdeCircle.tekenCircle();
  
  vijfdeCircle.updateCircle();
  vijfdeCircle.testCircle();
  vijfdeCircle.tekenCircle();
  
  vanger.tekenVanger();
  

 
  

}












class Vanger{
  int x;
  int y;
  
  Vanger(int tempX, int tempY){
    x = tempX;
    y = tempY;
  }
  
  void tekenVanger(){
    fill(255);
    image(goal,mouseX,450,100,50);
  }
  

}
class Circle{
  float x;
  int y;
  int breedte;
  int snelheid;
  
  Circle(int tempX, int tempY, int tempBreedte, int tempSnelheid){
    x = tempX;
    y = tempY;
    breedte = tempBreedte;
    snelheid = tempSnelheid;
  }
    
  void updateCircle(){
  y = y + snelheid;
  }

  void testCircle(){
  if(y > height){
    x = random(width);
    y = 0;
    }
  }

  void tekenCircle(){
  fill(255);
  image(voetbal,x,y,breedte,breedte);
  }
        
   }  



