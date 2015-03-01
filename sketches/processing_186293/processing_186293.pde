
//Assignment 6a: Design something by using mousePressed() and/or mouseReleased().
PImage gear;
float rot,rot2,col1,speed;
boolean forward;
void setup(){
  size(800,800);
  imageMode(CENTER);
  rectMode(CENTER);
  stroke(10);
 gear = loadImage("http://i.imgur.com/gEsoewH.png"); 
 
  
}
void draw(){
   background(135,255,255);
   alert();
  
   pushMatrix();
   fill(220);
   rect(0,0,450*2,height*2);
   popMatrix();
   pushMatrix();
    fill(255,col1,col1);
   ellipse(350,70,100,100);
   popMatrix();
   rotate();
   pushMatrix();
   translate(100,100);
   rotate(rot);
   image(gear,0,0,150,150);
   popMatrix();
   pushMatrix();
   translate(210,220);
   rotate(-rot);
   image(gear,0,0,200,200);
   popMatrix();
   pushMatrix();
   translate(125,410);
   rotate(rot);
   image(gear,0,0,250,250);
   popMatrix();
   pushMatrix();
   translate(200,600);
   rotate(-rot);
   image(gear,0,0,200,200);
   popMatrix();
    pushMatrix();
   translate(360,610);
   rotate(rot);
   image(gear,0,0,150,150);
   popMatrix();
   
   bird();
   
}
void rotate(){
  //rot2=0;
if((mousePressed==true)&&(mouseButton==LEFT)){
   rot +=.1; 
   
   }
   if((mousePressed==true)&&(mouseButton==RIGHT)){
   rot -=.1; 
   }


 if((mousePressed==true)&&(mouseButton==LEFT)){
    if(rot2<=-.4){
      forward=true;
    }
     if(rot2>=.2){
      forward=false;
    }
    if(forward==true){
     rot2+=.01; 
    }
    else{
      rot2-=.01;
    }
   }
}
void alert(){
  
  if(mousePressed==true){
    
    col1=random(255);

}
}

void bird(){
  noStroke();
  fill(105,69,2);
  rect(550,600,200,10);
  fill(255,100,100);
  rect(550,570,40,50);
  pushMatrix();
  rect(485,585,50,20);
  fill(255);
  rect(470,530,20,90);
  popMatrix();
  pushMatrix();
  translate(470,500);
  rotate(rot2);
  rect(0,0,150,20);
  fill(0,227,19);
  ellipse(-60,0,50,30);
  fill(255,0,0);
   ellipse(70,0,40,40);
   fill(0,45,225);
   rect(100,0,30,30);
   rect(85,0,5,50);
    fill(255,0,0);
   triangle(65,10,80,10,75,50);
  popMatrix();
  
}


