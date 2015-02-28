
//PFont f;           //designates variable f
void setup (){
   size (450,550);      // set up wondow
   noCursor();     //no cursor
  // f = loadFont("OldEnglishTextMT-48.vlw");       // loads old english font
}


void draw (){
  background (255);           // set background to white
  smooth ();
  //PImage b;                   // loads picture of the Daily Planet   
 // b =loadImage("daily.jpg");  //from the city of metropolis
 // image(b,100, 225);          //places image in the bottom center
 


 // textFont(f,48);                 // size of font set to 48 pixels
 // fill(0);                        // black color
 // text("Metropolis", 100, 50);    //prints metropolis at the top of the screen

  if (mousePressed == true){       //when mouse pressed the following occurs
  
   
   
   fill(255);                    //makes the  white cape around superman
    bezier(mouseX-7,mouseY+15,mouseX-30,mouseY+30, mouseX-20,mouseY+50,mouseX-40,mouseY+50);
    bezier(mouseX-40,mouseY+50,mouseX-15,mouseY+60, mouseX-15,mouseY+60,mouseX-15,mouseY+75);
    bezier(mouseX-15,mouseY+75,mouseX,mouseY+70, mouseX+10,mouseY+50,mouseX+25,mouseY+70);
    bezier(mouseX+25,mouseY+70,mouseX+20,mouseY+25, mouseX+20,mouseY+25,mouseX+10,mouseY+20);
   
 
  
  
  fill(0);        //makes the following black
 
    ellipse(mouseX, mouseY+1, 15,20);    //head
    triangle(mouseX-18,mouseY+11, mouseX+16,mouseY+15 ,mouseX, mouseY+55); // chest
    rect(mouseX-3,mouseY+10,4,10);    // neck
    rect(mouseX-9,mouseY+37,18,10);    //waist
    
    ellipse(mouseX-7,mouseY+57, 12,20);  // left thigh
    ellipse(mouseX-8,mouseY+75, 10,20);    // left calf
    rect(mouseX-10,mouseY+84, 4,8);         //left foot
    
    ellipse(mouseX+10,mouseY+52, 16,11);   //right thigh
    ellipse(mouseX+10,mouseY+60, 8,10);    //right calf
    rect(mouseX+10,mouseY+65,3,6);         //right foot
    
   ellipse(mouseX+14,mouseY+24, 8,15);    // right arm
   ellipse(mouseX+19,mouseY+28, 12,7);   // right forearm
   ellipse(mouseX+27,mouseY+28,5,5);   // right hand
   
    ellipse(mouseX-15,mouseY+10, 10,25);   // left arm
    ellipse(mouseX-17,mouseY-8, 8,15);   // left forearm
    ellipse(mouseX-17,mouseY-18, 5,5);    //left hand
    
    fill(255);        //white
    triangle(mouseX-10,mouseY+17, mouseX+10,mouseY+17,mouseX,mouseY+40);  // white traigle on the chest
      
     // textFont(f,25);           //font size 25 pixels
  //fill(0);
  //text("s", mouseX-4, mouseY+32);     //black superman "s" inside the white triangle
    
     fill(255);                // makes the following white
  rect(10, 350, 75, 200);     // makes left building, building 1
  rect(325, 375, 100, 200);    // makes right building
  
  fill (0);                    
  rect(15, 353, 17,10);       // white windows, building 1,top floor
  rect(37, 353, 17,10);
  rect(60, 353, 17,10);
  rect(15, 375, 17,10);       //windows, building 1, 6th floor
  rect(37, 375, 17,10);
  rect(60, 375, 17,10);
  rect(15, 400, 17,10);       //windows, building 1, 5th floor
  rect(37, 400, 17,10);
  rect(60, 400, 17,10);
  rect(15, 425, 17,10);      // windows, building 1, 4th floor
  rect(37, 425, 17,10);
  rect(60, 425, 17,10);
  rect(15, 450, 17,10);      // windows, building 1, 3rd floor
  rect(37, 450, 17,10);
  rect(60, 450, 17,10);  
  rect(15, 475, 17,10);      // windows, building 1, 2nd floor
  rect(37, 475, 17,10);
  rect(60, 475, 17,10);  
  rect(15, 500, 17,10);      // windows, building 1, 1st floor
  rect(37, 500, 17,10);
  rect(60, 500, 17,10);
  rect(37, 520, 20, 25);     // door of building 1
  
  rect(333, 380, 17,10);     // white windows, building left, top floor
  rect(355, 380, 17,10);
  rect(377, 380, 17,10);
  rect(400, 380, 17,10);
  rect(333, 400, 17,10);     // windows, building 2, 6th floor
  rect(355, 400, 17,10);
  rect(377, 400, 17,10);
  rect(400, 400, 17,10);
  rect(333, 420, 17,10);     // windows, building 2, 5th floor
  rect(355, 420, 17,10);
  rect(377, 420, 17,10);
  rect(400, 420, 17,10);
  rect(333, 440, 17,10);     // windows, building 2, 4th floor
  rect(355, 440, 17,10);
  rect(377, 440, 17,10);
  rect(400, 440, 17,10);
  rect(333, 460, 17,10);     // windows, building 2, 3rd floor
  rect(355, 460, 17,10);
  rect(377, 460, 17,10);
  rect(400, 460, 17,10);
  rect(333, 480, 17,10);     // windows, building 2, 2nd floor
  rect(355, 480, 17,10);
  rect(377, 480, 17,10);
  rect(400, 480, 17,10);
  rect(333, 500, 17,10);     // windows, building 2, 1st floor
  rect(355, 500, 17,10);
  rect(377, 500, 17,10);
  rect(400, 500, 17,10);
  rect(365, 520, 20,30);      // door of building 2
  
  rect(0,540, 450,10);      // sidewalk
}
    else{            //when the mouse is not pressed
      fill (255);   //makes the following white
      ellipse (mouseX+7, 490, 12, 15);    //head
      rect(mouseX,500,15,20);               //chest
      quad(mouseX+7, 522, mouseX+14, 522, mouseX+17,550, mouseX+8, 550);    //right legs
      quad(mouseX+7, 522, mouseX-1, 522, mouseX-4, 550, mouseX+5,550);       //left legs
      
      ellipse(mouseX+4,488, 4,4);   //glasses
      ellipse(mouseX+10,488, 4,4);
      line (mouseX+6,488,mouseX+8,488);
      point(mouseX+4, 488);          //eyes
      point(mouseX+10, 488);
      quad( mouseX-1, 501, mouseX-3, 501, mouseX-5, 525, mouseX-1, 525);      //left arm
      quad( mouseX+18, 501, mouseX+16, 501, mouseX+16, 525, mouseX+20, 525);    //right arm
      
       fill(0);
  rect(10, 350, 75, 200);     // makes left building, bbuilding 1
  rect(325, 375, 100, 200);    // makes right building
  
  
  fill (255);                    
  rect(15, 353, 17,10);       // white windows, building 1,top floor
  rect(37, 353, 17,10);
  rect(60, 353, 17,10);
  rect(15, 375, 17,10);       //windows, building 1, 6th floor
  rect(37, 375, 17,10);
  rect(60, 375, 17,10);
  rect(15, 400, 17,10);       //windows, building 1, 5th floor
  rect(37, 400, 17,10);
  rect(60, 400, 17,10);
  rect(15, 425, 17,10);      // windows, building 1, 4th floor
  rect(37, 425, 17,10);
  rect(60, 425, 17,10);
  rect(15, 450, 17,10);      // windows, building 1, 3rd floor
  rect(37, 450, 17,10);
  rect(60, 450, 17,10);  
  rect(15, 475, 17,10);      // windows, building 1, 2nd floor
  rect(37, 475, 17,10);
  rect(60, 475, 17,10);  
  rect(15, 500, 17,10);      // windows, building 1, 1st floor
  rect(37, 500, 17,10);
  rect(60, 500, 17,10);
  rect(37, 520, 20, 25);     // door of building 1
  
  rect(333, 380, 17,10);     // white windows, building left, top floor
  rect(355, 380, 17,10);
  rect(377, 380, 17,10);
  rect(400, 380, 17,10);
  rect(333, 400, 17,10);     // windows, building 2, 6th floor
  rect(355, 400, 17,10);
  rect(377, 400, 17,10);
  rect(400, 400, 17,10);
  rect(333, 420, 17,10);     // windows, building 2, 5th floor
  rect(355, 420, 17,10);
  rect(377, 420, 17,10);
  rect(400, 420, 17,10);
  rect(333, 440, 17,10);     // windows, building 2, 4th floor
  rect(355, 440, 17,10);
  rect(377, 440, 17,10);
  rect(400, 440, 17,10);
  rect(333, 460, 17,10);     // windows, building 2, 3rd floor
  rect(355, 460, 17,10);
  rect(377, 460, 17,10);
  rect(400, 460, 17,10);
  rect(333, 480, 17,10);     // windows, building 2, 2nd floor
  rect(355, 480, 17,10);
  rect(377, 480, 17,10);
  rect(400, 480, 17,10);
  rect(333, 500, 17,10);     // windows, building 2, 1st floor
  rect(355, 500, 17,10);
  rect(377, 500, 17,10);
  rect(400, 500, 17,10);
  rect(365, 520, 20,30);      // door of building 2
  
  rect(0,540, 450,10);      // sidewalk
  
}
}


    //My monster is an alien, and to be more specific, my version on Superman. Using processing I have created a little world for Clark Kent/Superman to interact with a user.
//In my little city there are 2 buildings I made complete with windows and doorways. When I wanted to input an image I used processing resources to learn how to display a 
//picture and thus put the Daily Planet building as a centerpiece. To make sure any user would be aware of my goal I put “Metropolis” in big black Old English letters over the city.
//My goal was for Kent, my boring white figure with glass, to follow the cursor around but never to leave the sidewalk, therefore I only X coordinate is attached to the mouse. Then once 
//the mouse was pressed, Clark would turn into a black Superman figure with a large “S” on it is chest as well as a cape. Not only would the person change but the buildings, windows and 
//everything else would flip colors, white turns black and black turns white. Now that the user controls Superman it follows the mouse X and Y coordinate, because of course Superman can fly.
	//My intent for my processing monster besides making Superman was to set an example of performative identity similar to Dr. Horrible Sing-a-long Blog. Any superhero is going to
//have two identities and not all of them are going to be as black and white as my monster. As seen in class the line between the two can blur and be threatened when unforeseen circumstances
//cause the two to conflict.


