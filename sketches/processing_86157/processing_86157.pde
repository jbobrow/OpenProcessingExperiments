
int myX;
int myY;



void setup()
{
    size (700,100);
    background(7,0,24);
    myX=100;
    myY=100;
    
}

void draw()
{
  
  myX=mouseX;
  myY=mouseY;
  frameRate(30);
  fill(7,0,24,70); //causes a fading effect
  rect(mouseX,mouseY,-130,100); //rectangle
  println(mouseX+" "+mouseY);
  
//rainbow//
noStroke();
fill(255,0,0); //red with a hexadecimal number,transparency or fade (255,0,0)
    rect(myX-120,myY+28,150,10);
fill(255,128,0); //organge
    rect(myX-120,myY+35,150,10);
fill(255,255,0); //yellow
    rect(myX-120,myY+42,150,10);
fill(44,222,0); //green
    rect(myX-120,myY+48,150,10);
fill(104,65,252); //blue
    rect(myX-120,myY+55,150,10);
fill(64,20,105); //indigo
    rect(myX-120,myY+62,150,10);

//cat body//
stroke (0,0,0);
strokeWeight(2);
fill (150,150,150);
    ellipse(myX+20,myY+55,20,7); //tail 
    
//feet
    ellipse(myX+30,myY+75,10,15); //foot1
    ellipse(myX+39,myY+75,10,15); //foot2
    ellipse(myX+60,myY+75,10,15); //foot3
    ellipse(myX+69,myY+75,10,15); //foot4
    
fill(254,203,150);
    rect(myX+25,myY+25, 60, 50, 7); //poptart crust
noStroke();
fill (255,153,255); 
    rect(myX+30,myY+30, 50, 40, 7); //poptart frosting
   

   
//sprinkles on body
noStroke();
fill(255,50,154);
    ellipse(myX+40,myY+40,3.5,3.5);
    ellipse(myX+50,myY+50,3.5,3.5);
    ellipse(myX+35,myY+60,3.5,3.5);
    ellipse(myX+55,myY+35,3.5,3.5);
    ellipse(myX+70,myY+40,3.5,3.5);


//cathead//

//ears
stroke(0,0,0);
strokeWeight(2);
fill(150,150,150);
    triangle (myX+58,myY+55,myX+63,myY+40,myX+71,myY+50); //earl
    triangle (myX+75,myY+55,myX+86,myY+40,myX+91,myY+55); //earr

//head
stroke(0,0,0);
strokeWeight(2);    
fill (150,150,150);
    ellipse (myX+75,myY+63,40,30);

//catnose
noStroke();
fill (255,153,255);
    triangle(myX+73,myY+64,myX+78,myY+70,myX+83,myY+64); 

//eyes
stroke(0,0,0);
strokeWeight(2);
 fill(0,0,0);
    ellipse(myX+70,myY+59,5,5);
    ellipse(myX+85,myY+59,5,5);
 fill(0,0,0);
    arc(myX+75,myY+72,5,5, 0, PI); //smile
 noStroke(); 
 fill(248,248,255); 
    ellipse(myX+69,myY+58,3,3);
    ellipse(myX+84,myY+58,3,3);   
}
