


void setup(){
  size(720,480);
  smooth();
  
}

void draw(){



  background(204);
    int x = 50 ;
int y=350;
int bodyHeight= 100;
int radius=50;

ellipseMode(RADIUS);

//head
fill(0);
ellipse(mouseX,mouseY,radius,radius);
//ellipse(x+230,y-200,radius,radius);
fill(255);
ellipse(mouseX+30,mouseY,12,12);
ellipse(mouseX-10,mouseY,10,10);
//ellipse(x+240,y-200,12,12);
//ellipse(x+210,y-200,10,10);
fill(0);
ellipse(mouseX+30,mouseY,3,3);
ellipse(mouseX-10,mouseY,3,3);
//ellipse(x+240,y-200,3,3);
//ellipse(x+210,y-200,3,3);

//body
noStroke();
fill(20);
rect(mouseX-20,mouseY+200,20,50);
rect(mouseX+10,mouseY+200,20,50);
//rect(x+210,y-90,20,y-200);
//rect(x+240,y-90,20,y-200);
fill(145);
rect(mouseX-30,mouseY+51,70,bodyHeight+60);
//rect(x+200,y-88,70,bodyHeight-160);
stroke(1);
fill(10);
rect(mouseX-20,mouseY+61,50,bodyHeight+40);
//rect(x+210,y-98,50,bodyHeight-140);*/
  if (mousePressed ==true){
    background(50);
  }
  if (keyPressed){
   if (key=='h'){
    strokeWeight(5);
   } else if(key=='r'){
     strokeWeight(1);
   }
  }
  

}

