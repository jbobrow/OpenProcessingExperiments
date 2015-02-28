
PImage firefly;
PImage bkg;
PImage firefly2;
float inc=0.0;
float x;
float y;
float r=50;


void setup(){
  size(800,400);
  background(#000231);
  smooth();
   noStroke();
   bkg = loadImage("fireflyBKG.png");
  firefly = loadImage("Firefly-Sketch.png");
  firefly2= loadImage("Firefly-Sketch2.png");

  
}



void draw(){
    background(#000231);
        image(bkg,0,0);
        pushMatrix();
         scale(.1);
        image(firefly2,1000,1000);
                image(firefly2,800,800);
                        image(firefly2,2000,2000);
                                image(firefly2,3000,3000);
                                        image(firefly2,2000,3000);

        popMatrix();
  
    
        

    //image(firefly,100,100);
  //  translate(x,y);
//scale(100);

 inc+=.0;
  float angle = sin(inc)/10.0+sin(inc*1.2)/10.0;
  pushMatrix();
  translate(300,600);
  for(int i = 10;i>0;i--){
    stroke((#000000),(#000000),(#000000));
    strokeWeight(i);
    line(0,0,0,-40);
    translate(0,-40);
    rotate(angle);
}
  popMatrix();
  
  
   pushMatrix();
  translate(320,600);
  for(int i = 15;i>0;i--){
    strokeWeight(i);
    line(0,0,0,-20);
    translate(0,-20);
    rotate(angle/1.2);
}
  popMatrix();
  
  
   pushMatrix();
  translate(220,600);
  for(int i = 9;i>0;i--){
    strokeWeight(i);
    line(0,0,0,-30);
    translate(0,-30);
    rotate(angle);
}
  popMatrix();
  grass(700,500,10,0.01);
    grass(600,500,11,0.02);
      grass(500,500,12,0.02);
        grass(800,500,13,0.02);
        
          grass(710,500,10,0.01);
    grass(610,500,11,0.02);
      grass(510,500,12,0.02);
        grass(790,500,13,0.02);
         
          grass(720,500,10,0.01);
    grass(620,500,11,0.02);
      grass(520,500,12,0.02);
        grass(780,500,13,0.02);
        
                  grass(730,500,10,0.01);
    grass(630,500,11,0.02);
      grass(530,500,12,0.02);
        grass(770,500,13,0.02);
         
          grass(740,500,10,0.01);
    grass(640,500,11,0.02);
      grass(540,500,12,0.02);
        grass(760,500,13,0.02);
        
                  grass(750,500,10,0.01);
    grass(650,500,11,0.02);
      grass(550,500,12,0.02);
        grass(750,500,13,0.02);
         
          grass(10,500,10,0.01);
    grass(20,500,11,0.02);
      grass(30,500,12,0.02);
        grass(40,500,13,0.02);
 
     grass(50,500,10,0.01);
    grass(60,500,11,0.02);
      grass(70,500,12,0.02);
        grass(80,500,13,0.02);
        
     grass(90,500,10,0.01);
    grass(100,500,11,0.02);
      grass(120,500,12,0.02);
        grass(130,500,13,0.02);
        
        grass(140,500,10,0.01);
    grass(150,500,11,0.02);
      grass(160,500,12,0.02);
        grass(170,500,13,0.02);
        
             grass(180,500,10,0.01);
    grass(190,500,11,0.02);
      grass(200,500,12,0.02);
        grass(210,500,13,0.02);
        
           grass(220,500,10,0.01);
    grass(230,500,11,0.02);
      grass(240,500,12,0.02);
        grass(250,500,13,0.02);
        
             grass(260,500,10,0.01);
    grass(270,500,11,0.02);
      grass(280,500,12,0.02);
        grass(290,500,13,0.02);
        
             grass(300,500,10,0.01);
    grass(310,500,11,0.02);
      grass(320,500,12,0.02);
        grass(330,500,13,0.02);
        
           grass(340,500,10,0.01);
    grass(350,500,11,0.02);
      grass(360,500,12,0.02);
        grass(370,500,13,0.02);
        
           grass(380,500,10,0.01);
    grass(390,500,11,0.02);
      grass(400,500,12,0.02);
        grass(410,500,13,0.02);
        
           grass(420,500,10,0.01);
    grass(430,500,11,0.02);
      grass(440,500,12,0.02);
        grass(450,500,13,0.02);
        
            grass(460,500,10,0.01);
    grass(470,500,11,0.02);
      grass(480,500,12,0.02);
        grass(490,500,13,0.02);
        
            grass(500,500,10,0.01);
    grass(510,500,11,0.02);
      grass(520,500,12,0.02);
        grass(530,500,13,0.02);
        
             grass(540,500,10,0.01);
    grass(550,500,11,0.02);
      grass(560,500,12,0.02);
        grass(570,500,13,0.02);
        
             grass(580,500,10,0.01);
    grass(590,500,11,0.02);
      grass(600,500,12,0.02);
        grass(610,500,13,0.02);
        
             grass(620,500,10,0.01);
    grass(630,500,11,0.02);
      grass(640,500,12,0.02);
        grass(650,500,13,0.02);
        
             grass(660,500,10,0.01);
    grass(670,500,11,0.02);
      grass(680,500,12,0.02);
        grass(690,500,13,0.02);
        
             grass(700,500,10,0.01);
    grass(710,500,11,0.02);
      grass(720,500,12,0.02);
        grass(730,500,13,0.02);
   
   
   
   
   
   
  

}

  void grass(int x, int y,int segmentLength, float Increment){
 inc+=.001;
  float angle =sin(inc)/50.0+sin(inc*0.5)/10.0;
  pushMatrix();
 translate(x,y);
 for(int i=20;i>0;i--){
   strokeWeight(i);
   line(0,0,0,-segmentLength);
   translate(0,-segmentLength);
   rotate(angle);
 }
 popMatrix();
 
 
  } 
 

  


