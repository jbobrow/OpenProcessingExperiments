
//Stephanie Callaghan
//Project 1 - Drawing Machine
//"It's Five'o Clock Somewhere"


void setup(){
  size(500,500);
  background(100);
}

void draw(){                                         
                                                     //sets up grid of diagonal lines across screen
  for(int x=0; x<width; x+=50){                      //spacing is 50 pixels for both x and y axis 
    for(int y=0; y<height; y+=50){                   //until lines reach edges of sketch
      stroke(100);                
      noFill();
      line(x,y,width-y,height-x);
      line(x+50,y,x,y+50);
    }
  }
}

void mousePressed(){                                 //when mouse is pressed..   

   background(random(0,100));                        //background is set at a random shade of gray


//Clocks

   for(int x=50;x<width-20;x+=50){                   //clocks will be spaced evenly within grid lines 
     for(int y=25;y<height-20;y+=50){                //and will not exceed limits of width and height of sketch
  
       
       if(random(100)>60){                           //if the random number from 0-100 is greater than 60
                                                     //a clock will be drawn (60% chance)
       noFill();
       stroke(random(255),random(255),random(255));  //color of each clock will be random
       ellipse(x,y,30,30);                           //draws 30 x 30pixel ellipse within each section of grid    
       
       fill(random(255),random(255),random(255));
       arc(x,y,30,30,TWO_PI-PI/2,TWO_PI+1);          //draws arc within ellipse so time reads "5'oclock"
      
      
//Martini Glass

       stroke(255,10);
       fill(255,10);

       triangle(mouseX,mouseY,mouseX+50,mouseY-50,mouseX-50,mouseY-50);  //draws a martini glass wherever mouse is located when pressed
       line(mouseX,mouseY,mouseX,mouseY+50);
       triangle(mouseX,mouseY+50,mouseX+20,mouseY+60,mouseX-20,mouseY+60); 
       }
     }
   }
}


