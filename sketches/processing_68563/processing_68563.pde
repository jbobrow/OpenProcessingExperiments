
import netscape.javascript.*;

int timeInc = 0;
int imgSaveInc = 0;
int w = 500;
int h = 500;
float scaleInit = 5.0;
float scaleMin = 0.1;
float scaleInc = 0.01;
float scaleNow = scaleInit;
int numSites = 1;
//float radius = 1;
ArrayList sites = new ArrayList();
ArrayList radius = new ArrayList();
ArrayList radiusInc = new ArrayList();
ArrayList offsetHue = new ArrayList();


void setup(){
  size(w, h);
  colorMode(HSB, 100);
  background(100);
  translate(w / 2, h / 2);
  //scale(scaleInit);
  
  CreateSites(numSites);
  CreateRadius(numSites);
  SetRadiusInc(numSites);
  SetHueOffset(numSites);
}

void draw(){
  //background(100);
  translate(w / 2, h / 2);
  
//  if(scaleNow > scaleMin){
//    scaleNow -= scaleInc;
//  }else{
//    scaleNow = scaleMin;
//  }
  //scale(scaleNow);
  
  timeInc += 1;
  if(timeInc % 50 == 1){
    int numSites = round(random(1, 4));
    CreateSites(numSites);
    CreateRadius(numSites);
    SetRadiusInc(numSites);
    SetHueOffset(numSites);
  }
 
  DrawSiteGrowth(sites.size());
  //DrawDisplayItems();
  
  if(timeInc % 100 == 1){
    imgSaveInc += 1;
    save("Growth_03_" + imgSaveInc + ".png");
  }
}

float inc = 0;
void DrawSiteGrowth(int n){
   
  for(int i=0; i<n; i+=1){
    float perimeter = 2 * PI * (Float)radius.get(i);
    float pointSizeRandom = (((float)(i+1) / (float)n) * random(1.0));
    strokeWeight(2);
    
    for(int j=0;j<perimeter; j+=1){ 
      float theta = (((float)(j+1) / (float)perimeter) * 2 * PI);
      float randRadius = (random((Float)radius.get(i), (Float)radius.get(i) + 10) * (Float)radiusInc.get(i) + i);
      PVector points = new PVector(sin(theta) * randRadius, cos(theta) * randRadius);
      PVector pointsNew = new PVector(points.x + ((PVector)sites.get(i)).x, points.y + ((PVector)sites.get(i)).y);
      
      if(pointsNew.x < w / 2 - 0 && pointsNew.x > -w / 2  + 0 && pointsNew.y < h / 2 - 0 && pointsNew.y > -h / 2  + 0){
        float md = dist(0, 0, w, h);
        float d = dist(0, 0, points.x, points.y);
        float h = (d / md) + (Float)offsetHue.get(i);
        float s = random(50, 100);
        float b = random(50, 100);
        float a = (d / md) * random(50, 75);
        stroke(h, s, b, a);
      
        point(pointsNew.x, pointsNew.y);         
      }     
    }
    radius.set(i, ((Float)radius.get(i)) + inc);
  }
  inc += 0.01;
  
  
}

void CreateSites(int n){
  for(int i=0; i<n; i+=1){
    sites.add(new PVector(random(w / 2) - w / 4, random(h / 2) - h / 4));  
  }
}

void CreateRadius(int n){
  for(int i=0; i<n; i+=1){
    radius.add(1.0);    
  } 
}

void SetRadiusInc(int n){
  for(int i=0; i<n; i+=1){
    radiusInc.add(random(1) + 0.5);    
  } 
}

void SetHueOffset(int n){
  for(int i=0; i<n; i+=1){
    offsetHue.add((random(n) * 100) % 100);  
  } 
}

void DrawDisplayItems(){
  stroke(64);
  strokeWeight(1);
  line(0, -w / 2, 0, h / 2);
  line(-w / 2, 0, h / 2, 0);
}

