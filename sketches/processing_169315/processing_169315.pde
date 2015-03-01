
void setup(){
  size(400,200);
  frameRate(2);
}

void draw(){
  background(0);
  int m=minute(),s=second(),h=hour(), Y=year(),M=month(),D=day();

  
  String Time = nf(h,2) + ":" + nf(m,2) + ":" + nf(s,2); 
  String Date = str(D) + "/" + str(M) + "/" + str(Y);
  
  
  textSize(60);
  fill(0,100,10);
  text(Time,width/2-120,height/2);
  text(Date,width/2-150,height/2+50);
   
}




