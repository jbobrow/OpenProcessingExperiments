
void setup()
{
    size (120,100);
    background(255,255,255);
}

void draw()
{
smooth();
//rainbow//
noStroke();
fill(255,0,0); //red
    rect(0,28,30,10);
fill(255,128,0); //organge
    rect(0,35,30,10);
fill(255,255,0); //yellow
    rect(0,42,30,10);
fill(44,222,0); //green
    rect(0,48,30,10);
fill(104,65,252); //blue
    rect(0,55,30,10);
fill(64,20,105); //indigo
    rect(0,62,30,10);

//cat body//
stroke (0,0,0);
strokeWeight(2);
fill (150,150,150);
    ellipse(20,55,20,7); //tail 
    
//feet
    ellipse(30,75,10,15); //foot1
    ellipse(39,75,10,15); //foot2
    ellipse(60,75,10,15); //foot3
    ellipse(69,75,10,15); //foot4
    
fill(254,203,150);
    rect(25, 25, 60, 50, 7, 7); //poptart crust
noStroke();
fill (255,153,255); 
    rect(30, 30, 50, 40, 7, 7); //poptart frosting
   

   
//sprinkles on body
noStroke();
fill(255,50,154);
    ellipse(40,40,3.5,3.5);
    ellipse(50,50,3.5,3.5);
    ellipse(35,60,3.5,3.5);
    ellipse(55,35,3.5,3.5);
    ellipse(70,40,3.5,3.5);


//cathead//

//ears
stroke(0,0,0);
strokeWeight(2);
fill(150,150,150);
    triangle (58,55,63,40,71,50); //earl
    triangle (75,55,86,40,91,55); //earr

//head
stroke(0,0,0);
strokeWeight(2);    
fill (150,150,150);
    ellipse (75,63,40,30);

//catnose
noStroke();
fill (255,153,255);
    triangle(73, 64, 78, 70, 83, 64); 

//eyes
stroke(0,0,0);
strokeWeight(2);
 fill(0,0,0);
    ellipse(70,59,5,5);
    ellipse(85,59,5,5);
 fill(0,0,0);
    arc(75,72,5,5, 0, PI); //smile
 noStroke(); 
 fill(248,248,255); 
    ellipse(69,58,3,3);
    ellipse(84,58,3,3);   
}
