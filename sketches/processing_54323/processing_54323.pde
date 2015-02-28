
//furniture

void setup(){
  size(800,200);
  smooth();
  noLoop();
  
}



void draw(){
  background(204);
  
    for (int i = 35; i<width +40; i +=50){
    int gray = int(random(0,102));
    
    float scalar = random(0.15, 1.0);
    
     
     
    
    furniture(i, 110, gray, scalar);
  
    
     }
  
    }
  
  



void furniture(int x, int y, int g, float s){
  
  pushMatrix();
  translate (x,y/2);
  scale(s);
  fill(g);//set gray
  
  

  strokeWeight(0.25);
  
  arc(61, 86, 60, 60, PI, TWO_PI);
  
  fill(105,60,60);
  rect(37,125,5,20);
  
  rect(37+50,151,5,20);
  
  
  rect(40,151,5,40);
  
  rect(44+50,151,5,40);
  
  fill(197,193,87);
  quad(30,86,91,86,85,115,38,115);
  
  fill(205,67,25);
  quad(38,124, 85,124, 99,150, 40,150);
  
 
  
  
  
  
  popMatrix();
  
  
  
}

