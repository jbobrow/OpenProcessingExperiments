
int y = -25;

void setup() {
  size(800,600);  // window size
  smooth();
}

void draw(){
 
  background(192,192,192);  //light grey
 // robot(-100,350);
  //for (int i = 100; i < width; i = i+250){
   
    if (y>855){
      y=-25;
    }
    robot(y,200);
    y+=2;
    }

/*void electricitySetup(){
    if(mousePressed){
     
        stroke (4,248,44);
     
      }  else {
  stroke(242,198,20);
      }
      if(y>855){
        y=-25;
      }
    strokeWeight(5);
      for (int i = -y; i <= y-10; i = i+20){  // electricity '/' and '\' strikes
      line(i,-145,i+10,-150);
      line(i+10,-150,i+20,-145);
      }
  
      
    stroke(0);
    strokeWeight(1);
}
*/
void robot(int x, int y) {
  pushMatrix();
  translate(x, y);
  strokeJoin(ROUND);

  fill(mouseX,mouseY,mouseX+mouseY); // basic grey fill colour
 
  rect(-50,-75,100,125); // body
  quad(-40,-95,40,-95,30,-75,-30,-75); // jaw
  quad(-20,-125,20,-125,20,-95,-20,-95); // skull

  { //shoulders
  fill(90);
  triangle(-50,-75,-70,-70,-50,-60); // left shoulder
  triangle(-70,-70,-75,-60,-50,-60);
  triangle(50,-75,70,-70,50,-60); // right shoulder
  triangle(70,-70,75,-60,50,-60);
  }
  
  { //arms
  fill(153);
  quad(-67.5,-60,-55,-60,-60,17.5,-70,16.5); // left arm
  quad(67.5,-60,55,-60,60,17.5,70,16.5); //right arm
  }
  
  { //hands
  fill(90);
  triangle(-55,17.5,-75,16.5,-66.5,60); //left hand
  triangle(55,17.5,75,16.5,66.5,30); //right hand
  arc(68,42,40,40,2.04,TWO_PI);
  arc(68,42,40,40,0,1.10);
  }
  
  { //legs
  rect(-10,50,5,80);  //left leg
  rect(10,50,5,80);  //right leg
  line(-5,115,10,115);  //wheel joint
  fill(0);
  ellipse(2.5,115,11,60);
  }
  
  {
 
  fill(242,198,20);  //antennae colour
  
  
 // electricitySetup(); //establish electricity on robot antennae
    
  line(-20,-125,-40,-145); // left antennae
  ellipse(-40,-145,10,10); // left antennae bulb
  
  line(20,-125,40,-145); // right antennae
  ellipse(40,-145,10,10); // right antennae bulb
  }
  
  line(-10,-115,-10,-105); // left eye
  line(10,-115,10,-105); // right eye
  popMatrix();
}


