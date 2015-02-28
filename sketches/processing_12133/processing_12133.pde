
void setup() {
  size(800,800);
PImage b;
b = loadImage("jw_full_moon.jpg");
background(b);
  smooth();
  
  
  fill(85, 153, 152);
  
  beginShape();
  vertex(622, 176);
  vertex(590, 278);
  vertex(483, 409);
  vertex(501, 448);
  // Right wing ^
  vertex(447, 448);
  vertex(383, 510);
  vertex(412, 560);
  vertex(350, 683);
  // Right Leg ^
  vertex(364, 591);
  vertex(327, 550);
  vertex(296, 535);
  vertex(190, 604);
  // Bottom ^
  vertex(246, 486);
  vertex(225, 469);
  vertex(200, 423);
  vertex(105, 438);
  //Left Leg ^
  vertex(217, 376);
  vertex(279, 400);
  vertex(331, 340);
  vertex(337, 291);
  // Left Wing ^
  vertex(374, 292);
  vertex(468, 214);
   vertex(622, 176);
  endShape();
  
  
  
  
    fill(11, 204, 202);
  fill(39, 255, 131);
  fill(255, 103, 141);
  fill(204, 11, 155);
  
  //fill(20, 157, 204);
  beginShape();
  vertex(331, 340);
  vertex(374, 292);
   vertex(337, 291);
   vertex(331, 340);
   endShape();
   
fill(20, 157, 204);


   beginShape();
   vertex(483, 409);
  vertex(501, 448);
  // Right wing ^
  vertex(447, 448);
  vertex(483, 409);
  
  endShape();
  
  fill(255, 103, 141); 


  beginShape();
   vertex(383, 510);
    vertex(412, 560);
  vertex(350, 683);
  // Right Leg ^
  vertex(364, 591);
  vertex(383, 510);
  
 
  beginShape();
  vertex(383, 510);
    vertex(364, 591);
  vertex(327, 550);
  vertex(296, 535);
  vertex(383, 510);
  endShape();
  
  
 
 fill (39, 255, 131);
  beginShape();
   vertex(246, 486);
   vertex(383, 510);
    vertex(190, 604);
       vertex(246, 486);
  endShape();
  
fill(85, 153, 152);

  beginShape();
  vertex(200, 423);
  vertex(105, 438);
  //Left Leg ^
  vertex(217, 376);
  vertex(279, 400);
  vertex(200, 423);
  endShape();
  
   fill(11, 204, 202);
   
  beginShape();
    vertex(279, 400);
    vertex(246, 486);
  vertex(225, 469);
  vertex(200, 423);
  vertex(279, 400);
  endShape();
  

fill (39, 255, 131);
  beginShape();
  vertex(279, 400);
   vertex(483, 409);
    vertex(447, 448);
    vertex(383, 510);
     vertex(279, 400);
     endShape();
     
     fill (255, 103, 141);
    beginShape();
    vertex(483, 409);
  vertex(468, 214);
   vertex(374, 292);
     vertex(331, 340);
   vertex(279, 400);
   vertex(483, 409);
   endShape();
   
   fill(204, 11, 155);
  
   beginShape();
   vertex(468, 214);
   vertex(622, 176);
  vertex(590, 278);
  vertex(483, 409);
  vertex(468, 214);
  endShape();

      
      fill(85, 153, 152);
    
  // ellipse(404, 345, 50, 50);
  // ellipse(451, 294, 50, 50);
  // ellipse(497, 244, 50, 50);
   
  ellipse(405, 349, 50, 50);
  ellipse(458, 307, 50, 50);
  ellipse(513, 261, 50, 50);
  
   
  
}

