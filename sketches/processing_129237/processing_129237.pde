
//Nicolette Hashey
//1/20/2014
//Moving Smiley Face
//Assignment 2

float mx1;
float my1;
float mx2;
float my2;
float easing = .05;
float esize = 15;
float mx;
float my;


void setup(){
 size(500,500);
}

void draw(){
  background(0);
  if (abs(mouseX-mx)>0.1) {
    mx=mx+(mouseX-mx)*easing;
  }
  float distance = esize * 2;
  
  float mx1 = constrain(mx, 208, 212);
  float my1 = constrain(my, 210, 250);
  float mx2 = constrain(mx, 288, 292);
  float my2 = constrain(my, 210, 250);
  noStroke();
    fill(#FFcccc);
  //top ellipse
  ellipse(250,200,185,150);
  //bottom ellipse
  ellipse(250,250,175,175);
  //left ear
  ellipse(160,225,25,50);
  //right ear
  ellipse(340,225,25,50);
   
    fill(255);
  //left white of eye
  ellipse(210,210,30,30);
  //right white of eye
  ellipse(290,210,30,30);
    
  fill(#6699FF);
  //left iris
  ellipse(mx1, my1, 25, 25);
  //right iris
  ellipse(mx2, my2, 25, 25);

  fill(0);
  //left pupil
  ellipse(mx1, my1, 15, 15);
  //right pupil
  ellipse(mx2, my2, 15, 15);

  fill(255);
  //left white shine
  ellipse(mx1+5, my1-5, 5, 5);
  //rigth white shine
  ellipse(mx2+5, my2-5, 5, 5);
  
  //Neutral Mouth
  stroke(0);
  strokeWeight(3);
  fill(0);
  line(200,290,300,290);
  
  //Draw Nose
  stroke(0);
  strokeWeight(2);
  fill(0);
  line(250,225,235,260);
  line(235,260,250,260);
  
    //neutral
  //if(keyPressed){
    //if(keyCode==RIGHT){
    //stroke(0);
   // strokeWeight(3);
    //fill(0);
    //line(200,275,300,275);
    //}
  //}
  
  //smile
  if(keyPressed){
      if(keyCode==UP){
        fill(#FFcccc);
        stroke(#FFcccc);
        strokeWeight(5);
        line(200,290,300,290);
        fill(0);
        strokeWeight(0);
        stroke(0);
        arc(250,275,100,75,0,PI);
}
  }

  if(keyPressed){
    if(keyCode==DOWN){
      fill(#FFcccc);
      stroke(#FFcccc);
      strokeWeight(5);
      line(200,290,300,290);
      fill(0);
      strokeWeight(0);
      stroke(0);
      arc(250,310,100,75,PI,TWO_PI);
    }
  }
  
  if(mousePressed && keyPressed){
    if(key=='m'|| key=='M'){
      if(mouseX>500){
        mouseX=500;
      }
      if(mouseX<0){
        mouseX=0;
      }
      if(mouseY>500){
        mouseY=500;
      }
      if(mouseY<0){
        mouseY=0;
      }
      noStroke();
       background(0);
      fill(#FFcccc);
      //top ellipse
      ellipse(mouseX,mouseY-50,185,150);
      //bottom ellipse
      ellipse(mouseX,mouseY,175,175);
      //left ear
      ellipse(mouseX-90,mouseY-25,25,50);
      //right ear
      ellipse(mouseX+90,mouseY-25,25,50);
        
        fill(255);
      //left white of eye
      ellipse(mouseX-40,mouseY-40,30,30);
      //right white of eye
      ellipse(mouseX+40,mouseY-40,30,30);
        
        fill(#6699FF);
      //left iris
      ellipse(mouseX-40,mouseY-40,25,25);
      //right iris
      ellipse(mouseX+40,mouseY-40,25,25);
      
        fill(0);
      //left pupil
      ellipse(mouseX-40,mouseY-40,15,15);
      //right pupil
      ellipse(mouseX+40,mouseY-40,15,15);
        
        fill(255);
      //left white shine
      ellipse(mouseX-35,mouseY-45,5,5);
      //right white shine
      ellipse(mouseX+45,mouseY-45,5,5);
      
      //Neutral Mouth
      stroke(0);
      strokeWeight(3);
      fill(0);
      line(mouseX-50,mouseY+40,mouseX+50,mouseY+40);
    
      //Nose
      stroke(0);
      strokeWeight(2);
      fill(0);
      line(mouseX,mouseY-25,mouseX-15,mouseY+10);
      line(mouseX-15,mouseY+10,mouseX,mouseY+10);
     
     
     //smile
      if(keyPressed){
          if(keyCode==UP){
            fill(#FFcccc);
            stroke(#FFcccc);
            line(mouseX-50,mouseY+40,mouseX+50,mouseY+40);
            fill(0);
            stroke(0);
            arc(mouseX,mouseY+25,100,75,0,PI);
    }
      }
      
      if(keyPressed){
        if(keyCode==DOWN){
        fill(0);
        stroke(0);
        arc(mouseX,mouseY+60,100,75,PI,TWO_PI);
        }
      }
    }
  }
}
    



