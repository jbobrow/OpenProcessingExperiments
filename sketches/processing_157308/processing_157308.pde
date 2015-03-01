

/* @pjs preload="cowboy.png","cows.png"; */

int numPos=100;

int[] posX=new int[numPos];
int[] posY=new int[numPos];Cowboy cb;
Cowboy hk;
PImage img;
PImage cows;
ArrayList cowboys= new ArrayList();
void setup() {
  background(10);
  size(800, 800);
  cb = new Cowboy();
  cb.cowboy(50, 10000, color(100, 40, 200), true, 757, "Tim");
  img = loadImage("cowboy.png");
   hk = new Cowboy();
  hk.cowboy(50, 10000, color(100, 40, 200), true, 2, "hank");
  img = loadImage("cowboy.png");
  cows = loadImage("cows.png");
}



void draw() {
  
  for (int i=0; i<cowboys.size (); i++) {
    Cowboy cb=(Cowboy) cowboys.get(i);
  cb.display();

    
  } 
     
   }
    void keyPressed() {
       image(img, 0, 0);
      cb.thisistim();
      
    }
     void keyReleased() {
      cb.thisistim();
        for(int i=0;i<numPos;i++){
     posX[i]=int(random(width));
     posY[i]=int(random(height));
 image(cows, posX[i], posY[i]);
}
     
    }
      void mousePressed() {
      hk.hanksucks();
    }
    
    class Cowboy {
      //declare the types of variables that apply to cowboys
      int cowboyHeight;
      int cowboyWeight;
      color cowboyColor;
      boolean isLiving;
      int cattleNumber;
      String name;


      Cowboy() {
        cowboyHeight = 108;//default height is 108 units
        cowboyWeight =1200;//default weight
        cowboyColor = color(15, 60, 47);
        isLiving=true;
        cattleNumber= 300;
        name = "Roger";
      }

      void cowboy(int iCowboyHeight, int iCowboyWeight, color iCowboyColor, 
      boolean iIsLiving, int iCattleNumber, String iName) {
        cowboyHeight=iCowboyHeight;
        cowboyWeight =iCowboyWeight;
        cowboyColor= iCowboyColor;
        isLiving=iIsLiving;
        cattleNumber = iCattleNumber;
        name=iName;
      }


      void cattleherd() {


        println("a cowboy named" + name+"is herding cattle");
      } 

      void thisistim()
      {
        println(name +" has "+
          cattleNumber+"cows ");
      }
      void hanksucks(){
           println(name+"is a pretty shitty cowboy");
      } 
        
      
   
    void display() {
      image(img, 0, 0);
    }
    }



