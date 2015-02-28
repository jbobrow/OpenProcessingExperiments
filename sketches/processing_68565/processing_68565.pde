
import netscape.javascript.*;

int w = 500;
int h = 500;
int numSites = 100;
float radius = 1;
ArrayList sites = new ArrayList();
float[] radiusInc = new float[numSites];

void setup(){
  size(w, h);
  colorMode(RGB, 100);
  background(100);
  translate(w / 2, h / 2);
  
  
  CreateSites(numSites);
  SetRadiusInc(numSites);
}

void draw(){
  //background(0);
  translate(w / 2, h / 2);
  
  //DrawSites(numSites);
  DrawSiteGrowth(numSites);
}

void DrawSites(int n){
  stroke(100);
  for(int i=0; i<n; i+=1){    
    strokeWeight((random(radius, radius + 10) * radiusInc[i] + i) * 2);
    point(((PVector)sites.get(i)).x, ((PVector)sites.get(i)).y); 
  } 
}

void DrawSiteGrowth(int n){
  float perimeter = 2 * PI * radius;
  
  for(int i=0; i<n; i+=1){
    
    //println(i + " : " + radiusInc[i]);
    //stroke(((float)(i+1) / (float)n) * random(100.0), ((float)(i+1) / (float)n) * random(100.0), ((float)(i+1) / (float)n) * random(100.0), 50.0); //((float)(i+1) / (float)n) * random(10.0, 15.0)
    
    stroke(0, 0, 0, 1.0);
    strokeWeight(((float)(i+1) / (float)n) * random(1.0, 5.0));
    
    for(int j=0;j<perimeter; j+=1){      
      float theta = (((float)(j+1) / (float)perimeter) * 2 * PI);
      float randRadius = (random(radius, radius + 10) * radiusInc[i] + i);
      point(sin(theta) * randRadius + ((PVector)sites.get(i)).x, cos(theta) * randRadius + ((PVector)sites.get(i)).y); 
    }
  }
  radius += 1;

}

void CreateSites(int n){
  for(int i=0; i<n; i+=1){
    sites.add(new PVector(random(w / 4) - w / 8, random(h / 4) - w / 8)); 
  } 
}

void SetRadiusInc(int n){
  for(int i=0; i<n; i+=1){
    radiusInc[i] = random(radius) + 0.1;    
  } 
}

