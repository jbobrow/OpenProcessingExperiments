
//Max Chang 
//Desma 28 exercise 4 Animate
//use W A S D to navigate, press space to warp it.


  
  
  int y=40;  // holder for robot position
  int x=10; //holder for robot position
  int pewX=x; //holder for projectile position
  Boolean pew=false; //holder for projectile state
  int scrollX=0; //scrolling position
  int scrollXR=scrollX+5296; 
  int op=0;  //opacity holder
  int SR=5; //scrolling rate
  PImage burst; //image for projectile
  PImage shot; //image for projectile
  PImage shot1;
  PShape up;   //svg file for upward motion
  PShape mid;  //svg file for neutral movement
  PShape down; //svg file for downward motion 
  PImage space; //background scrolling image
  PImage spaceR;

void setup()
{
  
  size(480,320);
  smooth();
  space= loadImage("spacebg.jpg");   //load shapes and images
   spaceR=loadImage("spacebgR.jpg");
  
  up = loadShape("up.svg");
  mid =loadShape("mid.svg");
  down = loadShape ("down.svg");
  shot=loadImage("pew.png");
  shot1=loadImage("pew.png");
//  burst=loadImage("burst.png");
// 
  
  
  
  
  
  
}



void draw(){

                
image(space,scrollX,0);          //setup background space image
image(spaceR,(scrollXR),0);

  if(keyPressed){                //series of controls based on keypresses
    if(key=='w'||key=='W'){     
      y-=2;                     //upward motion
      
  shape(up,x,y);               //upward sprite
    }
    else{shape(mid,x,y);      //default neutral sprite
    }    
    if(key=='s'||key=='S'){
      shape(down,x,y);
      y+=2;                 //downward motion
    }
    }
    else
    {
      shape(mid,x,y);       //default neutral sprite
   
    }
    
    if(keyPressed){
      
       if(key==' '){           //space is pressed mess with the opacity of the tint 
         tint(255,op);    
    
     op-=5;
     SR=20;              //increase the scroll rate
   }
   else{
     SR=5;               //neutral states for scroll rate and opacity
     op=255;
   }
   
   if(key=='d'||key=='D'){
     x+=2;                //motion to the right
    shape(mid,x,y);
   }
   
   if(key=='a'||key=='A'){
     x-=2;
     shape(mid,x,y);    //motion to the left
   }
   
   
  
     
    }
   
   
   
   
   if(key==' '){              //if space is pressed
      image(shot,pewX+120,y+20);  //create projectile sprite
   pew=true;                 //projectile state
      pewX+=4;             //projectile rate
   }
      if(pewX>=480){       //ends projectile at the border, resets it
        pewX=x;          //resets pewX
        pew=false;     //resets state
      }

   
    scrollX-=SR;        //sets scroll rate based on input
    if (scrollX<=-5400){   //cycles the scrolling background bugged?
      scrollX+=5206;
    }
    
}

