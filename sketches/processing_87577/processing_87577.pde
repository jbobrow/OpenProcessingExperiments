
//Spider colors (c1= antennas, c2=body and head, c3=eyes, c5=legs, c6=eye dots, c7=mouth

color s_c1= color(0);

color s_c2= color(mouseX,mouseY,69);

color s_c3= color(139,0,0);

color s_c5= color(102,51,0);

color s_c6= color(0);

color s_c7= color(85,83,44);

color s_c8= color(174,0,22);

color s_c9= color(155,196,146);

int mouseColorX = 100;
int mouseColorY = 100;

//spider's local origin
float localX=400;

float localY=400;
float xVelocity = 10; //velocity x
float yVelocity = 0; //velocity y
float acceleration = -0.5;// 0.1; // acceleration

//spider class
spider spiderMsn, spiderBab, spiderShoe;
  
void setup(){

  size (800,800);



  spiderMsn = new spider(0,0);
  spiderBab = new spider(0,0);
  spiderShoe=new spider(0,0);


}

boolean bDisplayCreature = true;

void keyTyped() {
  if (key == 'v') {
    bDisplayCreature = !bDisplayCreature;
    }
    
  if (key == 'a') {
    spiderMsn.bchangeeyecolor=true;
  }    
  
  if (key=='k') {
    spiderBab.bchangelegscolor=true;
  }
  
  if (key=='m') {
    spiderShoe.bchangemouthcolor=true;
  }
  
  if (key=='t') {
    spiderMsn.bchangeantennaecolor=true;
  }
  if (key=='b') {
   spiderBab.bchangebodycolor=true; 
  }
}
    
void draw(){

background(255);

noStroke();

rectMode(CENTER);

//Move origin point

  if(mousePressed && (mouseButton==LEFT) ) {
    localX=mouseX;
    localY=mouseY;
  
  }
  
  if(bDisplayCreature == true){
    
//debug
    println("xVelocity: " + xVelocity + " yVelocity: " + yVelocity + " acceleration: " + acceleration);


//add speed
    localY = localY + yVelocity;
    localX = localX + xVelocity;

//acceleration for "gravity"
//yVelocity = yVelocity + acceleration;
    xVelocity = xVelocity + acceleration;

// bounce 
    if ((localY > height-20) || (localY<0)){
      yVelocity = yVelocity * -0.95;
  } 
    if ((localX > width -80) || (localX < 0)) {
    xVelocity = xVelocity * -0.95;
  }

}    
    

    
    spiderMsn.draw_spider(int(localX), int(localY));
    spiderBab.draw_spider(int(localX) +250, int (localY) + 250);
    spiderShoe.draw_spider(int(localX) - 100, int (localY) + 200);
    
    
    //for(int i=-1;  i<2; i++){
      
      
    //spiderMsn.draw_spider(int(localX + (200 * i)), int(localY));
    //}
  }












