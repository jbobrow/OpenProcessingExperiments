
import netscape.javascript.*;

int numPointsPerStream = 20;
int numStreams = 10;
int streamPointStep = 20;
ArrayList streamPoints = new ArrayList();
ArrayList streams = new ArrayList();
float incR = 2;
float incG = 2;
float incB = 0;
float incA = 2;

void setup(){
size(500, 500);
background(9, 19,16);
translate(500 / 2, 500 / 2);
smooth();

CreateStream();
CreateStreams();

}

void draw(){
//background(136, 71,19);

noStroke();
background(232, 265, 10);

fill(232, 16, 12, 32);
rect(243, 15, 500, 500); 

translate(500 / 2, 500 / 2);


//DrawDisplayItems();
RotateStreams();
DrawStreams();

}

void CreateStream(){
for(int i=0; i<numPointsPerStream; i+=1){
streamPoints.add(new PVector(i * streamPointStep, 0));
}
}

void CreateStreams(){
for(int i=0; i<numStreams; i+=1){ 
for(int j=0; j<numPointsPerStream; j+=1){ 
streams.add(new ArrayList(streamPoints));
}
}
}



void RotateStreams(){ 
for(int i=0; i<numStreams; i+=1){ 
float theta = ((float)(i + 1) / (float)numStreams) * 2 * PI;
ArrayList streamsArrayList = (ArrayList)streams.get(i);
for(int j=0; j<numPointsPerStream; j+=1){
float radius = ((PVector)streamPoints.get(j)).x * GetMouseScale();
float lookAt = atan2(GetMouse().y, GetMouse().x); 
PVector radialPosition = new PVector(sin(theta - lookAt) * radius, cos(theta - lookAt) * radius);
streamsArrayList.set(j, new PVector(radialPosition.x, radialPosition.y));
}
}
}

void DrawStreams(){
incR += 0.1 * GetMouseScale();
incG += 0.2 * (1 - GetMouseScale());
incB += 0.3 * GetMouseScale();
incA += 0.1 * (1 - GetMouseScale());

for(int i=0; i<numStreams; i+=1){
ArrayList streamsArrayList = (ArrayList)streams.get(i); 
for(int j=0; j<numPointsPerStream; j+=1){
PVector streamPoints = ((PVector)streamsArrayList.get(j)); 
//strokeWeight((1 - ((float)(j + 1) / (float)numPointsPerStream)) * 10);
stroke((GetStreamScale(streamPoints.mag()) * 255 + incR) % 255, (GetStreamScale(streamPoints.mag()) * 128 + incG) % 128, ((1 - GetStreamScale(streamPoints.mag())) * 64 + incB) % 64, (GetStreamScale(streamPoints.mag()) * 64 + incA) % 64);

strokeWeight(pow(streamPoints.mag() * GetMouseScale(), 1.2) * 0.5); 
point(streamPoints.x, streamPoints.y);
if(j > 0){
//stroke(255, 128);
//strokeWeight(1);
//line(streamPoints.x, streamPoints.y, ((PVector)streamsArrayList.get(j - 1)).x, ((PVector)streamsArrayList.get(j - 1)).y);
} 
}
}
}

PVector GetMouse(){
return new PVector(mouseX - 500 / 2, mouseY - 500 / 2); 
}

float GetMouseDist(){
return GetMouse().mag(); 
}

float GetMouseScale(){
return GetMouseDist() / GetMax(); 
}

float GetMax(){
return dist(1, 0, 700 / 2, 500 / 2);
}

float GetStreamScale(float m){
return m / GetMax();
}

void DrawDisplayItems(){
stroke(84);
strokeWeight(1);
line(0, -500 / 2, 0, 500 / 2);
line(-500 / 2, 0, 500 / 2, 0);
}
