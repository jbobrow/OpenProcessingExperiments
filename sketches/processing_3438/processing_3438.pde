
void draw(){if(frameCount%700==1){background(255);for(int i=0;i<599;i++){fill(x(),x(),x());rect(x(),x(),9,9);}}filter(BLUR,1);if(frameCount%4==2)filter(POSTERIZE,4);}float x(){return random(255);}

