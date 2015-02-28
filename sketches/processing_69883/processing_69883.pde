
//Assignment #1
//Janna Coles
//jcoles01@brynmawr.edu
//CS110-01
//9/12/2012
//This is a picture of Thor using lightning to make a poptart.


  size(1100,750);
  background(255);
  ellipseMode(CENTER);
  rectMode(CENTER);
  smooth();
  strokeCap(ROUND);

  //Toaster's electrical cord
    noFill();
    bezier(420,313, 433,500, 480,450, 570,595);
    bezier(626,506, 684,521, 732,377, 744,413);

  //Cape (back setion), left then right, then between
    noStroke();
    fill(186, 6, 6);
    bezier(486,345, 430,470, 492,455, 431,620);
    bezier(610,345, 674,389, 615,574, 661,620);
    quad(483,345, 613,345, 661,620, 431,620);

  //Table
    stroke(0);
    fill(149, 105, 41);
  
    //Legs, left then right
      rect(770,540, 20,160);
      rect(930,540, 20,160);
    
    //Top
     rect(850,450, 300,30);
   
   
  //Thor's body
  
    //Legs, left then right
       fill(35,48,77);
       ellipse(517,510, 56,130);
       ellipse(583,510, 56,130);
  
    //Boots (back section), left then right
       fill(46, 48, 50);
       arc(517,540, 56,140, 0,3.142);
       arc(583,540, 56,140, 0,3.142);
     
    //Boots (front section), left then right  
       arc(517,620, 65,70, 3.142,6.284);
       arc(583,620, 65,70, 3.142,6.284);
  
    //Arms , left then right  
       fill(250,218,196);
       bezier(485,411, 365,268, 430,270, 505,368);
       bezier(617,445, 630,510, 700,510, 617,363);
     
     
    //Torso
       noStroke();
       fill(46, 48, 50);
       ellipse(550,425, 146,165);
       arc(570,419, 190,168, 2.861,4.177);
       arc(530,418, 190,168, -1.2,.304); 
       stroke(46, 48, 50);
       strokeWeight(40);
       strokeCap(SQUARE);
       line(545,490, 620,460);
       line(555,490, 480,460);
  
     //Cape (shoulder section), left then right    
       noStroke();
       fill(186, 6, 6);
       rect(502,357,36,27);
       rect(613,357,60,27);
    
    //Armor   
       strokeWeight(20); 
       stroke(140, 151, 160);
       line(478,455, 622,455);
       stroke(0);
       strokeWeight(1);
       fill(140, 151, 160);
       ellipse(497,367, 40,40);
       ellipse(603,367, 40,40);
       ellipse(507,410, 30,30);
       ellipse(593,410, 30,30);
       ellipse(515,455, 27,27);
       ellipse(585,455, 27,27);
       fill(150, 161, 170);
       ellipse(497,367, 25,25);
       ellipse(603,367, 25,25);  
       ellipse(507,410, 23,23);
       ellipse(593,410, 23,23);
       ellipse(515,455, 20,20);
       ellipse(585,455, 20,20);

  //Thor's hair (part1)
    strokeCap(ROUND);
    strokeWeight(1);
    stroke(0);
    fill(250, 231, 18);

    //Back section, behind the head, left then right
      bezier(579,341, 590,343, 640,360, 630,283);
      bezier(487,283, 452,355, 512,349, 531,339);


  //Thor's head
    fill(250,218,196);
    ellipse(550,280, 140,150);


  //Thor's hair (part2)
    stroke(0);
    strokeWeight(1);
    fill(250, 231, 18);
  
    //Beard
      arc(550,307, 130,100, .073,3.043);
   
   
    //Bangs, left then right
      stroke(0);
      strokeWeight(1);
      fill(250, 231, 18);
      beginShape();
      vertex(467,350);
      bezierVertex(497,300, 433,141, 555,206);
      endShape(CLOSE);
      beginShape();
      vertex(637,350);
      bezierVertex(617,300, 663,141, 555,206);
      endShape(CLOSE);
    
    //Eyebrows, right then left
      noFill();
      stroke(2);
      strokeWeight(2);
      bezier(560,266, 568,257, 579,245, 605,247);
      bezier(496,247, 517,249, 527,253, 538,267);
    

  //Thor's face

    //Eyes
     stroke(0);
     strokeWeight(1);
     fill(50, 177, 255);
     ellipse(523,283, 10,30);
     ellipse(577,283, 10,30);
   
       //Shine  
         fill(255);
         noStroke();
         ellipse(521,279, 5,15);
         ellipse(575,279, 5,15);
      
    //Mouth
      fill(250,218,196);
      noStroke();
      arc(550,312, 35,52, .203,2.927);
      fill(253, 132, 129);
      arc(550,317, 25,40, 0,3.142);   
  
    
  //Thor's hammer
    
     //Handle
       stroke(122, 30, 32);
       strokeWeight(20);
       line(430,287, 425,337);
 
  
     //Center section
       stroke(0);
       strokeWeight(1);
       fill(156);
       quad(390,285, 470,295, 475,240, 395,230);
     
     //Left section
       beginShape();
       vertex(390,283);
       vertex(380,278);
       vertex(385,233);
       vertex(395,232);
       endShape();
     
     //Right section
       beginShape();
       vertex(480,290);
       vertex(470,293);
       vertex(475,242);
       vertex(485,248);
       endShape(CLOSE);


  //Lightning
    noStroke();
    fill(255,255,0);
    beginShape();
    vertex(437,234);
    vertex(460,174);
    vertex(410,160);
    vertex(420,134);
    vertex(310,114);
    vertex(390,194);
    vertex(430,180);
    endShape(CLOSE);
    

  //Cloud
    fill(212);
    ellipse(300,70, 70,90);
    ellipse(280,100, 100,80);
    ellipse(340,70, 90,70);
    ellipse(380,70, 80,70);
    ellipse(410,110, 70,70);
    ellipse(340,120, 100,110);
    
    
  //Poptart, outside, inside
    fill(207, 184, 145);
    rect(780,380, 40,60);
    fill(255);
    rect(780,380, 29,49);
    
    //Poptart Sprinkles
      fill(random(0, 255),  random(0, 255), random(0, 255));
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
      rect(random(766,794), random(356,380),  1,1);
    
  
  
  //Toaster
  
    //Main body
      fill(179, 173, 171);
      stroke(0);
      rect(780,412, 90,47);
      arc(780,389, 90,30, 3.142,6.284);
    
    //Base
      fill(0);
      rect(780,432, 100,10);
