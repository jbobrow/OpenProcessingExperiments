
//Sarah Anderson, seanders
// hw8
//copywrite Sarah Anderson @ CMU 2012
// click the mouse anywhere to change where the lines are drawn from
// press a key to splatter window with little purple ellipses


float x, y; 

void setup(){
  size(400,400);  
  background(50);
  x=random(6);
  y=random(6);
}

void draw(){
  horizLines(); 
  vertLines();
}

void horizLines(){
  while(x<=width){
    stroke(random(255),random(255),0,180);
    strokeWeight(random(5));
    line(x,0,x,height);
    x+=random(6);
  }  
}

void vertLines(){
  while(y<=height){
    stroke(0,random(255),random(255),160);
    strokeWeight(random(5));
    line(0,y,width,y);
    y+=random(6);
  }    
}

void mousePressed(){
  x=mouseX;
  y=mouseY;
}

void keyPressed(){
 for (int i=0; i<=width; i+=random(11)){
   for(int n=0; n<=height; n+=random(11)){
     noStroke();
     fill(random(255),0,random(255),100);  
     ellipse(i,n,random(10),random(10));
       
   }
 }  
}
