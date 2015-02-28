
void setup(){
size(360,200);
}

void draw(){
background(0);
noStroke();
for(int x=0; x<=200; x=x+80){
 float y=sin(radians(x+frameCount))*0.7*100+40;
 fill(HSB, random(100,150),250,200);
 ellipse(x+100,100,y,y);
}
}
                
