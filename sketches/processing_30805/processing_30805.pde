
class Line{
  Particle d1,d2;
  int threshold;
  Line(){
  }
  void display(Particle inputD1,Particle inputD2,int inputThreshold){
    threshold = inputThreshold;
    if(dist(inputD1.location[0].x,inputD1.location[0].y,inputD2.location[0].x,inputD2.location[0].y)<threshold){
      strokeWeight(3-(dist(inputD1.location[0].x,inputD1.location[0].y,inputD2.location[0].x,inputD2.location[0].y)/threshold)*3);
      stroke(0,255-(dist(inputD1.location[0].x,inputD1.location[0].y,inputD2.location[0].x,inputD2.location[0].y)/threshold)*255);
      line(inputD1.location[0].x,inputD1.location[0].y,inputD2.location[0].x,inputD2.location[0].y);
    }
  }
}

