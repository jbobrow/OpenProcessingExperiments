
float y = 38.130; 
float x =  0.0;
float easing = 0.1;

void setup(){
 size(600,600);
 background(0);
 beginShape();
 
} 

   void draw() {
      frameRate(80);
      background(y * 0.8);
      y = y + 0.5;
      line(38, y, 520, y);
      strokeWeight(10);
      if (y > 450) {
        y = 450;
      }
      
      fill(242, 204, 47, 160);
 
      quad(220,0,260,0,360,40,230,40);
      
      
      fill(174, 221, 60, 160); 
      
      quad(260,0,360,20,360,40,230,40);
      
     fill(116, 193, 206, 160);
     
     quad(220,0,260,0,420,560,360,570);


    fill(148 ,73, 232);
    
    quad(320,360,340,420,255,600,190,600);
   
   fill(148 ,73, 232);
   
   quad(450,230,500,260,480,280,430,250);
  
   fill(148 ,73, 232);
    quad(420,200,460,240,450,240,415,210);
 
  fill(148 ,73, 232);
   quad(470,205,480,210,450,250,435,250);
   
   fill(196, 58 ,237);
    quad(580,280,590,280,430,510,420,500);

   fill(122, 186 ,221);
   ellipse(70,530,130,140);

   
    
    float targetX =mouseX;
    fill(249,16,85);
   ellipse(mouseX,mouseY,mouseY,mouseX);
  
   
     }


