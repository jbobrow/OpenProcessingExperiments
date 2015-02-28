
void setup(){
  size(400,400);
  background(255);
  noSmooth();
}

void draw(){
 for (int j=0;j<100;j+=30){
   for (int i=0;i<400;i+=1){
     strokeWeight(15);
     stroke(0,1);
     point(i,sin(radians(i%360))*50+100);
     
     strokeWeight(i%15);
     stroke(i%255);
     point((i+j)*0.8,cos(radians(i%360))*120+150);
     
     strokeWeight(3);
     stroke(0,1);
     point(i*j*0.01+20,tan(radians(i%360))*50+150);
     
     strokeWeight(2);
     stroke(100,1);
     line(0,i%40*10,i%40*10,400);
   }
 }
}
