
int numPoints = 48;
int rand = 160;
float speed = 0.005;
float posY;

float tictac = 0.0045;
float x, y, radius = 160;

PVector[] points;
PFont font;

void setup(){
  size (900,900);
  background (33,33,33);
  smooth();
  

    
  float angle = TWO_PI /numPoints*2;
  points = new PVector[numPoints+1];
  
  for (int i=0; i < numPoints/1; i++){
    x = cos(angle * i) * radius + height/2;
    y = sin(angle * i) * radius + width/2;
    
    points[i] = new PVector(x,y);
  }
  
  for (int i=numPoints/2; i < numPoints; i++){
    x = random(rand, height-rand);
    y = random(rand, width-rand);
    
    points[i] = new PVector(x,y);
  }
}

void draw(){
  background (33,33,33);
  
  
  noFill();
  stroke (255,10);
  strokeWeight(1);
  line (0, height, width, 0);
  
  noStroke();
  fill(33,33,33);
  ellipse (height/2, width/2, radius*2, radius*2);
  
  noFill();
  strokeWeight(0.5);
  stroke (200);
  
  //_________________________TEXT POSiTiON
  posY = 26; 
  
  for (int i=numPoints/2; i < numPoints; i++){
    float dst = dist (points[i].x, points[i].y, height/2, width/2);
    
    if (dst > radius){
      
      strokeWeight(1);
      
      stroke (80, 120-dst/6);
      arc(height/2, width/2, dst*2, dst*2, 0.75*PI, 3.5*PI/2);

      stroke (10, 120-dst/6);
      arc(height/2, width/2, dst*2, dst*2, -(PI/4) , 0.75*PI);
      
      strokeWeight(1);
      fill(60);
      text (points[i].x + " ; " +points[i].y, 20, posY);
      posY += 11;
      noFill();
    }  
  }
  
        
  for (int i=0; i < numPoints; i++){
    for (int j=0; j < numPoints; j++){
      float dst = dist(points[i].x, points[i].y, points[j].x, points[j].y);
       
      if (dst < 200){
        stroke (140, 200-dst);
        if (i >= numPoints/2) stroke (100,200-50-dst);
        line (points[i].x, points[i].y, points[j].x, points[j].y);
        ellipse (points[i].x, points[i].y, 2,2);
      }
    }
  }
  
    
  for (int i=numPoints/2; i < numPoints; i++){
    float dst = (dist(points[i].x, points[i].y, width/2, height/2))/1500;
   speed = dst /20;
   
    x = (points[i].x - height/2) * cos(tictac+speed) - (points[i].y - width/2) * sin(tictac+speed) + height/2;
    y = (points[i].x - height/2) * sin(tictac+speed) + (points[i].y - width/2) * cos(tictac+speed) + width/2;
       
    points[i] = new PVector(x,y);
 }
 tictac += 0.000001; 
}
