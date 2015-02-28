
float mH = -3;
float speed = 0.1;

void setup (){
 size (600,600);
 smooth();
 noStroke();
  
  
}

void draw (){
  
  background(127,177,198);
  
 mH += speed;
 
  if ((mH<-3) || (mH>3)){
    speed *= -1;
  }
   
  //body
  fill(255,109+mH,91);
  rect(100,150+mH,400,250);
   rect(50,200+mH,500,100);
   rect(150,150+mH,300,50);
   rect(150,400+mH,300,50);
   rect(200,450+mH,200,50);
   rect(250,500+mH,100,50);
   //green parts
   fill (99,192,125);
   rect(150,50+mH,100,50);
   rect(200,100+mH,200,50);
   rect(350,50+mH,100,50);
   //eyes and mouth
   fill(197,169,169);
    rect(150,200+mH,100,100);
    rect(350,200+mH,100,100);
    rect(250,400+mH,100,50);
    //random dots & shoes
    fill(86,86,86);
    rect(187,238+mH,50,50);
    rect(362,238+mH,50,50);
    rect(468,177+mH,18,18);
    rect(296,294+mH,18,18);
    rect(133,346+mH,18,18);
    rect(375,371+mH,18,18);
    rect(460,366+mH,18,18);
    rect(304,504+mH,18,18);
     rect(90,208+mH,18,18);
      rect(241,365+mH,18,18);
      rect(150,550,100,50);
      rect(350,550,100,50);
      //glare in eyes
   fill(197,169,169);
        rect(192,244+mH,18,18);
         rect(373,243+mH,18,18);
      //hands
      fill(191,145,36);
      noStroke();
       rect(39+(mH/3),368-(mH/3),50,100);
       rect(511-(mH/3),375-(mH/3),50,100);
       rect(24+(mH/3),368-(mH/3),15,30);
       rect(560-(mH/3),375-(mH/3),15,30);
      
      //strokes (small)
      
      for (int i=0; i<600; i+=10){
        stroke(255,30);
        line (i,0,i,height);
        line (0,i,width,i);
      }
      //strokes (big)
      for (int i=0; i<600; i+=50){
        stroke(100,120);
        line (i,0,i,height);
        line (0,i,width,i);
      }
      



}

