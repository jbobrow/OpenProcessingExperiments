
// Edwin Franco
// Film 20C
// 3/14/14
// For my final project, I decided to create a squad of for UFOs invading planet earth. 
// Of all the "monsters" I could have imagined and created, I selected aliens. 
// After completing this project, I asked myself why that was. Now, the answer seems obvious. 
// My project represents my life-long obsession with extraterrestrial beings, that I developed at a young age. 
// At the age of four, I was very impressionable as most kids are. That was the age that I watched the film "Fire in the Sky." 
// I lived with my cousins and they also frequently watched the X-files.
// The opening music was enough to make my cover my face with bed sheets and cry. 
// This was also around the time there was a flood of news coverage on the "Chupacabra" that circulated around Latin America.
// The being, whose name translates to "Goat sucker" was the subject of many stories my mother told me. 
// It went around drinking the blood of livestock, and one need only Google the being to see his likeness to   
// the big-headed, wide-eyed green aliens with three fingers that society imagines are aliens. 

// This conversation about aliens, unknown beings, and UFO's persisted.
// Despite my fear, I read books to find out more.
// Eventually, this fear turned into hobbies revolving around Science-fiction (games, novels, etc.).
// My project attempts to capture, playfully, my fascination with aliens, and my childhood paranoia that our 
// planet would be taken over by martians in my lifetime.
// If you move to cursor  left or right, the space ships will follow. The center UFO is synched to the mouse, 
// while the surrounding UFOs have a gap of separation from the center one.
// I found an image of earth on processing's database and remixed it with my invaders.


void setup(){
  size(800, 700);
  background(0);
    smooth();
  frameRate(30);
  };
  
void draw() {
    
  background(0);
  
  ellipseMode(CENTER);   
    
  //UFO structure center
  stroke(87); //outlines in grey
  fill(255); // inside is white
  ellipse(mouseX, mouseY-25, 80, 100); //will move along with the mouse
    
  stroke(255); //outlines in white
  fill(87); // inside is grey
  ellipse(mouseX, mouseY, 150, 60); //will move with the mouse
     
 
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY-23, 80,15); //will move with the mouse
  
   //UFO structure top
  stroke(87);
  fill(255);
  ellipse(mouseX, mouseY-225, 80, 100); //will move with the mouse
    
  stroke(255);
  fill(87);
  ellipse(mouseX, mouseY-200, 150, 60); // will move with the mouse
     
  noStroke();
  fill(255);
  ellipse(mouseX, mouseY-223, 80,15); // will move with the mouse
  
  
   //UFO structure left
  stroke(87);
  fill(255);
  ellipse(mouseX-200, mouseY-25, 80, 100); // will move with the mouse
    
  stroke(255);
  fill(87);
  ellipse(mouseX-200, mouseY, 150, 60); // will move with the mouse
     
  noStroke();
  fill(255);
  ellipse(mouseX-200, mouseY-23, 80,15); // will move with the mouse
  
   //UFO structure right
  stroke(87);
  fill(255);
  ellipse(mouseX+200, mouseY-25, 80, 100); // will move with the mouse
    
  stroke(255);
  fill(87);
  ellipse(mouseX+200, mouseY, 150, 60); // will move with the mouse
     
  noStroke();
  fill(255);
  ellipse(mouseX+200, mouseY-23, 80,15); // will move with the mouse

     

   //earth
  noStroke();
  fill(40, 90, 155);
  ellipse(width/2, height+100, 600, 600);
  fill(40, 155, 90);
  ellipse(600, 700, 80, 50);//lower right middle
   
  ellipse(300, 650, 50, 60);//top left
  ellipse(310, 620, 60, 50);
  ellipse(280, 630, 40, 40);
   
  ellipse(500, 600, 50, 50);//top right
  ellipse(480, 600, 30, 30);
  ellipse(520, 580, 40, 40);
  ellipse(500, 580, 30, 30);
   
  ellipse(200, 680, 30, 30);//right corner
  ellipse(210, 660, 50, 50);
  ellipse(180, 670, 50, 40);
}




