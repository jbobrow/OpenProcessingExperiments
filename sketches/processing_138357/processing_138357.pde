
//Variables

void setup() {
  size (500,600);
  smooth();
  background(200);
}


void draw(){
  drawBird (0,10,15,0,0);
  drawBird (0,10,15,0,270);
  drawTree ();

}
  
void drawBird (int h, int i, int j,int x, int y){
pushMatrix ();
translate(x,y);
  if(mousePressed == true){//Pecks Tree
    h = 7;
  }
  else if (mousePressed == false){
    h = -3;
  }
 noStroke();
 fill(200);
  rect(140,40,180,60);
//HEAD PARTS START HERE
  noStroke();
  fill(255);
  triangle(250+h,65,305+h,72,250+h,100);//feather 2
  fill(114,118,137);
  ellipse(250+h,73,60,50);//head
  fill(255,129,131);
  triangle(250+h,47,310+h,60,280+h,72);//feather
  fill(170,162,155);
  quad(180+h,55,222+h,61,238+h,78,223+h,80);//beak
  if(keyPressed == true){
    i = 1;
    j = 1;        
  }
  else if (keyPressed == false){
    i = 9;
    j = 15;
  }
  fill(240,255,129);
  ellipse(242+h,71,15,j);//eyewhite
  fill(119,109,149);
  ellipse(241+h,70,9,i);//iris 
//HEAD PARTS ENDS HERE
  stroke(170,162,155);
  strokeWeight(5);
  line(180,140,190,160);//feet1
  line(180,170,190,160);//feet2
  noStroke();

  fill(114,118,137);
  ellipse(250,140,80,110);//body
  fill(255);
  triangle(238,190,278,180,200,280);//tail 1
  fill(114,118,137);
  triangle(238,189,279,179,240,245);//tail 2
  triangle(188,160,230,145,235,185);//thigh
  
  fill(255,129,131);
  triangle(245,135,291,135,270,208);//wing3
  fill(255);
  triangle(250,135,291,135,280,210);//wing1
  fill(114,118,137);
  ellipse(268,136,46,85);//wing2
popMatrix();
}

void drawTree (){
  noStroke();
  fill(142,136,109);
  rect(130,0,50,height);//tree
  //treering1
  stroke(198,188,164);
  noFill();
  smooth();
  strokeWeight(8);
  for (int k = 10; k < height; k+=70) {
    arc(134,k,38,38,PI+HALF_PI,TWO_PI+HALF_PI);
  }
  //treering1 ends here
  //treering2 
  fill(108,96,69);
  smooth();
  noStroke();
  for (int l = 10; l < height; l+=70) {
    arc(131,l,13,13,PI+HALF_PI,TWO_PI+HALF_PI);
  }
  //treering2ends here
}


