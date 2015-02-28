
void setup(){
size(800,400);
frameRate(30);
background(255);
}

void draw(){

if(keyPressed){
fill(255);
rect(0,0,800,400);
}
if(mousePressed){
float color1=random(0,255);
float color2=random(0,255);
float color3=random(0,255);
 
float opacity=random(150,200);

int centerX;
int centerY;

if(mouseX<=width/3){
centerX=width/6;
centerY=100;
}
else if(mouseX<(width/3)*2){
centerX=400;
centerY=300;
}
else{
centerX=(width/6)*5;
centerY=100;
}

fill(color1,color2,color3,opacity);
noStroke();
triangle(mouseX,mouseY,pmouseX,pmouseY,centerX,centerY);

triangle(map(mouseX,0,800,800,0),mouseY,map(pmouseX,0,800,800,0),pmouseY,map(centerX,0,800,800,0),centerY);

}


}
