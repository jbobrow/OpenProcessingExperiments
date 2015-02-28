
float distance;
void setup(){
size(500,500);

}


void draw(){
  
for(int i=0;i<20;i++){
  fill(247,dist(mouseX,mouseY,0,0),106);
  rect(0,0,width, height);
}

 fill(247,62,106);
 distance=dist(mouseX,mouseY,width/2,height/2);
 noStroke();
 ellipse(width/2,height/2,distance,distance);
