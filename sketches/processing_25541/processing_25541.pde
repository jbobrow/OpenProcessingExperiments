
class Creature {
  int faceX;
  int faceY;
  int mouthColor;  
  int speed;
  
  Creature () {
  faceX=int(random(0,width));
  faceY=int(random(0,height));
  mouthColor=int(random(0,255));
  speed=1;

} 

 void show () {
  //FEET
  fill(169,66,234);
  ellipse(faceX-40,faceY+160,80,60);
  ellipse(faceX+60,faceY+160,80,60);

  fill(145,232,220);

  //ARMS
  strokeWeight(30);
  stroke(169,66,234);
  line(faceX-300,faceY,faceX,faceY);
  line(faceX,faceY,faceX+300,faceY);

  strokeWeight(6);
  stroke(0);
  //BODY
  ellipse(faceX,faceY,300,300);
  fill(240,70,51);
  ellipse(faceX,faceY+20,40,30);
  fill(mouthColor);
  ellipse(faceX,faceY+80,100,70);

  //HAIR
  fill(85,59,46);
  ellipse(faceX-100,faceY-160,80,80);
  ellipse(faceX+100,faceY-160,80,80);
  fill(169,66,234);
  triangle(faceX-148,faceY-170,faceX-148,faceY-120,faceX-98,faceY-120);
  triangle(faceX-98,faceY-120,faceX-48,faceY-120,faceX-48,faceY-170);
  triangle(faceX+52,faceY-170,faceX+52,faceY-120,faceX+102,faceY-120);
  triangle(faceX+102,faceY-120,faceX+152,faceY-120,faceX+152,faceY-170);

  //EYES
  fill(0);
  ellipse(faceX-30,faceY-40,30,50);
  ellipse(faceX+30,faceY-40,30,40);
 }


void move(int s, int sTwo) {  
 faceX=faceX + speed;
 if ((faceX>width) || (faceX<0)){
 //faceX=0; --> activate and brings back to 0
 speed = speed*-(s); // bounces, starts reversing, also s, control individual speeds of each creature
 }
  faceY=faceY + speed;
 if ((faceY>height) || (faceY<0)){
   speed = speed*-(sTwo);
 }
}

void mouth(int w){
if (mousePressed){
  ellipse(faceX,faceY+80,w,80);//if mouse is pressed, change size of mouth depending on value of w
  }   
}

}


