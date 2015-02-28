
int lionX = int(200);
int lionY = int(200);
int zebraX = int(700);
int zebraY = int(420);
int netX = int (430);
int netY = int (200);
int batX = int (200);
int batY = int (100);


void setup() { 

  size(800, 800); 
  frameRate(25);
  //noCursor();
  //smooth();

} 

void draw() {
  
    //grass background
    rect(0, 0, 800, 800);
    fill(31, 97, 3);
    
     //using instance variables so editing is simpler and randoms etc can be used
    PImage imgZebra;{ 
    imgZebra = loadImage("zebra.png");
    image(imgZebra, zebraX, zebraY); 
    }
    PImage imgZebra2;{ 
    imgZebra2 = loadImage("zebra.png");
    image(imgZebra2, zebraX-500, zebraY+200);
    }
    
    PImage imgBat;{ 
    imgBat = loadImage("bat.png");
    image(imgBat, batX, batY);
    }
    PImage imgNet;{ 
    imgNet = loadImage("net.png");
    image(imgNet, netX, netY);
    }
    
     PImage imgLion; {
     imgLion = loadImage("lion.png");
     image(imgLion, lionX, lionY);
    }

      if(dist(lionX, lionY, batX, batY) < 50) {
     rect(0, 0, 800, 800);
     fill(0);
     text("You were eaten by a bat (somehow). Be more careful in the future. Lions are supposed to be tough.", 100, 300);
      } 
     if(dist(lionX, lionY, netX, netY) < 50) {
     rect(0, 0, 800, 800);
     fill(0);
     text("You were caught by a net. Be more carefull next time. Lions are endangered. !", 100, 300);
     }
     if(dist(lionX, lionY, zebraX, zebraY) < 50) {
     rect(0, 0, 800, 800);
     fill(0);
     text("You caught a Zebra! Closely related to Horses they are considered a vulnerable species. !", 100, 300);
     }
     
     if(dist(lionX, lionY, zebraX-500, zebraY+200) < 50) {
     rect(0, 0, 800, 800);
     fill(0);
     text("You caught a Zebra! Closely related to Horses they are considered a vulnerable species. Class: Mammalia " , 100, 300);
     }
    }



    //controls for lion
void keyPressed() {
    if (keyCode == LEFT) 
    lionX=lionX-5;


    else if (keyCode == RIGHT) 
    lionX=lionX+5;
    
    
    else if (keyCode == DOWN) 
    lionY=lionY+5;
    
    
    else if (keyCode == UP) 
    lionY=lionY-5;
    

 }




