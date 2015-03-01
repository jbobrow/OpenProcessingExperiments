
boolean click = false;
float c=96;
int count;
float d=0;
void setup() {
  size(450,370);
  background(0,144,255);
  smooth();  
}
 
void draw(){


  //hair top
  fill (255,c,d);
  ellipse (225,165, 190,100);
  ellipse (230,165, 195,170);

  //ponyo face
  fill (254,209,101);
   noStroke();
  ellipse (230,210, 190,140);
  ellipse (225,165, 170,100);
  //hair

   fill (255,c,d);
    noStroke();
   ellipse (138,180, 10,15);
    noStroke();
   triangle (140, 160, 200,110, 150,120);
   triangle (180, 150, 220,110, 160,100);
   triangle (190, 150, 260,120, 210,100);
   triangle (230, 150, 260,120, 240,100);
   triangle (240, 155, 270,120, 260,100);
   triangle (255, 145, 280,120, 270,100);
   triangle (300, 155, 270,120, 310,120);
   //hair top
   triangle (160,95, 148,120, 180,120);
   triangle (175,85, 148,120, 180,120);
   triangle (200,75, 150,120, 190,120);
   triangle (205,73, 235,120, 230,80);
   triangle (255,73, 260, 90, 285,95);
   triangle (280,80, 283, 100, 310,118);
   triangle (305,100, 295, 105, 310,118);
 
 
 
    
  //eyes

  fill (255);
  ellipse (170,180, 40,40);
  fill (255);
  ellipse (300,180, 40,40);
  fill (0,d,d);
  ellipse (175,175, 13,13);
  fill (0,d,d);
  ellipse (295,175, 13,13);

  //mouth
  fill (243,140,123);
  ellipse (235,255, 20,10);
  //nose
  stroke (0);
  strokeWeight(2);
  fill (254,209,101);
  ellipse (235,200, 10,10);
   noStroke();
  fill (254,209,101);
  rect (225,199, 20,10);
   
  fill (123,225,225,15);
  ellipse (228,180, 300,300);
 
   
  fill (255);
  ellipse (128,100, 20,20);
  ellipse (110,120, 10,10);
  
if (click == true){
  
  fill (255,c,d,30);
  count++;
  int x= 30+count;
  ellipse (mouseX,mouseY, x,x);
  
  fill (0,d,d);
  int y=mouseY+20;
  int x2=mouseX+20;
  int total = 50+count;
  if (total<150){
  ellipse (0,0,total,total);
  ellipse (0,370,total,total);
  ellipse (450,370,total,total);
  ellipse (450,0,total,total);
  } 
}
   
   
   
}

void mousePressed() {
  click=true;
  c=random(200,250);
  d=random(100,250);
} 

void mouseReleased(){
  click=false;
  count =0;
  
}
