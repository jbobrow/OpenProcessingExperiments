
void setup(){
size(400,400);
frameRate(2);
}
 
 
void draw(){
background(0);
int m=minute()
,s=second()
,h=hour()
,Y=year()
,M=month()
,D=day();


String s0 = str((s));
if (s0.length() == 1){
  s0 = "0" + s0;
};
String m0 = str((m));
if (m0.length() == 1){
  m0 = "0" + m0;
};
String h0 = str((h));
if (h0.length() == 1){
  h0 = "0" + h0;
};
String M0 = str((M));
if (M0.length() == 1){
  M0 = "0" + M0;
};
String D0 = str((D));
if (D0.length() == 1){
  D0 = "0" + D0;
};

String Time = (h) + ":" + (m0) + ":" + s0;
String Date = (D) + "/" + (M) + "/" + str(Y);
 
 
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


