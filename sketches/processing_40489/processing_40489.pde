
 void setup() {
   
   
      //Set Size of Window
               size(500,650);
               smooth();
       }
       
void draw() {
         
         
     //Insert Picture
               PImage bg;
               bg = loadImage ("risd.jpg");
               image(bg, 0, 0);
    
       
       //Draw Phone
              smooth();
              noStroke();
              fill(0,0,0);
              rect(0,400, 310,250);
              rect(0,362, 263,200);
              ellipse(265,403, 89,79);

              

        //Draw Circle in phone
              fill(255);
              ellipse(150, 520, 75, 75);


       //Draw Camera On Phone
              noFill();
              strokeWeight(3);
              stroke(128);
              ellipse(265, 406, 30, 30);
              strokeWeight(1);
              ellipse(265, 406, 15, 15);
              noStroke();
              fill(255);
              ellipse(265, 406, 2,2);
                      
     
       //Draw Glasses
              fill(133,86,56);
              rect(208,180, 35,22);
              rect(mouseX,mouseY-30, 35, 22);
              noFill();
              stroke(133,86,56);
              strokeWeight(5);     
              ellipse(298,205, 120,105);
              ellipse(mouseX,mouseY,120,150);
              ellipse(150,205, 120,105);
              ellipse(mouseX,mouseY, 120,105);
              
      //Glass of the Glasses
     
              fill(120,0,0,200);
              ellipse(150,205, 110,95);
              ellipse(mouseX,mouseY, 110, 95);
              ellipse(298,205, 110,95);
              ellipse(mouseX,mouseY, 110,95);
              
              
      // Outside Frame of Glasses
                       
              fill(133,86,56);
              noStroke();     
              ellipse(350,165,  32,25);
              ellipse(mouseX,mouseY, 32,25);
              rect(320,152,30,10);
              rect(mouseX,mouseY, 30, 10);
              ellipse(100,165, 32,25);
              ellipse(mouseX,mouseY, 32,25);
              rect(105,152,30,10);
              rect(mouseX,mouseY, 30,10);
   
       }


