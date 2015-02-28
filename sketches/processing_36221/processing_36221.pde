
int maxDots = 2000;
float [] xPos = new float [maxDots];
float [] yPos = new float [maxDots];
int dotDiameter = 1;
//int index = 0;

void setup(){
  size(700,400);
  background (0);
  noStroke();
frameRate(10);  
//create();
}

void draw(){
erase();
create();


}



void create (){
  //frameRate(1);
  for (int i = 0; i < maxDots; i++){
    xPos[i] = random(0, width);
    yPos[i] = random (0,height);  
    
      float colour = random (3);
      if (colour <= 1){
       fill(255,0,0); 
      }
      else if (colour >1 && colour <=2){
      fill(0,255,0);
      }
      else if (colour > 2 && colour <=3){
       fill(0,0,255); 
      }
ellipse(xPos[i],yPos[i], dotDiameter, dotDiameter);

//index++;
}
}

void erase(){
  
  for (int j = 0; j < maxDots; j++){
    fill(0);
    ellipse(xPos[j], yPos[j], dotDiameter, dotDiameter);
    
    //index++;
  }
}

void mousePressed() {
  noLoop();
}

void mouseReleased() {
 
   loop();
}

