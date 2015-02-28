
int s=10;
int s2=15;
int s3=18;
int a=20;
int b=30;
int c=40;
int d=50;

void setup(){
  size(500,500);
  background(0,50);
  smooth();
}

void draw(){
  rectMode(CENTER);
}

void keyPressed(){
   
 strokeWeight(.1);
 if(key=='r'){
  fill(0,random(0,100));
  rect(mouseX,mouseY,s,s);
  fill(255);
   rect(mouseX,mouseY,s2,s2);
   fill(0,random(0,100));
    rect(mouseX,mouseY,s3,s3);
 }
    if(key=='e'){
      fill(random(255),random(255),random(255),random(70,100));
      ellipse(mouseX,mouseY,d,d);
      fill(random(255),random(255),random(255),random(255));
      ellipse(mouseX,mouseY,c,c);
      fill(random(255),random(255),random(255),random(70,100));
      ellipse(mouseX,mouseY,b,b);
      fill(255);
      ellipse(mouseX,mouseY,a,a);
    }
      if(key=='l'){
        strokeWeight(8);
  stroke(random(255),random(255),random(255),random(90,100));
  line(mouseX,mouseY,mouseX+50,mouseY);
  strokeWeight(2);
   stroke(255);
  line(mouseX,mouseY,mouseX+40,mouseY);
    } 
       if(key=='y'){
        strokeWeight(5);
  stroke(random(255),random(255),random(255),random(90,100));
  line(mouseX,mouseY,mouseX,mouseY-50);
    }
   if(key=='s'){
        saveFrame();
   } 
}


