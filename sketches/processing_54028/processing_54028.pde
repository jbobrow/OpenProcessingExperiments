
float y1 = 50;
float y2 = 10;
float y3 = 80;
float y4 = 50;
float y5 = 10;
float y6 = 5;
float y7 = 10;

float speed1 = 1;
float speed2 = 1.5;
float speed3 = 2;

float radius1 = 20;
float radius2 = 5;
float radius3 = 15;
float radius4 = 20;
float radius5 = 5;
float radius6 = 15;
float radius7 = 10;

void setup(){
  
  size(250,250);
  noStroke();
  smooth();
  ellipseMode(RADIUS);
}

void draw(){

 // background
 fill(0,10);
 rect(0,0,width,height);

 // circle 1
 fill(random(250,255),200,0);  
 ellipse(20,y1,radius1,radius1);
 y1 += speed1;
   if (y1>height+radius1){
     y1 = - radius1;
   }
 
 //circle 2
 fill(random(250,255),0,200); 
 ellipse(60,y2,radius2,radius2);
 y2 += speed2;
   if (y2>height+radius2){
     y2 = - radius2;
   }

 //circle 3
 fill(random(250,255),200,0); 
  ellipse(90,y3,radius3,radius3);
   y3 += speed2;
   if (y3>height+radius3){
     y3 = - radius3;
   }

 //circle 4
 fill(random(250,255),200,0); 
 ellipse(180,y4,radius4,radius4);
  y4 += speed3;
   if (y4>height+radius4){
     y4 = - radius4;
   }

 //circle 5
 fill(random(250,255),0,200); 
 ellipse(210,y5,radius5,radius5);
  y5 += speed1;
   if (y5>height+radius5){
     y5 = - radius5;
   }

 //circle 6
 fill(random(250,255),200,0); 
 ellipse(240,y6,radius6,radius6);
  y6 += speed3;
   if (y6>height+radius6){
     y6 = - radius6;
   }
   
 //circle 7
 fill(random(250,255),0,200); 
 ellipse(120,y7,radius7,radius7);
  y7 += speed1;
   if (y7>height+radius7){
     y7 = - radius7;
   }

 
}

