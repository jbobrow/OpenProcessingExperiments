
float a = 0;
float b =0;


void setup(){
  
smooth();
size(800,600,P3D);
background(255);
frameRate(10);
}

void draw(){
  

noStroke();

int seconds = millis()/1000;


fill(frameCount%255,random(100));

translate(width/2, height/2);

rotateY(radians(-frameCount%360));



for(int i=0; i<360; i+=6){
pushMatrix();

translate(2*cos(60), 2*sin(60), 2*sin(60));

rotateX(PI*i/360);
rotateY(PI*i/360);
rotateZ(PI*i/360);
shearY(PI/4.0);


rect(a,b,random(90),random(30));
popMatrix();

}


a= random(0,400);
b= random(0,400);

println(frameCount);

}






