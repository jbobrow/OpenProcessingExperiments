
import netscape.javascript.*;

int num = 1000;
int stageWidth = 500;
int stageHeight = 500;
int stageScale = 10;
ArrayList points = new ArrayList();

float scaleInc = 2;
float scaleMin = 0.1;
int radius = 20;
float connectRadius = 20;
float connectRadiusMax = dist(0, 0, stageWidth, stageHeight) * 1;
int imgSaveInc = 0;
int timeInc = 0;

void setup(){
  size(stageWidth, stageHeight);
  background(0);
  smooth();
  translate(stageWidth / 2, stageHeight / 2);
  scale(scaleInc);
    
  CreatePoints(num);
}

void draw(){
  
  background(0);
  
  translate(stageWidth / 2, stageHeight / 2);
  if(scaleInc > scaleMin){
    scaleInc -= 0.001;
  }
  scale(scaleInc);
  
  if(connectRadius < connectRadiusMax){
    connectRadius += 0.1;
    connectRadius = pow(connectRadius, 1.0001);
  }
  
  
  
  //nInc += 0.01;
  for(int i=0; i< num; i+=1){
    //points.set(i, new PVector(((PVector)points.get(i)).x + noise(nInc + random(stageWidth)), ((PVector)points.get(i)).y + noise(nInc + random(stageHeight))));

    stroke(255, 128);
    strokeWeight(radius); 
    point(((PVector)points.get(i)).x, ((PVector)points.get(i)).y);
    
//    stroke(255, 128, 128, 64);
//    strokeWeight(connectRadius); 
//    point(((PVector)points.get(i)).x, ((PVector)points.get(i)).y);
    
    for(int j=0; j< num; j+=1){
      if(i != j){
        if(((PVector)points.get(i)).dist((PVector)points.get(j)) < connectRadius){
          
          stroke(255, 128);
          strokeWeight(1);
          line(((PVector)points.get(i)).x, ((PVector)points.get(i)).y, ((PVector)points.get(j)).x, ((PVector)points.get(j)).y);
        }   
      }
    }
  }
  
  timeInc += 1;
  if(timeInc % 500 == 1 && connectRadius < connectRadiusMax){
    imgSaveInc += 1;
    save("Network_Time" + imgSaveInc + ".png");
  }
  //println(timeInc + " : " + imgSaveInc);
}

void CreatePoints(int n){
  
  if(points.size() > 0){
    points.clear();
    CreatePoints((int)random(100, 1000));
  }else{
    for(int i=0; i< n; i+=1){
      points.add(new PVector(random(stageWidth * stageScale) - (stageWidth * stageScale / 2), random(stageHeight * stageScale) - (stageHeight * stageScale / 2)));    
    } 
  }
  num = points.size();
}

void mousePressed(){
  if (mouseButton == LEFT) {
    CreatePoints((int)random(100, 1000));
  } 
  
  if (mouseButton == RIGHT) {
    imgSaveInc += 1;
    save("Network_Time" + imgSaveInc + ".png");
  } 
}

