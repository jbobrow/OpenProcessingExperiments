
void setup(){
  size(600,700);
  background(84,35,103);
}
 
void draw(){
  println(mouseX +","+ mouseY);
  
  stroke(84,35,103);  
  for (int i = 0; i < width; i += 25){
    for (int j = 0; j < height; j += 25){
      line(i,j,i,height);
      line(i,j,width,j);
    }
  }
  fill(247,217,82);
  noStroke();
    beginShape();
    vertex(130,285);
    vertex(100,300);
    vertex(75,310);
    vertex(85,350);
    vertex(90,360);
    vertex(90,400);
    vertex(150,475);
    
    endShape();
    
    beginShape();
    vertex(500,250);
    vertex(535,285);
    vertex(550,300);
    vertex(540,350);
    vertex(550,400);
    vertex(515,450);
    vertex(500,470);
    
    endShape();
  
  fill(255,224,108);
  noStroke();
   beginShape();
    vertex(300,50);
    vertex(100,150);
    vertex(75,175);
    vertex(100,300);
    vertex(125,350);
    vertex(125,375);
    vertex(150,475);
    vertex(225,600);
    vertex(300,650);
    vertex(425,625);
    vertex(475,500);
    vertex(500,475);
    vertex(500,350);
    vertex(525,325);
    vertex(525,150);
    
    endShape();
    
  fill(247,217,82);
 beginShape();
   vertex(300,225);
   vertex(325,290);
   vertex(350,325);
   vertex(340,350);
   vertex(325,370);
   vertex(300,375);
   
   endShape();
   
   fill(245,182,124);
   beginShape();
     vertex(300,505);
     vertex(275,500);
     vertex(250,510);
     vertex(200,525);
     vertex(300,575);
     vertex(400,525);
     vertex(350,510);
     vertex(325,500);
     
     endShape();
     
    fill(100,68,35);
    beginShape();
      vertex(500,125);
      vertex(480,230);
      vertex(525,275);
      vertex(525,150);
      
      endShape();
     
    beginShape();  
      vertex(75,175);
      vertex(100,300);
      vertex(150,274);
      vertex(125,175);
      
      endShape();
  
   
 fill(148,219,240);
 ellipse(300,100,400,200);
 
 fill(157,233,255);
 ellipse(300,150,500,125);
 
 fill(255);
 ellipse(425,265,150,50);
 
 ellipse(200,275,75,100);
 
 fill(22,152,237);
 ellipse(425,264,50,75);
 
 ellipse(200,275,75,50);
 
 fill(0);
 ellipse(425,264,25,25);
 ellipse(200,275,25,25);
 
 stroke(230,146,115);
 strokeCap(ROUND);
 line(200,525,400,525);
 

   
}


