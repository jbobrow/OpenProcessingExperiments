

void setup(){
  size(570,660);
  smooth();
  }

void draw(){
  
  //background
  noFill();
  background(222,156,83);
  stroke(222,211,140);
  strokeWeight(20);
  for (int i=10;i<=900;i=i+90){
    ellipse(285,280,i,i);
  }
  
    //body
  strokeWeight(1);
  noStroke();
  fill(137,190,178);
  ellipseMode(CENTER);
  ellipse(155,225,269,269);
  ellipse(415,225,270,270);
  arc(285,220,530,530, radians(0),radians(180));
 
  //left eye
  fill(201,186,131);
  quad(155,180,205,230,155,280,105,230);
  //rect(135,255,40,40);
  fill(130,57,53,153);
  quad(155,255,175,275,155,295,135,275);
  fill(130,57,53);
  ellipse(155,255,20,20);
  
//right eye
  fill(222,156,83);
  quad(420,180,470,220,420,330,370,220);
  fill(236,238,147);
  quad(420,180,470,220,420,300,370,220);
  fill(137,190,250,190);
  quad(420,180,470,220,420,270,370,220);
  fill(130,57,53);
  ellipse(420,235,30,30);
  fill(137,190,178);
  ellipse(420,265,20,20);
  fill(201,186,131);
  ellipse(420,295,10,10);
  fill(130,57,53);
  ellipse(420,325,15,15);
  
  fill(130,57,53);
  ellipse(286,365,80,60);
}


