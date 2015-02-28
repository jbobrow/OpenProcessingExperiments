
import processing.pdf.*;



void setup()
{
size(1024, 768, PDF, "wallpaper.pdf");
  size (500,450);
background (242, 95, 66);
smooth();



for (int i=1; i<=10; i++)
  {
  strokeWeight(3);
  stroke(60, 198, 174);
    line (0, i*49.8, width, i*49.8);
    //line (0, height, i*49.8, i*49.8);
   
  stroke(232,193, 49); 
   for (int x = 0; x <= width; x += 20) {
      for (int y = 0; y <= height; y+=20) {
        //rect(x, y, 10, 10);
        
   
    
      }  
  }
   }
   
   for (int i = 10; i < 500; i = i + 50)
  {
    house(i, 20);
  }
  
 

}

void house(int x, int y)
{
  fill(60, 198, 174);
  stroke (60, 198, 174);
  triangle(x + 30, y+5, x+5, y - 8, x - 5, y + 15);
 
  stroke(232,193, 49); 
  fill (232,193, 49);
  rect(x, y + 40, 30, 30);
  stroke (49, 87, 232);
  fill (49, 87, 232);
  rect(x + 17, y + 55, 10, 10);
  stroke (232, 49, 95);
  fill (232, 49, 95);
    rect(x + 2, y + 45, 10, 10);
  
//puny ball   
   
    ellipse (x,y, 10, 10);
// third row ball
    ellipse (x+13,y+105, 40, 40);
    fill (234, 159, 194);
    ellipse (x+13,y+105, 20, 20);
 //moustache  
   stroke (215, 110, 232);  
  fill (215, 110, 232); 
ellipse(200,210,100,100);
ellipse(300,210,100,100);
arc(180, 217, 140, 140, 0, PI/1);
arc(320, 217, 140, 140, 0, PI/1);

//triangles after moustache
fill (58,125, 191);
stroke (58, 125, 191);
triangle(x + 30, y+320, x+30, y + 300, x , y + 320);

stroke(random(42), random(47), random(180));
fill (random(42), random(47), random(180));
 ellipse (x+5,y+300, 10, 10);

// square
stroke(58,191, 94); 
  fill (58, 191, 94);
  rect(x, y + 340, 20, 30);

stroke(random (222), random(186), random(67)); 
  fill (random (222), random (186), random(67));
  rect(x, y + 340, 10, 5);
  rect(x, y + 353, 10, 5); 
    rect(x, y + 365, 10, 5);
    
    
    //circles
    stroke(153, 49, 229); 
  fill (153, 49, 229);
      ellipse (x+13,y+403.5, 20, 40);
    fill (random(255), 15, 116);
    ellipse (x+13,y+403.5, 30, 20);
    
    
    println("Finished.");
    exit();
  }
  

  

                
                
