
int t= 75;
int s = 85;
int m = 90;
int n = 230;
int o = 160;


void setup(){
  size(400, 600);
  background(255);
  smooth();
  
}

void draw(){
  
  background(255);
  
  if(mouseButton == LEFT){ //when left button is clicked, skirt moves to the right 
   t = 85;
  }
  if(mouseButton == RIGHT){ //right click, skirt to the left
    t = 75;
  }
  if(mouseButton == LEFT){ //opp. layers of skirt move left
    s= 75;
  }
  if(mouseButton == RIGHT){ //opp. layers of skirt move right
    s = 85;
  }
  
  noStroke();
  fill(157, 75, 59);
  triangle(m, 290, n, 290, o, 210);
  rect(110, 160,100, 210);
  
  if (mouseButton ==LEFT){ //left click, hips move right
    m = 93;
  }
  if(mouseButton == RIGHT){//right click, hips move left
    m = 88;
  }
  if(mouseButton == LEFT){
    n = 233;
  }
  if(mouseButton == RIGHT){
    n = 228;
  }
  if(mouseButton == LEFT){
    o = 163;
  }
  if(mouseButton == RIGHT){
    o = 158;
  }
  
  stroke(0);
  ellipse(160, 240, 5, 5);  //bellybutton
 
 strokeWeight(25); 
 stroke(157, 75, 59);
 line(110, 160, 50, 200); //arms
 line(50, 200, 110, 250);
 line(210, 160, 270, 200);
 line(270, 200, 210, 250);
 
noStroke();
 triangle(110, 160, 210, 160, 160, 130);
 rect(145, 100, 30, 50); //neck
 
 fill(0);
 ellipse(158, 70, 110, 85);//top of hair
 
 
 fill(157, 75, 59);
 ellipse(158, 88, 90, 90);//head
 
 strokeWeight(1);
 stroke(0);
 fill(255);
 ellipse(140, 75, 17, 17);//eyes
 ellipse(175, 75, 17, 17);
 fill(0);
 ellipse(140, 75, 10, 17);//pupils
 ellipse(175, 75, 10, 17);
 
// line(130, 60, 135, 57);
 //line(135, 57, 140, 60);
 
 stroke(0);
 strokeWeight(2);
 line(155, 85,150, 95); //nose 
 line(150, 95, 156, 95);
 
 fill(255);
 stroke(160, 19, 31);//mouth
 triangle(140, 110, 150, 117, 170, 111);
 
 noStroke();
 fill(250, 134, 239);
 ellipse(135, 180, 50, 30);//bikini
 ellipse(185, 180, 50, 30);
 
 fill(0);
 rect(105, 57, 25,120);//sides of hair
 rect(186, 57, 25, 120);
 rect(120, 40, 70, 20);
 
 
  
    
noFill();
strokeWeight(40);
stroke(157, 75, 59);
line(100, 350, 150,525 );//legs
line( 150, 525, 125, 700);
line(165, 410, 240, 525);
line(240, 525, 215, 700);

stroke(0);
strokeWeight(1);
fill(25, 206, 44);
  oval(t, 150, 170);//skirt
  fill(14, 149, 28);
  oval(s, 135, 170);//opp. skirt layer
  fill(25, 206, 44);
  oval(t, 120, 170);
   fill(14, 149, 28);
  oval(s, 105, 170);
  fill(25, 206, 44);
  oval(t, 90, 170);
   fill(14, 149, 28);
  oval(s, 75, 170);
  fill(25, 206, 44);
  oval(t, 60, 170);
   fill(14, 149, 28);
  oval(s, 45, 170);
  fill(25, 206, 44);
  oval(t, 30, 170);
   fill(14, 149, 28);
  oval(s, 15,170);
  fill(25, 206, 44);
  oval(t,0, 170);
  
  
}



void oval(int x, int y, int d){
  
  pushMatrix();
  translate(x, y);
  
 // noFill();
  for(int i = 2; i <= d; i += 20){
    ellipse(i,310, 30, 50);
  }
  popMatrix();
  
}


