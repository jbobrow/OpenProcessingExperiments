

void setup()
{
   //layout size
      size(660, 410);
      background(#ED92AC);  
      
   //black triangle    
      fill(0);
      triangle(0,88,0,321,582,0);
    
    //transparent blue quad.   
      noStroke();
      fill(#0A1FF5,100);
      quad(280,70,369,399,475,359,480,30);
    
   //curve line   
      noFill();
      stroke(#2BD3A8);
      bezier(366, 50, 435, 110, 370, 180, 420, 195);
    
   //straight line (green)   
       stroke(#6BD322);
       strokeWeight(13);
       strokeCap(ROUND);
       line(31,335,440,345);
   
   //straight lines (purple)
       stroke(#BF0CE8);
       line(154,298,344,303);
       line(105,375,357,377);
     
   //point up "/\" (two lines)
       smooth();
       stroke(#E00E82);
       strokeWeight(3);
       line(60,380,345,65);
       line(345,65,358,372);
     
   //little triangle hat
       fill(#15EAC5);
       noStroke();
       triangle(265,195,314,244,317,185);
     
   //blue circle
       fill(#2A18A7);
       ellipse(278,224,51,41);
     
   //green square
       fill(#44AD4C);     
       rect(567,7,87,90);
     
   //diagonals
       stroke(#EC5C48);
       strokeCap(ROUND);
       strokeWeight(8);
       line(375,5,520,246);
       line(415,30,553,246);
       line(455,38,583,246);
    
   //orange frame   
       stroke(#FF8726);
       strokeCap(SQUARE);
       strokeWeight(15);
       noFill();
       rect(438,63,161,187);
     
   //point down "\/" lines
       smooth();
       stroke(#DB2A42);
       strokeWeight(3);
       line(88,49,233,363);
       line(233,363,568,62);
   
   //curve (arc)
       noFill();
       strokeWeight(30);
       stroke(#D7F3E3);
       bezier(463,412,473,310,540,237,665,250);
     
   //pink circle
       fill(#F5BECE);
       noStroke();
       ellipse(597,347,93,93);
     
   //dot of blue circle
       noFill();
       stroke(#B9ECED);
       strokeWeight(10);
       point(275,223);
     
   //star
     noStroke();
     fill(#FFF000);
     beginShape();
     vertex(586,350);
     vertex(609,350);
     vertex(619,328);
     vertex(627,350);
     vertex(650,350);
     vertex(633,367);
     vertex(650,400);
     vertex(618,376);
     vertex(597,390);
     vertex(605,366);
     endShape(CLOSE);
    
   //empty diamond(quad)
       noFill();
       stroke(#01FEBD);
       strokeWeight(5);
       quad(55,195,20,230,55,265,90,230);
     
   //filled diamond(quad)
       noStroke();
       fill(#01FEBD);
       quad(185,70,130,118,185,175,240,118);       
       
   //big yellow circle
       noFill();
       strokeWeight(6);
       stroke(#F0FE23);
       ellipse(55,230,78,78);
       
   //center yellow circle
     ellipse(185,120,55,55);
     
   //small yellow circle
     noStroke();
     fill(#F0FE23);
     ellipse(265,35,35,35);
     
   //dot on small yellow circle
     noFill();
     stroke(#01FEBD);
     strokeWeight(15);
     point(265,35);
   
}   
   
     
//Link to the original image I created in Adobe Sketchbook. http://tinylittlemoonsmurf.deviantart.com/art/Idea-482680347 
     
     
    
    
    
  


