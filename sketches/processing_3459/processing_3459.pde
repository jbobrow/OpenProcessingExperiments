
float n;void setup(){size(150,150,P3D);}void draw(){rotateX(.7);noStroke();for(int i=0;i<150;i++)for(int j=0;j<150;j++){fill(lerpColor(#7777FF,#FFFFFF,noise(i*.05,j*.05-n)));rect(i,j,2,2);}n+=.3;}


