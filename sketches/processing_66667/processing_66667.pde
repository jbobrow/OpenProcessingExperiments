
int currentTime;
int startTime;
int intervalTime;
int circles;
PFont f;

void setup(){
  size(300,300);
  startTime = millis();
  intervalTime = 250 ;
  circles = currentTime/250;
  f=loadFont("MesquiteStd-48.vlw");
  textFont(f,40);
}
void draw() {
  currentTime= millis();
  if(currentTime - startTime >= intervalTime){
    fill(random(255),random(255),random(255),40);
    ellipse(random(width), random(height),random(40,80),random(40,80));
    fill(255); 
    text(currentTime/250,random(20,280),random(20,280));
    
    startTime = millis();
  }
  if(currentTime >=10000){
    fill(255,0,0);
    text("OMG", width/2,height/2);}
    
    if(currentTime >=15000){
  text("THEY'RE EVERYWHERE!!!",width/4,height*.75);}
  }




