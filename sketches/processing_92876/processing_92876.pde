
void setup () {
  size(400,500);
  smooth();
 
}

void draw() {
  background(255,36,36);
  
  //neck
  noStroke();
  fill(66,1,0);
  triangle(218,195,195,190,205+mouseX/30,155);
  
   //hair
  fill(54,54,54);
  ellipse(216+mouseX/30,130+mouseY/80,85+mouseX/30,80+mouseY/80);
  
  //face
   fill(66,1,0);
  ellipse(210+mouseX/30,155+mouseY/80,45,50);
  
  //mouse
  fill(219,0,0);
  ellipse(210+mouseX/30,162+mouseY/80,15,15+mouseY/80);
  
  //eyes
  fill(0);
  ellipse(202+mouseX/30,145+mouseY/80,5,8-mouseY/140);
  ellipse(222+mouseX/30,148+mouseY/80,5,8-mouseY/140);
  
  //hairbend
  stroke(8,103,1);
  strokeWeight(4);
  noFill();
  arc(209+mouseX/30,148+mouseY/80,45,30,PI+PI+PI+PI/4.0,PI+PI+PI+PI,OPEN);
  
  //eyebrows
  stroke(0);
  strokeWeight(2);
  line(194+mouseX/30,137-mouseY/60,206+mouseX/30,139+mouseY/80);
  line(218+mouseX/30,142+mouseY/80,228+mouseX/30,140-mouseY/60);
  
  //body
  noStroke();
  strokeWeight(1);
  fill(66,1,0);
  quad(220,190+mouseX/125,195,185,175,400,225,400);
  
  //jacket
  fill(49,98,199);
  stroke(49,98,199);
  strokeWeight(0);
  
  //left arm
  fill(110,47,199);
  quad(160,183,130,190+mouseY/40,128,240,162,227);
  fill(56,0,145);
  quad(162,227,128,240,125+mouseX/20,280,158+mouseX/20,267);
  
     //pants
  fill(36,36,36);
  quad(245,320,160,320,150+mouseY/60,410,275-mouseY/80,410);
  fill(255,36,36);
  triangle(205,365,195+mouseY/60,410,220-mouseY/80,410);
  
  //left jacket
  fill(49,98,199);
  quad(195,185,175,181-mouseX/150,167,350,185,320);
  fill(67,116,217);
  quad(175,181-mouseX/150,160,183,150,360,168,350);
 
  //right jacket
  fill(49,98,199);
  quad(250,191+mouseY/20,220,190+mouseX/125,221,270,244,260);
   fill(67,116,217);
   quad(244,260,221,270,225,360,240,360);
   
   //right arm
  fill(110,47,199);
  quad(250,191+mouseY/20,240,250,255,280,280,280);
  

  
  //guitar
 translate(215,260);
 rotate(PI/4.3);
 
 fill(18,18,18);
 rect(10+mouseX/100,0+mouseX/100,90,70,20);
 
 fill(165,97,0);
 rect(-130+mouseX/100,27+mouseX/100,190,15);
 
 fill(170,131,25);
 quad(-130+mouseX/100,27+mouseX/100,-130+mouseX/100,42+mouseX/100,-147+mouseX/100,47+mouseX/100,-187+mouseX/100,27+mouseX/100);
 
 rotate(-PI/4.3);
 translate(-215,-260);
  
  //left hand
 fill(66,1,0);
 translate(175,285);
 rotate(-PI/4.0);
 rect(-20+mouseX/25,0-mouseX/25,35,20,20);
 
 rotate(PI/4.0);
 translate(-175,-285);
 
  fill(255);
  quad(158+mouseX/50,267,125+mouseX/20,280,175+mouseX/15,330-mouseX/15,175-mouseX/40,285-mouseX/20);
 
 
  //right hand
  translate(252,300);
  rotate(PI/1.2);
  
  fill(66,1,0);
  rect(-10+mouseY/30,-20+mouseY/15,40,20,20);
  
  rotate(-PI/1.2);
  translate(-252,-300);
  
  
  fill(255);
  quad(280,280,255,280,252-mouseY/20,300-mouseY/20,287-mouseY/20,308-mouseY/20);
  quad(287-mouseY/20,308-mouseY/20,252-mouseY/20,300-mouseY/20,255-mouseY/20,310-mouseY/20,280-mouseY/30,330-mouseY/30);
 
//text  
fill(0);
textSize(20);
text("Are you experienced!", 200-mouseX/10, 90-mouseY/15);

//image
//PImage img;
// img = loadImage("jimisign.jpg");
//image(img,15,15,130,80);



}
