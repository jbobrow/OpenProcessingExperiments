


int xx = 0;
int xxspeed = 5;
int direction = -1;

float color1=random(255);
float color2=random(255);
float color3=random(255);

void setup(){
  
size(640, 360); 
background(0); 
noStroke();
frameRate(10);
stroke(255, 255);

}

void draw(){
 
int xgridSize = 100;
int ygridSize = 50;

for (int x = xgridSize; x <= width - xgridSize; x += xgridSize) {
  for (int y = ygridSize; y <= height - ygridSize; y += ygridSize) {
    //noStroke();
    fill(color1, color2, color3);
    rect(x-1, y-1, 3, 3);
    //stroke(255, 255);
    strokeWeight(0.1);
    line(x, y, xx, height/2);
 }
}
stroke(color1, color2, color3);
xx+=xxspeed;

if(xx >= width || xx<=0){
  xxspeed*=direction;
  color1 = random(255);
  color2 = random(255);
  color3 = random(255);
  
  stroke(color1, color2, color3);
}
}

//void keyPressed(){
//  if(key=='r'){
//  color1++;
//}else if(key=='g'){
//  color2++;
//}else if(key=='b'){
//  color3++;
//}
//}
//



