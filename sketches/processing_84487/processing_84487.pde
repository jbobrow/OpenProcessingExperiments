
void setup(){
 size(500, 500);
 background(255);
 smooth();

}

void draw(){
  translate(50,50);
  noStroke();
  fill(160,150,240,10);
  for (int posX=0; posX<width; posX=posX+100){
    for (int posY1=0; posY1<height; posY1=posY1+100){
      for (int posY2=30; posY2<height; posY2=posY2+100){
        ellipse(posX,posY1,30,30);
        ellipse(posX,posY2,40,40);
      }
    }
  }
  //les yeux
  strokeWeight(3);
  stroke(0);
   for (int posX1=-6; posX1<width; posX1=posX1+100){
      for (int posY1=-4; posY1<height; posY1=posY1+100){
        for (int posX2=6; posX2<width; posX2=posX2+100){
        point(posX1,posY1);
        point(posX2,posY1);
        }
      }
   }
   //la bouche
  strokeWeight(2);
  for (int posX=0; posX<width; posX=posX+100){
     for (int posY=-2; posY<height; posY=posY+100){
        curve(posX,posY,posX-6,posY+7,posX+6,posY+7,posX,posY);
      }
   }

 // les jambes
 for (int posX=-27; posX<width; posX=posX+100){
   for (int posY=15; posY<height; posY=posY+100){
  line(posX,posY,posX+12,posY+10);
  line(posX+54,posY,posX+39,posY+10);
   }
 }
//snow
translate(200,200);
  stroke(220,130,145,10);
  for (int i=0;i<360;i+=10){
   rotate(radians(30));
   for (int posX=-40; posX<width; posX=posX+100){
     for (int posY=0; posY<height; posY=posY+100){
     line(posX,posY,posX+8,posY);
     line(posX+2,posY-3,posX+6,posY+3);
     line(posX+2,posY+3,posX+6,posY-3);
     
    }
   }
   }
  
   

}


