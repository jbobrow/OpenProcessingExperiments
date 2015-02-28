
void setup (){
 size (500,500);
background(255);
 
  
  
  
  
}




void draw () {
  noSmooth();
  //face
  fill(0);
  ellipse (250,250,260,250);
 //head
 fill(255); 
 ellipse (250,270,230,210);
 //eyes
  ellipse (220,180,60,65);
  ellipse (280,180,60,65);
  //eyeball
  fill(0);
  ellipse (220,185,20,20);
 ellipse (280,185,20,20); 
  //nose
  ellipse (250,215,30,30);
  line (250,220,250,330);
  noFill();
  //curve(120,280,200,330,280,330,350,300);
  //mouth
strokeWeight(2); 
  arc (250,240,180,180,0,PI/3);
  arc (250,240,180,180,PI/3,PI);
  //whisker
  line(180,220,220,230);
  line(175,245,220,245);
  line(180,270,220,260);
  line(325,245,280,245);
  line(280,230,320,220);
  line(280,260,320,270);
}
