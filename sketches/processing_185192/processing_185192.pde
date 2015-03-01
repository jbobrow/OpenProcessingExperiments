
void setup(){
  size(300,350);
  smooth();
  noStroke();
cursor(CROSS);}
  
  void draw(){
    fill(255,0,0,100);
    rect(0,0,60,height);
    fill(255,165,0,110);
    rect(50,0,60,height);
    fill(255,255,0,120);
    rect(100,0,60,height);
    fill(0,128,0,130);
    rect(150,0,60,height);
    fill(0,0,255,140);
    rect(200,0,60,height);
    fill(159,0,255,150);
    rect(250,0,60,height); 
    
    if(mouseX<=50){
      option1();}
      if(mouseX>50 &&mouseX<=100){
        option2();}
        if(mouseX>100 &&mouseX<=150){
        option3();}
        if(mouseX>150 &&mouseX<=200){
        option4();}
        if(mouseX>200 &&mouseX<=250){
        option5();}
        if(mouseX>250 &&mouseX<=300){
        option6();}
  }
  
  
  void option1(){
    fill(0,128,0,130);
    rectMode(CENTER);
    rect(mouseX,mouseY,30,(abs(175-mouseY)*second()/2));
    rectMode(CORNER);
  } 
    void option2(){
      pushMatrix();
      fill(159,0,255,150);
      translate(mouseX,mouseY);
      ellipse(0,0,30,abs(2*mouseY-350));
      popMatrix();
  } 
   void option3(){
    
   pushMatrix();
  translate((mouseX+pmouseX)/2,pmouseY);
  rotate(radians(millis()/3));
  noStroke();
 fill(0,0,255,mouseX);
 ellipse((mouseY+35)%49,(mouseX+53)%8,15,15);
popMatrix();

     
  } 
   void option4(){
     if(mouseY<=175){
       fill(255,0,0);
        triangle(150,0,200,0,175,mouseY-10);}
        else{fill(255,0,0);
        triangle(150,350,200,350,175,mouseY+10);}

  } 
   void option5(){
     for(int x=200; x<=250;x+=2) {
    for(int y=0;y<350; y=y+35){
       
      float a=random(255);
      float b=random(50);
      float c=random(45);
      float d=random(255);
       
      fill(255,255,c,d);
      rect(x,y,3,6);
    }}
  } 
   void option6(){
     if(mousePressed==false){
     fill(255,165,0);
     ellipse(275,175,40,40);}
     else{
       
       for(int x=0; x<=600;x+=50) {
    for(int y=0;y<600; y=y+50){
       
      float z=random(255);
     
       
      fill(255,165,z,150);
      rect(250,0,60,height);
       fill(0);
     ellipse(275,175,40,40);}
    }}}

  
