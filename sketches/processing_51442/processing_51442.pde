
//Lauren Barnett
//Feb 3
//Sleepy Monster_from center

int x=300;
int y=300;
int counter=0;

void setup() {
  size(600, 600);
  smooth();
  background(0);
}

void draw() {
  //x=300;
  println(x);
  //y=300;
  println(y);
  background(0);
  //begin_characteristics
  
  fill(#7FE339);
  rect(x-110, y-75, -100, -100);//foot_left_back
  rect(x+110, y-175, 100, 100);//foot_right_back
  
  fill(#39E34E);
  ellipse(x, y, 600, 400);//body
  
  fill(#F5AF16);
  ellipse(x-140,y-155,40,20);//ear_left
  ellipse(x+140,y-155,40,20);//ear_right
  
  fill(#7FE339);
  rect(x-260, y+55, 140, 140);//foot_left_front
  rect(x+120, y+55, 140, 140);//foot_right_front
  
  fill(#CE17CC);
  ellipse(x-220,y+195,10,40);//left_toenail_left
  ellipse(x-190,y+195,10,40);//left_toenail_middle
  ellipse(x-160,y+195,10,40);//left_toenail_right
  
  ellipse(x+220,y+195,10,40);//right_toenail_right
  ellipse(x+190,y+195,10,40);//right_toenail_middle
  ellipse(x+160,y+195,10,40);//right_toenail_left
 
  fill(#39E34E);//head_color
  ellipse(x, y, 400, 400); //head 
  
  fill(#0B7410);//nostril_color
  ellipse(x-10,y,5,5);//nostril_left
  ellipse(x+10,y,5,5);//nostril_right

  fill(#FAFFF7);//eye_color
  ellipse(x-75, y-75, 50, 50);//eye_left
  fill(#419BDE);//iris_color
  ellipse(x-75, y-65, 20, 20);//pupil_left
  fill(#080808);
  ellipse(x-75,y-65,10,10);//pupil_left
  line(x-100, y-75, x-50, y-75);//eyelid_left
  
  
  fill(#FAFFF7);//eye_color
  ellipse(x+75, y-75, 50, 50);//eye_right
  fill(#419BDE);//iris_color
  ellipse(x+75, y-65, 20, 20);//iris_right
  fill(#080808);
  ellipse(x+75,y-65,10,10);//pupil_right
  line(x+100,y-75,x+50,y-75);//eyelid_right
  
  

  line(x-65, y+60, x+60, y+60);//mouth
  fill(#E2F287);
  rect(x-50,y+60,20,20);//tooth_left
  rect(x+30,y+60,20,20);//tooth_right
  
  
  if (y>395 && counter==0) {
    y-=1;
    counter=1;
  }
  if (counter==0){
    y+=1;
  }
  if (y<100 && counter==1) {
    y+=1;
    counter=0;
  }
  if (counter==1){
    y-=1;
    
  }
  
  
}


