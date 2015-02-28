
PImage web;

PImage spiral;

PImage transweb; PImage transvortex;

boolean spider = false;

boolean back = false;

boolean stop = false;

boolean pic1 = false;
boolean pic2 = false;

boolean paused = false;

boolean red = false;

boolean green = false;

boolean blue = false;

boolean pink = false;

boolean bigwhite = false;

boolean lilwhite = false;

boolean square = false;

boolean one = false;

boolean two = false; 
boolean three = false; 
boolean four = false; 
boolean five = false; 
boolean six = false;

void setup(){
  
  size(800,800);
  background(170);
web = loadImage ("LUKAS5.png");  
spiral = loadImage ("LUKAS6.png");

transweb = loadImage ("2LUKAS.png");
transvortex = loadImage ("1LUKAS.png");

}

void draw(){
 
 if(stop == false){ 
 
  if(pic2 == false){
   
   image(spiral,0,0,800,800);
    
  }
  
  

 stroke(255);

  line(0,0,mouseX,mouseY);
  line(800,800,mouseX,mouseY);
  line(0,800,mouseX,mouseY);
  line(800,0,mouseX,mouseY);
  
  if(lilwhite == false){
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
   line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));line(mouseX,mouseY,random(0,800),random(0,800));line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  
  line(mouseX+200,mouseY+200,random(0,800),random(0,800));
   line(mouseX+200,mouseY+200,random(0,800),random(0,800));
    line(mouseX+200,mouseY+200,random(0,800),random(0,800));
     line(mouseX+200,mouseY+200,random(0,800),random(0,800));
      line(mouseX+200,mouseY+200,random(0,800),random(0,800));
       line(mouseX+200,mouseY+200,random(0,800),random(0,800));
        line(mouseX+200,mouseY+200,random(0,800),random(0,800));
         line(mouseX+200,mouseY+200,random(0,800),random(0,800)); line(mouseX+200,mouseY+200,random(0,800),random(0,800));
          line(mouseX+200,mouseY+200,random(0,800),random(0,800));
           line(mouseX+200,mouseY+200,random(0,800),random(0,800));
            line(mouseX+200,mouseY+200,random(0,800),random(0,800));
             line(mouseX+200,mouseY+200,random(0,800),random(0,800));
              line(mouseX+200,mouseY+200,random(0,800),random(0,800));
               line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                 line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                  line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                   line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                    line(mouseX+200,mouseY+200,random(0,800),random(0,800)); line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                     line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                      line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                       line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                        line(mouseX+200,mouseY+200,random(0,800),random(0,800));
                        
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 line(mouseX-200,mouseY-200,random(0,800),random(0,800));
 

 line(mouseX+200,mouseY-200,random(0,800),random(0,800));
 line(mouseX+200,mouseY-200,random(0,800),random(0,800));                 
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
  line(mouseX+200,mouseY-200,random(0,800),random(0,800));
 
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
  line(mouseX-200,mouseY+200,random(0,800),random(0,800));
}
  
  //larger square lines
  
  if(bigwhite == false){
  
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  line(mouseX-400,mouseY-400,random(0,800),random(0,800));
  
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  line(mouseX+400,mouseY+400, random(0,800),random(0,800));
  
  
    line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
   line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
     line(mouseX-400,mouseY+400, random(0,800),random(0,800));
    line(mouseX+400,mouseY-400, random(0,800),random(0,800));
}
  
 
 if(back == false){
  
  noStroke();
  fill(0,20);
  rect(0,0,800,800);
 
 
 fill(255,20);
rect(0,0,800,800); }



 if(paused == false) {
    stroke(random(0,255),random(0,255),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));
  line(mouseX,mouseY,random(0,800),random(0,800));  
   line(mouseX,mouseY,random(0,800),random(0,800));
     line(mouseX,mouseY,random(0,800),random(0,800));
       line(mouseX,mouseY,random(0,800),random(0,800));
         line(mouseX,mouseY,random(0,800),random(0,800));
           line(mouseX,mouseY,random(0,800),random(0,800));
             line(mouseX,mouseY,random(0,800),random(0,800));
               line(mouseX,mouseY,random(0,800),random(0,800));
                 line(mouseX,mouseY,random(0,800),random(0,800));
                   line(mouseX,mouseY,random(0,800),random(0,800));
                     line(mouseX,mouseY,random(0,800),random(0,800));
                     
   
   line(random(0,800),random(0,800),mouseX,mouseY);
   line(random(0,800),random(0,800),mouseX,mouseY);
    line(random(0,800),random(0,800),mouseX,mouseY);
    line(random(0,800),random(0,800),mouseX,mouseY);
    line(random(0,800),random(0,800),mouseX,mouseY);
   
   line(0,0,mouseX,mouseY);
  line(800,800,mouseX,mouseY);
  line(0,800,mouseX,mouseY);
  line(800,0,mouseX,mouseY);
  line(mouseX,mouseY,random(0,400),random(0,400));

    
  }
  
  
  if(square == false) {
    
    stroke(random(0,800),random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    line(100,100,random(0,800),random(0,800));
    
    
    
    
    line(200,100,random(0,800),random(0,800));
    line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));line(200,100,random(0,800),random(0,800));
    
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    line(300,100,random(0,800),random(0,800));
    
    
    line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));
