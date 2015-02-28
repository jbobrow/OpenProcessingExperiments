
void setup() {
  size(450,450);
  background(0);//black background
  smooth();//make it smooth 
}
void draw() {
 
  //Tree Shape
  
  stroke(0,200,50);//outline same green colour as fill
  fill(0,200,50); //green colour
  triangle(200,110,228,70,256,110);//tree top tier
  triangle(175,160,228,100,281,160);//tree second tier
  triangle(150,215,228,150,306,215);//tree third tier
  triangle(125,270,228,200,331,270);//tree fourth tier
  triangle(100,325,228,250,356,325);//tree bottom tier
  
  //Tree Trunk
  
  stroke(142,119,56);//no outline on tree trunk
  fill(142,119,56); //colour of tree trunk
  rect(214,327,25,30);//tree trunk
  stroke(90,88,66);//dark lines on tree trunk
  line(219,327,219,357); //line on tree trunk
  line(224,327,224,357); //line on tree trunk
  line(229,327,229,357); //line on tree trunk
  line(234,327,234,357); //line on tree trunk
  
  //15 Baubles Decorations
  
  stroke(150); //grey outline of bauble circles
  ellipseMode(CENTER);//Centre Mode for circles
  fill(255,235,55); //colour of yellow bauble 1  
  ellipse(210,105,10,10);//position and size of yellow bauble 1
  fill(200); //grey colour of next bauble
  ellipse(246,105,10,10);//position and size of grey bauble 2
  fill(255,0,0); //red colour of next bauble
  ellipse(190,153,12,12);//position and size of red bauble 3
  fill(34,100,35); //dark green colour of next bauble
  ellipse(228,140,12,12);//position and size of dark green bauble 4
  fill(164,103,209); //purple colour of next bauble
  ellipse(266,153,12,12);//position and size of purple bauble 5
  fill(250,153,33); //orange colour of next bauble
  ellipse(175,205,14,14);//position and size of orange bauble 6
  fill(242,93,228); //pink colour of next bauble
  ellipse(282,205,14,14);//position and size of pink bauble 7
  fill(93,242,241); //light blue colour of next bauble
  ellipse(228,240,16,16);//position and size of light blue bauble 8
  fill(195,37,216); //lavender colour of next bauble
  ellipse(165,255,16,16);//position and size of lavender bauble 9
  fill(250,35,35); //red colour of next bauble
  ellipse(291,255,16,16);//position and size of red bauble 10
  fill(255,235,55); //yellow colour of next bauble
  ellipse(228,280,18,18);//position and size of yellow bauble 11
  fill(255); //white colour of next bauble
  ellipse(142,312,18,18);//position and size of white bauble 12
  fill(242,93,228); //pink colour of next bauble
  ellipse(200,312,18,18);//position and size of pink bauble 13
  fill(34,100,35); //green colour of next bauble
  ellipse(254,312,18,18);//position and size of green bauble 14
  fill(0,0,255); //blue colour of next bauble
  ellipse(314,312,18,18);//position and size of blue bauble 15
   
     
  //Crann's Face
   
    //eyes and pupils
    fill(255); //white colour of right eye
    ellipse(215,185,14,22);//position and size of right eye
    fill(0); //right pupil colour black
    ellipse(218,190,4,4); //size and position of right pupil
    fill(255); //white colour left eye
    ellipse(243,185,14,22);//position and size of left eye
    fill(0); //left pupil colour black
    ellipse(246,190,4,4); //size and position of left pupil
    //eyebrows
    stroke(0); //eyebrow black colour
    strokeWeight(2);//increase the thickness of outline
    line(207,175,217,168); //right eyebrow line
    line(252,175,240,168); //right eyebrow line
    //eyelids
    strokeWeight(1); //revert stroke weight to 1   
    arc(215,183,12,15,-PI,0); //right eyelid
    arc(243,183,12,15,-PI,0); //left eyelid
    //mouth
    arc(228,210,30,25,0,PI);//smily mouth
    
    //Star on Top
    
     fill(229,220,28); //fill star shape with gold color
     strokeWeight(2); //thicker line
     stroke(255); //outline star with white colour
     beginShape();//begin drawing the star
     vertex(225,20);//top point of star
     vertex(235,35);
     vertex(255,35);//second point of star
     vertex(245,50);
     vertex(250,70);//third point of star
     vertex(225,59);
     vertex(200,70);//fourth point of star
     vertex(205,50);
     vertex(195,35);//fifth point of star
     vertex(215,35);
     endShape();//end of the shape
      
}
  


