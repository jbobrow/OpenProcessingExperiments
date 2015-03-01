
void setup(){
size(400,400);
frameRate(2);
}
 
 
void draw(){
background(0);
int m=minute(),s=second(),h=hour(), Y=year(),M=month(),D=day();
String Time = str(h) + ":" + str(m) + ":" + str(s);
String Date = str(D) + "/" + str(M) + "/" + str(Y);
 
 
textSize(60);
fill(255);
text(Time,width/2-130,height/4);
text(Date,width/2-180,height/4+50);
    
    if (s==0){
      chime();
    };
    
    
  
};
 void chime() {
   fill(255);
   strokeWeight(1);
   ellipse(width/2-25, height/2+50, 25,25);
   ellipse(width/2+25, height/2+50, 25,25);
   fill(0);
   ellipse(width/2-27.5, height/2+50, 10,10);
   ellipse(width/2+27.5, height/2+50, 10,10);
   noFill();
   stroke(255);
   strokeWeight(6);
   bezier(width/2-50, height/2+100,width/2-25, height/2+150, 
   width/2+25, height/2+150, width/2+50, height/2+100);
 
 };