line(400,100,random(0,800),random(0,800));

         
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     line(500,100,random(0,800),random(0,800));
     
     
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     line(600,100,random(0,800),random(0,800));
     
     line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800));
   line(700,100,random(0,800),random(0,800)); 
   
  }
  
  
  if(one == false) {
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   line(100,200,random(0,800),random(0,800));
   
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   line(200,200,random(0,800),random(0,800));
   
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   line(300,200,random(0,800),random(0,800));
   
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   line(400,200,random(0,800),random(0,800));
   
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   line(500,200,random(0,800),random(0,800));
   
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   line(600,200,random(0,800),random(0,800));
   
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   line(700,200,random(0,800),random(0,800));
   
   
  }
  
  if(two == false) {
    
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    line(100,300,random(0,800),random(0,800));
    
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    line(200,300,random(0,800),random(0,800));
    
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    line(300, 300,random(0,800),random(0,800));
    
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    line(400,300,random(0,800),random(0,800));
    
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    line(500,300,random(0,800),random(0,800));
    
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    line(600,300,random(0,800),random(0,800));
    
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    line(700,300,random(0,800),random(0,800));
    
    
  }
  
  if(three == false) {
  
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  line(100,400,random(0,800),random(0,800));
  
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  line(200,400,random(0,800),random(0,800));
  
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  line(300,400,random(0,800),random(0,800));
  
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  line(400,400,random(0,800),random(0,800));
  
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  line(500,400,random(0,800),random(0,800));
  
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  line(600,400,random(0,800),random(0,800));
  
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  line(700,400,random(0,800),random(0,800));
  
  }
  
  if(four == false) {
   
   line(100,500,random(0,800),random(0,800)); 
   line(100,500,random(0,800),random(0,800)); 
  line(100,500,random(0,800),random(0,800)); 
 line(100,500,random(0,800),random(0,800)); 
line(100,500,random(0,800),random(0,800)); 
line(100,500,random(0,800),random(0,800)); 
line(100,500,random(0,800),random(0,800)); 
line(100,500,random(0,800),random(0,800)); 
line(100,500,random(0,800),random(0,800)); 
line(100,500,random(0,800),random(0,800)); 

line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 
line(200,500,random(0,800),random(0,800)); 

line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 
line(300,500,random(0,800),random(0,800)); 

line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));
line(400,500,random(0,800),random(0,800));

line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));
line(500,500,random(0,800),random(0,800));

line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));
line(600,500,random(0,800),random(0,800));

