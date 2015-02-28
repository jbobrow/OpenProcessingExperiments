
void setup(){
  size (1000,1000); 
  background(255,255,255);
}
  
  float r=random(0,225);
  float g=random(0,255);
  float b=random(0,255);
  float jitter;
  float angle; 
  
  
  
  void draw(){
    if(keyPressed){
      if(key=='1'){
    if(mousePressed&&mouseButton;==LEFT){ 
    brush1(mouseX, mouseY);}}}
    if(keyPressed){
      if(key=='2'){
    if(mousePressed&&mouseButton;==LEFT){
      brush2(mouseX,mouseY);}}}
    if(keyPressed){
      if(key=='3'){  
        if(mousePressed&&mouseButton;==LEFT){
      brush3(mouseX,mouseY);}}}
  }
  
   
  
      float prevx;
      float prevy;
      

  void brush1(float x, float y){
   stroke(0,0,0);
   strokeWeight(30);
   if(prevx!=0&&prevy;!=0){
   line(prevx,prevy,x,y);}
   prevx=x;
   prevy=y;
  }
 
 void brush2(float x, float y){
   noStroke();
  fill(255,247,0);
  if(prevx!=0&&prevy;!=0){  
 rect(prevx,prevy,50,50);
 fill(0,0,255);
 rect(prevx,prevy,25,25); 
 fill(255,0,0); 
 rect(prevx,prevy,15,15);
 fill(255,255,255); 
 rect(prevx,prevy,10,10); }
prevx=x;
prevy=y;}
      
      
     void brush3(float x, float y){
       stroke(0,0,0);
       background(0,0,0);
       if(prevx!=0&&prevy;!=0){
         fill(255,255,255);
       ellipse(prevx,prevy,150,150);
       ellipse(prevx+150,prevy+150,150,150);
       ellipse(prevx-150,prevy-150,150,150);
    prevx=x;
    prevy=y;
     }}


