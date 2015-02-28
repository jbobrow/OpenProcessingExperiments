
float rx, ry;    // rectangle x- and y-coordinate
float rd = 100;  // rectangle width
  
float ex, ey;    // ellipse x- and y-coordinate
float ed = 106;  // ellipse diameter
int c;
float eyejitter;

float rchange;
float gchange;
float bchange;


//variables for the fish
float scalesr=random(165,200);
float scalesg=random(155,190);
float scalesb=random(165,200);


void setup() {
  //essentials
  size(640, 360);
  smooth();   
     background(random(5,25),random(30,45),random(75,110));
     noStroke();
          
eyejitter=random(0,15);
    
    
    //fish body
       background(random(5,25),random(30,45),random(75,110));
   
 fill(random(0,50),random(0,50),random(0,50));
     ellipse((width- 300),height/2,420+random(0,75), 150+random(0-60));
     triangle(80-random(0,10), random(40,100), 80-random(0,10), height-random(20,150), random(250,350), height/2);//backfin
   triangle(width/2-random(40,100), height/2, width/2+random(80,140), height/2, random(225,300), height/4-random(20,55));
 triangle(width/2-random(40,100), height/2, width/2+random(80,140), height/2, random(225,300), 3*height/4+random(0,15));
}
 
  void draw() {  
    noCursor();    
     noFill();
      
  

 //interactive blue circle
float d = dist(mouseX, mouseY, width/2, 300);
    float f = dist(mouseX, mouseY, width/2+225, 300);

if (d<(ed/2)){
  gchange+=1;
  rchange+=1;
}
      
//interactive red square
else if((mouseX>345) && (mouseX < 445 ) && (mouseY >250 ) && (mouseY < 350)){
  bchange+=1;
  gchange+=1;
}

//interactive red square
else if((mouseX>420) && (mouseX < 520 ) && (mouseY >250 ) && (mouseY < 350)){
  bchange+=1;
  rchange+=1;
}


//interactive white circle
    
else if (f<(ed/2)){
  gchange=0;
  rchange=0;
  bchange=0;
}
      

/*   
else if ((  {bchange=0;
gchange=0;
rchange=0;}
*/


//press mouse
 if(mousePressed) {  

   
//fish  
   background(random(5,25),random(30,45),random(75,110));
   
   
 fill(random(0,50),random(0,50),random(0,50));
     ellipse((width- 300),height/2,420+random(0,75), 150+random(0-60));
     triangle(80-random(0,10), random(40,100), 80-random(0,10), height-random(20,150), random(250,350), height/2);//backfin
   triangle(width/2-random(40,100), height/2, width/2+random(80,140), height/2, random(225,300), height/4-random(20,55));
 triangle(width/2-random(40,100), height/2, width/2+random(80,140), height/2, random(225,294), 3*height/4+random(0,15));


  } else {
    
    
  }
     
  noStroke();
  
  //buttons
  rectMode(CENTER);
    fill(220,100,100);
    rect(width/2 +75, 300, rd/2, rd/2);
 
   rectMode(CENTER);
    fill(100,220,100);
    rect(width/2 +150, 300, rd/2, rd/2);
 
    fill(40,40,190);
  ellipse(width/2, 300, ed/2, ed/2);
         
         fill(244,244,244);
  ellipse(width/2+225, 300, ed/2, ed/2);
     
     
     //scales
       fill(scalesr-rchange-random(0,30),scalesg-gchange-random(0,30),scalesb-bchange-random(0,30));
       
triangle(pmouseX, pmouseY, pmouseX+10, pmouseY, pmouseX+5, pmouseY-10);
     ellipse(pmouseX+5, pmouseY+3, 12,12);
     triangle(pmouseX, pmouseY, pmouseX+10, pmouseY, pmouseX+5, pmouseY-10);
      triangle(pmouseX, pmouseY+5, pmouseX+10, pmouseY+5, pmouseX+5, pmouseY+15);
     
     
 fill(255);
 ellipse((width-150),height/2-25,5+eyejitter, 5+eyejitter*.2);
  
  }