line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));
line(700,500,random(0,800),random(0,800));

  }
  
  if(five == false) {
    
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 line(100,600,random(0,800),random(0,800));
 
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 line(200,600,random(0,800),random(0,800));
 
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 line(300,600,random(0,800),random(0,800));
 
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 line(400,600,random(0,800),random(0,800));
 
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 line(500,600,random(0,800),random(0,800));
 
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 line(600,600,random(0,800),random(0,800));
 
 line(700,600,random(0,800),random(0,800));
 line(700,600,random(0,800),random(0,800));
 line(700,600,random(0,800),random(0,800));
 line(700,600,random(0,800),random(0,800));
 line(700,600,random(0,800),random(0,800));
 line(700,600,random(0,800),random(0,800));
 line(700,600,random(0,800),random(0,800));
  }
  
  if(six == false) {
    
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   line(100,700,random(0,800),random(0,800));
   
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   line(200,700,random(0,800),random(0,800));
   
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   line(300,700,random(0,800),random(0,800));
   
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   line(400,700,random(0,800),random(0,800));
   
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   line(500,700,random(0,800),random(0,800));
   
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   line(600,700,random(0,800),random(0,800));
   
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
   line(700,700,random(0,800),random(0,800));
  }

  
  //added below:
  
   if(red == false) {
     
    stroke(150,0,60);
    line(400,400,random(0,800),random(0,800));
   line(400,400,random(0,800),random(0,800));
    line(400,400,random(0,800),random(0,800));
     line(400,400,random(0,800),random(0,800));
      line(400,400,random(0,800),random(0,800));
       line(400,400,random(0,800),random(0,800));
        line(400,400,random(0,800),random(0,800));
         line(400,400,random(0,800),random(0,800));
          line(400,400,random(0,800),random(0,800));
           line(400,400,random(0,800),random(0,800));
            line(400,400,random(0,800),random(0,800));
             line(400,400,random(0,800),random(0,800));
              line(400,400,random(0,800),random(0,800));
               line(400,400,random(0,800),random(0,800));
                line(400,400,random(0,800),random(0,800));
                 line(400,400,random(0,800),random(0,800));
                  line(400,400,random(0,800),random(0,800));
                   line(400,400,random(0,800),random(0,800));
                    line(400,400,random(0,800),random(0,800));
                     line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800));
                      line(400,400,random(0,800),random(0,800));
                       line(400,400,random(0,800),random(0,800));
                        line(400,400,random(0,800),random(0,800));
   }
  
  if(green == false) {
  
  stroke(0,150,100);
  line(400,400,random(0,800),random(0,800));
   line(400,400,random(0,800),random(0,800));
    line(400,400,random(0,800),random(0,800));
     line(400,400,random(0,800),random(0,800));
      line(400,400,random(0,800),random(0,800));
       line(400,400,random(0,800),random(0,800));
        line(400,400,random(0,800),random(0,800));
         line(400,400,random(0,800),random(0,800));
          line(400,400,random(0,800),random(0,800));
           line(400,400,random(0,800),random(0,800));
            line(400,400,random(0,800),random(0,800));
             line(400,400,random(0,800),random(0,800));
              line(400,400,random(0,800),random(0,800));
               line(400,400,random(0,800),random(0,800));
                line(400,400,random(0,800),random(0,800));
                 line(400,400,random(0,800),random(0,800));
                  line(400,400,random(0,800),random(0,800));
                   line(400,400,random(0,800),random(0,800));
                    line(400,400,random(0,800),random(0,800));
                     line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800));
                      line(400,400,random(0,800),random(0,800));
                       line(400,400,random(0,800),random(0,800));
                        line(400,400,random(0,800),random(0,800));
  }
  
  
  if(blue == false){
      stroke(0,80,200);
  line(400,400,random(0,800),random(0,800));
   line(400,400,random(0,800),random(0,800));
    line(400,400,random(0,800),random(0,800));
     line(400,400,random(0,800),random(0,800));
      line(400,400,random(0,800),random(0,800));
       line(400,400,random(0,800),random(0,800));
        line(400,400,random(0,800),random(0,800));
         line(400,400,random(0,800),random(0,800));
          line(400,400,random(0,800),random(0,800));
           line(400,400,random(0,800),random(0,800));
            line(400,400,random(0,800),random(0,800));
             line(400,400,random(0,800),random(0,800));
              line(400,400,random(0,800),random(0,800));
               line(400,400,random(0,800),random(0,800));
                line(400,400,random(0,800),random(0,800));
                 line(400,400,random(0,800),random(0,800));
                  line(400,400,random(0,800),random(0,800));
                   line(400,400,random(0,800),random(0,800));
                    line(400,400,random(0,800),random(0,800));
                     line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800));
                      line(400,400,random(0,800),random(0,800));
                       line(400,400,random(0,800),random(0,800));
                        line(400,400,random(0,800),random(0,800));
                  
  }
  
  
  if(pink == false){
  
    
    stroke(255,150,150);
  line(400,400,random(0,800),random(0,800));
   line(400,400,random(0,800),random(0,800));
    line(400,400,random(0,800),random(0,800));
     line(400,400,random(0,800),random(0,800));
      line(400,400,random(0,800),random(0,800));
       line(400,400,random(0,800),random(0,800));
        line(400,400,random(0,800),random(0,800));
         line(400,400,random(0,800),random(0,800));
          line(400,400,random(0,800),random(0,800));
           line(400,400,random(0,800),random(0,800));
            line(400,400,random(0,800),random(0,800));
             line(400,400,random(0,800),random(0,800));
              line(400,400,random(0,800),random(0,800));
               line(400,400,random(0,800),random(0,800));
                line(400,400,random(0,800),random(0,800));
                 line(400,400,random(0,800),random(0,800));
                  line(400,400,random(0,800),random(0,800));
                   line(400,400,random(0,800),random(0,800));
                    line(400,400,random(0,800),random(0,800));
                     line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800)); line(400,400,random(0,800),random(0,800));
                      line(400,400,random(0,800),random(0,800));
                       line(400,400,random(0,800),random(0,800));
                        line(400,400,random(0,800),random(0,800));
                        
  }
  
  
  if(spider == false){
  
  image(transweb,random(0,600),random(0,600),random(0,600),random(0,600));
  
  }
  
  
  if(pic1 == false){
  
   fill(0,50);
image(web,0,0,800,800);
  }
  
 }

}



