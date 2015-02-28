
void setup ( ) {//used to define initial environment properties
size(400, 400);//defines demension of the display window
}
int value = 0;//is the initial value

void draw( ) {//tells theres going to be a sequence of statements
  if (value==0){
     background(#ffffff);//set background color i chose a white back ground
     stroke(0);//black stroke
     ellipseMode (CORNERS);//when set at center the circle was way off in the corner and
     ellipse (100,100,300,300);// set the parameters so that it is circular, did this by making the width and height the same
     
     line (130,128,105,55);//these are the lines that make the up the rays around the sun
     line (105,55,165,105);//each ray in composed of two lines that connect back to the outer edge of the ellipse...first ray
     line (165,105,182,60);//each ray also varies in size for a better look
     line (182,60,200,100);//second ray
     line (200,100,260,10);
     line (260,10,265,124);//third ray
     line (265,124,330,75);
     line (330,75,295,165);//fourth ray
     line (295,165,380,175);
     line (380,175,300,205);//fifth ray
     line (300,205,355,250);
     line (355,250,285,255);//sixth ray
     line (285,255,350,360);
     line (350,360,250,286);//seventh ray
     line (250,286,250,340);
     line (250,340,210,300);//eight ray
     line (210,300,170,390);
     line (170,390,165,295);//nineth ray
     line (165,295,85,380);
     line (85,380,123,265);//tenth ray
     line (123,265,40,260);
     line (40,260,103,220);//eleventh ray
     line (103,220,10,160);
     line (10,160,112,150);//twelfth ray
     line (112,150,85,120);
     line (85,120,130,128);//thirteenth ray
  }
  
     if (value == 1){//allows program to make a decision about which code to execute
       background (0);//making the background black contrasting from the previous white  backgroung
       stroke (255);//makes everything drawn white
        
         ellipseMode (CORNERS);//make up the moon same size as the sun
     ellipse (100,100,300,300);//same parameters as the sun
     
     line (10, 10, 20, 20);//These are all the line that make up the stars
     line (10, 20, 20, 10);//each star is make up of four combinations of lines
     line (10, 15, 20, 15);
     line (15, 10, 15, 20);//small top left corner star...star is more square
     line (45, 30, 60, 40);
     line (60, 30, 45, 40);
     line (52.5, 30, 52.5, 40);
     line (45, 35, 60, 35);//star below the first star..more rectangular width wise
     line (250, 60, 270, 80);
     line (250, 80, 270, 60);
     line (260, 60, 260, 80);
     line (250, 70, 270, 70);//star is more square like it is located on the outer rim of the moon in its top right corner
     line (30, 300, 50, 330);
     line (30, 330, 50, 300);
     line (30, 315, 50, 315);
     line (40, 300, 40, 330);//larger star, longer, is the larger star in the lower left corner
     line (90, 350, 100, 360);
     line (90, 360, 100, 350);
     line (95, 350, 95, 360);
     line (90, 355, 100, 355);//small square star in lower left corner
     line (50, 250, 70, 270);
     line (50, 270, 70, 250);
     line (60, 250, 60, 270);
     line (50, 260, 70, 260);//square star located in the left side of the moon alittle lower than middle
     line (300, 45, 330, 60);
     line (300, 60, 330, 45);
     line (315, 45, 315, 60);
     line (300, 52.5, 330, 52.5);//rectangular star width wise located in the top right corner
     line (350, 100, 360, 110);
     line (350, 110, 360, 100);
     line (355, 100, 355, 110);
     line (350, 105, 360, 105);//small square star located closest to the right edge of the fram
     line (330, 150, 350, 170);
     line (330, 170, 350, 150);
     line (340, 150, 340, 170);
     line (330, 160, 350, 160);//square star located just below the previous one
     line (350, 360, 370, 380);
     line (350, 380, 370, 360);
     line (360, 360, 360, 380);
     line (350, 370, 370, 370);//square star in the very bottom right corner
     line (300, 330, 310, 340);
     line (300, 340, 310, 330);
     line (305, 330, 305, 340);
     line (300, 335, 310, 335);//small square star in the lower right corner
     line (50, 100, 65, 120);
     line (50, 120, 65, 100);
     line (57.5, 100, 57.5, 120);
     line (50, 110, 65, 110);//rectangular star lenght wise on the outer rim of the moon in the top left corner
     line (120, 45, 140, 70);
     line (120, 70, 140, 45);
     line (130, 45, 130, 70);
     line (120, 57.5, 140, 57.5);//larger rectangular star width wise in the upper left hand corner
     line (150, 30, 160, 40);
     line (150, 40, 160, 30);
     line (155, 40, 155, 30);
     line (150, 35, 160, 35);//small square star located near the upper udge of the screen
     line (250, 330, 270, 355);
     line (250, 355, 270, 330);
     line (260, 330, 260, 355);
     line (250, 342.5, 270, 342.5);//large rectangular star length wise located just below the moon
     line (200, 370, 210, 380);
     line (200, 380, 210, 370);
     line (205, 370, 205, 380);
     line (200, 375, 210, 375);//small square star closest to the bottom of the screen
     line (170, 310, 185, 320);
     line (170, 320, 185, 310);
     line (170, 315, 185, 315);
     line (177.5, 310, 177.5, 320);//small rectangular star width wise located just below the moon
    
     }
}
       
       
     
void mousePressed ( ) {// this sets the program so that when the mouse is pressed it changes to the... 
       if(value==1) {//...second image, remeber not to set the value to 0 beacuse that was messing you up
         value=0;//the initial value as stated at the start of the programing
       } else {//allws the program to choose between my two blocks of code
         value=1;
       }
     }
     
     
     








  

