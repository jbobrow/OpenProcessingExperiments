
float r;
float x=225; //starting position
float speed = 2.5;
int direction = 1;

void setup(){
  size(520,500); 
  smooth(); 
  background(180);
}

void draw(){
  r=random(50,250);
  
//antenna
  strokeWeight(3);
  stroke(242,135,183);
  line(265,145,300,100);
  
//light bulb
  noStroke();
  fill(100-r,200,150,r);
  ellipse(300,100,20,20);
  fill(200,100,150);
  ellipse(300,100,10,10);
 
//roller circle 
  noStroke();
  if((mouseX>230)&&(mouseX<230+50)&&(mouseY>365)&&(mouseY<365+50)){
    fill(55*r,118,163-r,r);
  }else{
    fill(100-r,200,150,r);
  }
  ellipse(255, 269+120, 50, 50);

//neck
  fill(158,123,191);
  rect(225+30-12.5,269-25,25,25);

//body rectangles
  fill(100);
  rect(225, 269, 60, 120); 
  fill(236,123,61);
  rect(225,280,60,6);

//head
  fill(109,207,246); 
  ellipse(255,219-25,100,100);
//face  
  fill(150); 
  ellipse(247,202,70,70); 
//eyes
  fill(254,242,102); 
  ellipse(230,200,12,12); 
  ellipse(255,208,18,18);

}

