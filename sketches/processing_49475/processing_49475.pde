
void setup (){
 size (600,600);
 smooth();
 noStroke();
  
  
}

void draw (){
  
  background(127,177,198);
  //body
  fill(255,109,91);
  rect(100,150,400,250);
   rect(50,200,500,100);
   rect(150,150,300,50);
   rect(150,400,300,50);
   rect(200,450,200,50);
   rect(250,500,100,50);
   //green parts
   fill (99,192,125);
   rect(150,50,100,50);
   rect(200,100,200,50);
   rect(350,50,100,50);
   //eyes and mouth
   fill(197,169,169);
    rect(150,200,100,100);
    rect(350,200,100,100);
    rect(250,400,100,50);
    //random dots & shoes
    fill(86,86,86);
    rect(187,238,50,50);
    rect(362,238,50,50);
    rect(468,177,18,18);
    rect(296,294,18,18);
    rect(133,346,18,18);
    rect(375,371,18,18);
    rect(460,366,18,18);
    rect(304,504,18,18);
     rect(90,208,18,18);
      rect(241,365,18,18);
      rect(150,550,100,50);
      rect(350,550,100,50);
      //glare in eyes
   fill(197,169,169);
        rect(192,244,18,18);
         rect(373,243,18,18);
      //hands
      fill(191,145,36);
      noStroke();
       rect(39,368,50,100);
       rect(511,375,50,100);
       rect(24,368,15,30);
       rect(560,375,15,30);
      
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

