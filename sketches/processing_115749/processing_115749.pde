
//mondrian_iii project.
//the red color chages by time,mouse with time.
//Lin,Lien-Ya. Department of industrial design.
void setup(){
  size(1022,1027);
  background(0);
  
  }
void draw(){
  background(0);
  int s =second();
  int m = minute();
  int h = hour();   
  String T=(h+":"+m+":"+s); 
  noStroke();
  fill(181,38,s*3.75);//red
  rect(0,0,453,423);
  draw_yellow();
  draw_blue();
  fill(202);//gray
  rect(0,445,453,220);
  rect(469,0,653,423);
  rect(470,445,653,220);
  rect(115,687,340,344);
  rect(475,989,300,300);
  rect(785,683,300,400);
  endShape();
  fill(50);
  text(T,mouseX,mouseY);
}

void draw_yellow(){
  noStroke();
  fill(211,188,13);//yellow
  rect(0,683,99,344);
}
void draw_blue(){
  noStroke();
  fill(2,31,90);//blue
  rect(475,680,300,300);
}