void keyPressed(){
  
  if (key == 'o'){
  
  if(pic1==true){
    pic1 = false;
  }
else{
pic1 =true;
}}

    
  
  //spacebar to pause
  if (key == ' '){
    //if paused means that paused==true;
    //make the program restart again
    
    if(paused==true){
      paused = false;
    }
    //
    else{
      paused = true;
    }
    
    //use the c key to clear the sketch
    if(key == 'c') {
      background(0);
  }
  }

//added below:
if (key == 'r'){
  
  if(red==true){
    red = false;
  }
else{
red =true;
}}


//
 

if (key == 'g'){
  
  if(green==true){
    green = false;
  }
else{
green =true;
}}



if (key == 'b'){
  
  if(blue==true){
    blue = false;
  }
else{
blue =true;
}}


if (key == 'p'){
  
  if(pink==true){
    pink = false;
  }
else{
pink =true;
}}

if (key == 'w'){
  
  if(bigwhite==true){
    bigwhite = false;
  }
else{
bigwhite =true;
}}


if (key == 'l'){
  
  if(lilwhite==true){
    lilwhite = false;
  }
else{
lilwhite =true;
}}

if (key == 's'){
  
  if(square==true){
    square = false;
  }
else{
square =true;
}}

if (key == 'z'){
  
  if(one==true){
    one = false;
  }
else{
two =true;
}}

if (key == 'x'){
  
  if(two==true){
    two = false;
  }
else{
two =true;
}}

if (key == 'v'){
  
  if(three==true){
    three = false;
  }
else{
three =true;
}}

if (key == 'b'){
  
  if(four==true){
    four = false;
  }
else{
four =true;
}}

if (key == 'n'){
  
  if(five==true){
    five = false;
  }
else{
five =true;
}}

if (key == 'm'){
  
  if(six==true){
    six = false;
  }
else{
six =true;
}}


if (key == 'i'){
  
  if(pic2==true){
    pic2 = false;
  }
else{
pic2 =true;
}}

if (key == 'h'){
  
  if(stop==true){
    stop = false;
  }
else{
stop =true;
}}

if (key == '1'){
  
  if(spider==true){
    spider = false;
  }
else{
spider =true;
}}

if (key == '2'){
  
  if(back==true){
    back = false;
  }
else{
back =true;
}}

}





