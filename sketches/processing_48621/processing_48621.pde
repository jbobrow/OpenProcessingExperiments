


mob creeper;//creates the name for a new mob

void setup(){
  size(700,500,P3D);
  
  //IT IS IMPOSSIBLE TO RUN THIS CODE DIRECTLY FROM YOUR PROCESSING WINDOW
  //UNLESS YOU KNOW HOW TO CREATE A DATA FOLDER AND PUT AN IMAGE IN IT.
  //otherwise enjoy playing with this on the web :)
  creeper=new mob(loadImage("creeper.png"));//creates the mob called creeper
  
  noStroke();
}

void draw(){
  background(50,50,225);
  lights();//makes some lights
  
  fill(200,0,200);
  Platform(width/2,400,0, 700,100,creeper);//places a platform
  Pointer();//places a sphere on the platform
  
  fill(0,200,0);
  Creeper(350, 270, 100);// places a creeper
  
  // I was trying to get two creepers to run simultaiously but failed
 // Creeper(300 ,270 ,300);
 
 collider(width/2,1000,0, 7000,100,creeper);//places a collider
 
}


void Creeper(float X, float Y,float Z){// a function that puts together the mob
  pushMatrix();
  creeper.Entity(X,Y,Z,100,30);
  
  creeper.follow(2,mouseX,mouseY*2-height-200);
  
  creeper.isTextured(false);// change the false in here to true to get a very buggy texture applied
  translate(0,-16);
  creeper.Texture(16,16, 24,16);// sets texture cordinats
  creeper.Block(0,-20,0, 24,36,12);//body
  
  // head
  creeper.Texture(0,0, 32,16);
  creeper.Block(0,-12-36,0, 24,24,24);
  
  //legs
  creeper.Texture(0,16, 16,8);
  creeper.Block(6,6,12, 12,16,12);
  creeper.Block(-6,6,12, 12,16,12);
  creeper.Block(-6,6,-12, 12,16,12);
  creeper.Block(6,6,-12, 12,16,12);
  
  
  popMatrix();
}

