

int faceX=400;
int faceY=400;

void setup () {
  size(800,800);
  background(245,200,211);
}

void draw () {
  smooth();
  strokeWeight(6);
  
  int r=0;
  int g=0;
  int b=0;
  r=int(random(255));
  g=int(random(255));
  b=int(random(255));

  background(245,200,211);
  faceX=mouseX;
  faceY=mouseY;

  //FEET
  if (keyPressed){
    fill(r,g,b); //if true turns random colours, variables declared for colours
}
  else{
   fill(169,66,234); //if false i.e. key not pressed, shoe turns purple 
}

  ellipse(faceX-40,faceY+160,80,60);
  ellipse(faceX+60,faceY+160,80,60);

  //ARMS
  strokeWeight(30);
  stroke(169,66,234);
  line(faceX-300,faceY,faceX,faceY);
  line(faceX,faceY,faceX+300,faceY);
  strokeWeight(6);
  stroke(0);
  
  //BODY
  fill(145,232,220);
  if (faceX<width/3) { //if less than a third x axis, green
  fill(145,232,220);
  }
  else if(faceX>width/3*2){ //if in the last third, grey 
  fill(123);
  } else { //otherwise; does not fulfill either conditions, purple
  fill(232,135,244);
  }
  ellipse(faceX,faceY,300,300);
  fill(240,70,51);
  ellipse(faceX,faceY+20,40,30);
  fill(0);
  if ((mousePressed) || (mouseX<400)){
  ellipse(faceX,faceY+80,200,80);//if mouse is pressed OR less than 400 on xaxis mouth gets bigger
  }
  else{
  ellipse(faceX,faceY+80,10,10);//otherwise small mouth 
  }   

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


