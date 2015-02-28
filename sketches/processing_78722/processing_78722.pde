
//use with songs "Theme From Norfiell" by Tiesto on Red album
            //or "Eat It Raw" by Infected Mushroom on Vicious Delicious


float angle = 0;
float rad = 0;

void setup(){
  size(1000,500);
  background(35,31,32);
  smooth();
}






//////// BOXY SPIRAL     
  void spiral(float a, float b){          
          // Sunflower Spiral
             strokeWeight(1);
             float x = rad*cos(radians(angle));
             float y = rad*sin(radians(angle));  
             
             noFill();      
             stroke(0, 100, 200);
             angle+=175.5;
           //  angle+=12;
             ellipse(x+300, y+300, 5, 5);
             rad+=.5; //////this is important
          
          // Green Square
             stroke(61,255,99);
             noFill();
             strokeWeight(.5);
             angle+=2;
             rect(x+300, y+300, 590, 512);
             angle++; 
          }  
          
          
          
          
          
          
          
//////// K SPIRAL    
void shapeK(float x, float y){
         strokeWeight(1);
         stroke(120, 0, 159);
         beginShape();
           vertex(x-30, y-35);
           vertex(x-30, y-49);
           vertex(x-12, y-49);
           vertex(x-12, y+14);
           vertex(x+14, y-5);
           vertex(x+0, y-5);
           vertex(x+0, y-19);
           vertex(x+30, y-19);
           vertex(x+30, y-5);
           vertex(x+24, y-5);
           vertex(x+5, y+9);
           vertex(x+21, y+35);
           vertex(x+30, y+35);
           vertex(x+30, y+50);
           vertex(x+1, y+50);
           vertex(x+1, y+35);
           vertex(x+12, y+35);
           vertex(x+0, y+13);
           vertex(x-12, y+23);
           vertex(x-12, y+35);
           vertex(x-4, y+35);
           vertex(x-4, y+50);
           vertex(x-30, y+50);
           vertex(x-30, y+35);
           vertex(x-20, y+35);
           vertex(x-20, y-35);
           vertex(x-30, y-35);
           vertex(x-30, y-49);
         endShape(); 
         }








void draw(){ 

// Spiral 1 button _____ blue circles with green square
    fill(0, 0, 55);
    stroke(random(200));
    rect(920, 250, 60, 30); 
    
    fill(230);
    textSize(10);
    text("SPIRAL 1", 930, 270);

    if(mouseX > 900 && mouseX < 980 && mouseY > 245 && mouseY < 285){
            if(mousePressed){
               spiral(50,50);   
            } 
    }
  
// Spiral 2 _____ pink K
    fill(0, 0, 55);
    stroke(random(200));
    rect(920, 300, 60, 30); 
    
    fill(230);
    textSize(10);
    text("SPIRAL 2", 930, 320);

    if(mouseX > 900 && mouseX < 980 && mouseY > 285 && mouseY < 335){
            if(mousePressed){
             float x = rad*cos(radians(angle));
             float y = rad*sin(radians(angle));  
                   
             fill(random(200), 0, random(15), 50);      
             stroke(0, 100, 200);
            //angle+=12;
             shapeK(x+500, y+245);
             angle+=200;
             angle += -200;
             rad += .2;    
            } 
    }
  
// Spiral 3 button _____ blue and green circles
    fill(0, 0, 55);
    stroke(random(200));
    rect(920, 350, 60, 30); 
    
    fill(230);
    textSize(10);
    text("SPIRAL 3", 930, 370);

    if(mouseX > 900 && mouseX < 980 && mouseY > 345 && mouseY < 385){
            if(mousePressed){
              stroke(21,0,208);
              for(int i = 0; i < 8; i++){
                     
                   fill(3,80,random(255),90);
                   float x = rad*cos(radians(angle)); 
                   float y = rad*sin(radians(angle));
                     angle+=137.5;                    
                     ellipse(x+300,y+300,50,50);       
                     rad+=.5;                         
              }
            }
        }
        
//Clear button
    fill(0, 0, 55);
    stroke(random(200));
    strokeWeight(3);
    ellipse(950, 450, 60, 60);
    
    fill(230);
    textSize(10);
  //  textAlign(CENTER);
    text("CLEAR", 935, 454);
    
    if(mouseX > 900 && mouseX < 980 && mouseY > 420 && mouseY < 480){
      if(mousePressed){
          background(35, 31, 32);
       }
    }else{


    }
}
 

 

            
//  void mousePressed(){
//   stroke(255, 255, 0, 80);
//   noFill();
//   strokeWeight(.5);
//   angle = (angle + 10) % 8; 
//  }
 


