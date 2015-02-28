



void setup(){ 
   
  size(640, 480); 
  background(167, 255, 119); 
  smooth();
  noStroke();
  noCursor();
} 
 
 
void draw(){ 
  fill(255);
  background(0); 
  
  
  
 if(mousePressed){
 
        float speed = dist (mouseX, mouseY, pmouseX, pmouseY + 100);
        strokeCap (ROUND);
        strokeWeight (speed/5);
        stroke (220, 255, 0, speed + 20);
        
    translate (20, 0);
            //left eye
            float mx = constrain (mouseX+30, 220, 280);
            float my = constrain (mouseY+30, 135, 185); 
       
            fill(255);
            ellipse (250, 160, 90, 90);
          
            fill(0);
            ellipse (mx, my, speed-70, speed-70); 
     
          
          //right eye
            float mx1 = constrain (mouseX+30, 320, 380);
            float my1 = constrain (mouseY+30, 140, 180); 
            
            fill(255);
            ellipse (350, 160, 90, 90);
           
            fill(0);
            ellipse (mx1, my1, speed-70, speed-70);
        
 
  } else {
          float speed = dist (mouseX, mouseY, pmouseX + 100, pmouseY);
          strokeCap (SQUARE);
          strokeWeight (speed/10);
          stroke (13, 160, 255, speed + 20);
  
  
   translate (20,0);

              //left eye
          
              fill(255);
              ellipse (250, 160, 90, 90);
            
            
            //right eye
             
              fill(255);
              ellipse (350, 160, 90, 90);
              
              
                 //pink eyes
                  float target = dist(mouseX, mouseY, pmouseX, pmouseY); 
                  fill(255, 103, 103, speed); 
                  ellipse(350, 160, 90, 90); 
                  ellipse(250, 160, 90, 90); 
                  
                  
                   //red veins
                      if(keyPressed == true){
                       
                       smooth();
                       noFill();
                       stroke(255, 0, 0);
                       strokeWeight(1.5);
                       

                       //left eye
                       beginShape();
                       vertex (217, 135);
                       vertex (227, 136);
                       vertex (226, 148);
                       vertex (235, 149);
                       endShape();
                      
                       beginShape();
                       vertex (230, 127);
                       vertex (234, 135);
                       vertex (235, 139);
                       vertex (227, 146);
                       endShape();
                       
                       beginShape();
                       vertex (250, 119);
                       vertex (249, 125);
                       vertex (244, 127);
                       vertex (246, 133);
                       vertex (247, 138);
                       vertex (251, 140);
                       endShape();
                       
                       beginShape();
                       vertex (284, 136);
                       vertex (276, 136);
                       vertex (260, 137);
                       vertex (260, 143);
                       endShape();
                            
                      beginShape();
                       vertex (272, 142);
                       vertex (277, 136);
                       endShape();
                       
                       beginShape();
                       vertex (289, 171);
                       vertex (275, 171);
                       vertex (272, 176);
                       vertex (270, 166);
                       endShape();
                       
                       beginShape();
                       vertex (285, 170);
                       vertex (280, 166);
                       vertex (275, 162);
                       vertex (275, 157);
                       vertex (272, 153);
                       vertex (266, 152);
                       endShape();
                       
                       beginShape();
                       vertex (273, 194);
                       vertex (269, 189);
                       vertex (268, 180);
                       vertex (265, 177);
                       vertex (262, 177);
                       vertex (260, 175);
                       vertex (259, 172);
                       endShape();
                       
                       beginShape();
                       vertex (242, 202);
                       vertex (241, 195);
                       vertex (247, 189);
                       vertex (250, 189);
                       vertex (251, 180);
                       endShape();
                       
                       beginShape();
                       vertex (243, 193);
                       vertex (240, 188);
                       vertex (239, 182);
                       endShape();
                       
                       beginShape();
                       vertex (217, 183);
                       vertex (216, 180);
                       vertex (216, 174);
                       vertex (221, 171);
                       vertex (225, 171);
                       vertex (227, 168);
                       vertex (228, 161);
                       endShape();
                       
                       beginShape();
                       vertex (217, 183);
                       vertex (224, 174);
                       vertex (229, 174);
                       vertex (232, 177);
                       vertex (236, 177);
                       vertex (238, 175);
                       vertex (239, 173);
                       endShape();
                       
                       //right eye
                       beginShape();
                       vertex (352, 120);
                       vertex (351, 123);
                       vertex (340, 133);
                       vertex (340, 140);
                       vertex (342, 141);
                       vertex (342, 148);
                       endShape();
                       
                        beginShape();
                       vertex (350, 124);
                       vertex (355, 125);
                       vertex (355, 133);
                       vertex (351, 137);
                       vertex (350, 141);
                       endShape();
                       
                        beginShape();
                       vertex (379, 133);
                       vertex (373, 134);
                       vertex (366, 138);
                       vertex (366, 144);
                       vertex (365, 147);
                       vertex (360, 148);
                       endShape();
                       
                        beginShape();
                       vertex (387, 146);
                       vertex (382, 147);
                       vertex (378, 148);
                       vertex (371, 156);
                       vertex (368, 156);
                       endShape();
                       
                        beginShape();
                       vertex (387, 148);
                       vertex (384, 148);
                       vertex (382, 152);
                       vertex (381, 156);
                       vertex (377, 162);
                       vertex (373, 167);
                       vertex (367, 167);
                       endShape();
                       
                        beginShape();
                       vertex (374, 195);
                       vertex (372, 193);
                       vertex (366, 188);
                       vertex (363, 181);
                       vertex (361, 179);
                       vertex (355, 177);
                       vertex (351, 175);
                       endShape();
                       
                        beginShape();
                       vertex (366, 188);
                       vertex (365, 178);
                       vertex (364, 177);
                       vertex (364, 174);
                       endShape();
                       
                        beginShape();
                       vertex (313, 179);
                       vertex (322, 179);
                       vertex (329, 181);
                       vertex (331, 186);
                       vertex (339, 186);
                       vertex (339, 184);
                       endShape();
                       
                        beginShape();
                       vertex (313, 179);
                       vertex (320, 176);
                       vertex (325, 176);
                       vertex (330, 174);
                       vertex (334, 169);
                       vertex (336, 167);
                       endShape();
                       
                        beginShape();
                       vertex (317, 140);
                       vertex (322, 140);
                       vertex (325, 143);
                       vertex (326, 149);
                       vertex (328, 154);
                       vertex (332, 158);
                       vertex (332, 161);
                       endShape();
                       
                       beginShape();
                       vertex (326, 146);
                       vertex (328, 148);
                       vertex (334, 148);
                       
                       }
                   }  
         
         
        
                    
         
            
      {  
        
        
        //right eye pupil
       float mx1 = constrain (mouseX+30, 320, 380);
       float my1 = constrain (mouseY+30, 140, 180); 
              fill(0);
              ellipse (mx1, my1, 15, 15);
       
      
       float mx2 = constrain (mouseX+30, 320, 380);
       float my2 = constrain (mouseY+30, 140, 180);
              fill (255);
              ellipse (mx2, my2, 5, 5);
              
        //left eye pupil
        float mx = constrain (mouseX+30, 220, 280);
        float my = constrain (mouseY+30, 135, 185); 
              fill(0);
              ellipse (mx, my, 15, 15);
          
          
              
        float mx3 = constrain (mouseX+30, 220, 280);
        float my3 = constrain (mouseY+30, 135, 185); 
              fill (255);
              ellipse (mx3, my3, 5, 5);
              }
              

}
 

