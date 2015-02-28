
int numSquares = 8;
float [] squareX = new float[numSquares];
float [] squareY = new float[numSquares];

float r[]= new float[numSquares];
float g[]= new float[numSquares];
float b[]= new float[numSquares];

int [] sides = new int[numSquares];

int timeOff = 1000;
int timeOn = 2000;
int lastTime;
boolean colorOn = true;


void setup(){
  size(500,500);
  smooth();
  lastTime = millis();
  for(int i=0; i< numSquares; i++){
    stroke(255);
    strokeWeight(3);
    r[i]=random(255);
    g[i]=random(255);
    b[i]=random(255);
    
    sides[i] = 50;
    squareX[i] = round(random(sides[i], width-sides[i]));
    squareY[i] = round(random(sides[1], height-sides[i]));
    
    println("R" + r[i] + "G" + g[i] + "B" + b[i]);
  }
}

void draw(){
    background(212,159,219);
    for(int j=0; j< numSquares ; j++){
    rect(squareX[j], squareY[j], sides[j], sides[j]);
    fill(r[j],g[j],b[j]);
    
  if(colorOn == true){
     fill(212,159,219); 
     
  if(timeOn < millis() - lastTime){
      colorOn = false;
      lastTime = millis();
     }
    
   }else{
     if(timeOff < millis() - lastTime){
       colorOn = true;
       lastTime = millis();
       
     }
   }
  }
 }
 
 void mousePressed(){
     background(146,245,153);

}
    

