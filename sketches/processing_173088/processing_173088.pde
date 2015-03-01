
PImage background;

PImage lose;

int x = 0;
int dx = -2;

int time;

int block1 = -630;
int block1end = -3400;
int block2 = -900;
int block2end = -940;
int block3 = -1350;
int block3end = -1390;
int block4 = -1850;
int block4end = -1890;
int block5 = -2150;
int block5end = -2190;



int frames = 9;
int panel = 0;
PImage skeleton = new PImage[frames];
float xpos, ypos;
PImage nohead = new PImage[frames];


void setup (){
  
  size (600, 600);
  
  frameRate(20);
  
  background=loadImage("background.png");
  lose=loadImage("losescreen.png");
 
 
  for(int i=0; i<9;i++){
    skeleton[i]=loadImage("Skeleton"+i+".png");
    }
  for(int i=0; i<9;i++){
    nohead[i]=loadImage("NoHeadSkeletoncopy"+i+".png");
  }  
}
 
void draw(){
  
  //background

   image(background, x, -40);
  x = x + dx;
  if(x <= -3400){
      dx = 0;
  }
    
  if(keyPressed){
     if(key == 'r'){  
      image(background, x, -40);
  x = x + dx;
  if(x <= -3400){
      dx = 0;
  }
    }
  }
    
  
  
 

 
  

  if(keyPressed){
     if(key == 'r'){
     xpos++;
     panel = (panel+1) % frames;
     image(skeleton[panel%frames], 0, 185);
     println(panel);    
    }
     if(key == 'd'){
       xpos++;
       panel = (panel+1) % frames;
       image(nohead[panel%frames], 0, 285);
       println(panel);
    }
   }
   else{
     image(skeleton[panel%frames], 0, 185);
   }  
   
   if(keyPressed){
     if((key == 'r') && ((x <= block1) && (x >= block1end))){
       image(lose, 0,0);
       
     }
   }
   
   
   if(keyPressed){
     if((key == 'r') && ((x <= block2) && (x >= block2end))){
       image(lose, 0,0);
     }
   }
   
   if(keyPressed){
     if((key == 'r') && ((x <= block3) && (x >= block3end))){
       image(lose, 0,0);
     }
   }
   
   if(keyPressed){
     if((key == 'r') && ((x <= block4) && (x >= block4end))){
       image(lose, 0,0);
     }
   }
   
   if(keyPressed){
     if((key == 'r') && ((x <= block5) && (x >= block5end))){
       image(lose, 0,0);
     }
   }
   
     } 
     
     



