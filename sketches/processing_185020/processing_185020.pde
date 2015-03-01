
void setup(){
  size(1000,400);
  noStroke();
  background(250,240,230);
}

void draw(){
  backGround();
    man();
  infant();
}

void infant(){
  if(mouseX<500){
    strokeWeight(4);
    //ear
    fill(252,230,201);
    ellipse(mouseX-160,190,100,100);
    ellipse(mouseX+160,190,100,100);
    //face
    fill(255,239,213);
    ellipse(mouseX,200,350,350);
    //eyes
    fill(0);
    ellipse(mouseX-20,150,30,30);
    ellipse(mouseX+20,150,30,30);
       //hair
    line(mouseX,10,mouseX,50);
    line(mouseX-40,12,mouseX-40,50);
    line(mouseX+40,12,mouseX+40,50);
    //mouth
    fill(0);
    arc(mouseX,200,300,300,0,PI);
  }
}

void man(){
  if((mouseX>=500)&&(mouseX<1000)){
    //face
    fill(255,239,213);
    ellipse(mouseX,200,350,350);
    //hair
    fill(0);
    triangle(mouseX-175,250,mouseX-185,230,mouseX-165,220);
    triangle(mouseX-175,240,mouseX-185,220,mouseX-165,200);
    triangle(mouseX-175,230,mouseX-185,210,mouseX-165,190);
    triangle(mouseX-175,220,mouseX-185,200,mouseX-165,180);
    triangle(mouseX-175,210,mouseX-185,200,mouseX-165,170);
    triangle(mouseX-175,200,mouseX-185,190,mouseX-165,180);
    triangle(mouseX-175,190,mouseX-185,180,mouseX-165,170);
    triangle(mouseX-175,180,mouseX-185,170,mouseX-165,160);
    triangle(mouseX-175,170,mouseX-185,160,mouseX-165,150);
    triangle(mouseX-175,160,mouseX-185,150,mouseX-165,140);
    triangle(mouseX-175,150,mouseX-185,140,mouseX-165,130);
    triangle(mouseX+170,250,mouseX+160,230,mouseX+180,220);
    triangle(mouseX+170,240,mouseX+160,220,mouseX+180,210);
    triangle(mouseX+170,230,mouseX+160,210,mouseX+180,200);
    triangle(mouseX+170,220,mouseX+160,200,mouseX+180,190);
    triangle(mouseX+170,210,mouseX+160,200,mouseX+180,190);
    triangle(mouseX+170,200,mouseX+160,190,mouseX+180,180);
    triangle(mouseX+170,190,mouseX+160,180,mouseX+180,170);
    triangle(mouseX+170,180,mouseX+160,170,mouseX+180,160);
    triangle(mouseX+170,170,mouseX+160,160,mouseX+180,150);
    triangle(mouseX+170,160,mouseX+160,150,mouseX+180,140);
    triangle(mouseX+170,150,mouseX+160,140,mouseX+180,130);
    //eyes
    fill(0);
    ellipse(mouseX-80,150,80,80);
    ellipse(mouseX+80,150,80,80);
    rect(mouseX-50,150,160,10);
    rect(mouseX-190,145,140,10);
    rect(mouseX+90,145,90,10);
    
    //mouth
    fill(255,106,106);
    ellipse(mouseX,330,100,50);
    //beard
     fill(0);
    rect(mouseX-70,270,10,30);
    rect(mouseX-50,270,10,30);
    rect(mouseX-30,270,10,30);
    rect(mouseX-10,270,10,30);
    rect(mouseX+10,270,10,30);
    rect(mouseX+30,270,10,30);
    rect(mouseX+50,270,10,30);
    rect(mouseX+70,270,10,30);
    //nose
    fill(238,203,173);
    triangle(mouseX,200,mouseX-20,240,mouseX+20,240);
    //hat
    arc(mouseX,200,350,350,PI,0);
  }
}


void backGround(){
  if(mouseX<=250){
    for(int x=0;x<250;x=x+50){
      for(int y=0;y<500;y=y+50){
         float a=random(255);
        float b=random(255);
         float c=random(255);
         float d=random(50);
         float e=random(400);
         fill(a,b,c,mouseX-150);
        rect(x,y,100,100);
        
      }
    }
  }
  if((mouseX<=500)&&(mouseX>250)){
    for(int x=0;x<500;x=x+50){
      for(int y=0;y<500;y=y+20){
        
           float a=random(250);
        float b=random(250);
         float c=random(250);
         float d=random(80);
         float e=random(400);
         fill(a,b,c,mouseX-200);
        rect(x,y,a,a);
      }
    }
  }
  else if((mouseX<=750)&&(mouseX>500)){
    for(int x=0;x<750;x=x+50){
      for(int y=0;y<750;y=y+50){
        float a=random(400);
        float b=random(255);
         float c=random(255);
         float d=random(80);
         float e=random(400);
         fill(a,b,c,mouseX-400);
        ellipse(x,y,a,a);
        
      }
    }
  }
   if((mouseX<=1000)&&(mouseX>750)){
    for(int x=0;x<1100;x=x+50){
      for(int y=0;y<750;y=y+50){
        float a=random(255);
        float b=random(255);
         float c=random(255);
         float d=random(80);
         float e=random(400);
        fill(a,b,c,mouseX-700);
        ellipse(x,y,d,d); 
      
      }
    }
   }
}

