
void setup(){
  size(800,600);
  smooth();}
  void draw(){

background(255, 153, 0); // sky

stroke(1);
strokeWeight(1);
 
fill(255, 204, 0);
ellipse(400, 350, 250, 250);  // upper half of circle

fill(0, 180, 234);
rect(0,350,800,250); // water
 
noStroke();
fill(239,125,23); //body
ellipse(140,450,65,50); //tail-
arc(186,450,30,40,(PI/180)*50,(PI/180)*310);
 
fill(150);
//fin
arc(128,442,24,20,(PI/180)*0,(PI/180)*180);
 
//mouth
arc(118,460,10,8,(PI/180)*0,(PI/180)*180);

//eye 
fill(000);
arc(132,442,15,15,(PI/180)*0,(PI/180)*180);



noStroke();
fill(239,125,23); //body
ellipse(540,550,65,50); //tail-
arc(586,550,30,40,(PI/180)*50,(PI/180)*310);
 
fill(150);
//fin
arc(528,542,24,20,(PI/180)*0,(PI/180)*180);
 
//mouth
arc(518,560,10,8,(PI/180)*0,(PI/180)*180);

//eye 
fill(000);
arc(532,542,15,15,(PI/180)*0,(PI/180)*180);



noStroke();
fill(239,125,23); //body
ellipse(340,500,65,50); //tail-
arc(386,500,30,40,(PI/180)*50,(PI/180)*310);
 
fill(150);
//fin
arc(328,492,24,20,(PI/180)*0,(PI/180)*180);
 
//mouth
arc(318,510,10,8,(PI/180)*0,(PI/180)*180);

//eye 
fill(000);
arc(332,492,15,15,(PI/180)*0,(PI/180)*180);


pushMatrix(); // start clock face context
  translate(400, 330); // move to centre
  stroke(255, 204, 0); // line colour
  strokeWeight(5); // line weight
  fill(255); // fill colour
  
   pushMatrix(); // start tick marks context
  for (int i=0; i <= 60; i++) {
    if (i%5==0) largeTick(); // every 5 i's follow "largeTick" instructions
   //(i > 180) && (i < 360))
   rotate(-PI/4); // rotate by 6 radians?
  }
  popMatrix(); 
  } 
  void largeTick() {
  strokeWeight(10); // tick weight
  line(100, 0, 200, 0); // tick length
  

fill(0, 180, 234);
rect(0,350,800,250); // water

}
