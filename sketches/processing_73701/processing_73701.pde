
    int myColor;
    int dir;
    int x;
    float y;
    float z;
  


void setup(){
   //colorMode(HSB,360,100,100,100);
    background(0,15,20);
    size(800,800);
    smooth();
    strokeWeight(.5);
      myColor = 10;
      x = 0;
      dir = 1;
      y = 10;
      z = 30;
}


void draw(){
//Shows mouse location
//frameRate(100);
    println(mouseX + " : " + mouseY);
  
// LINES
    myColor += 1;
    stroke(myColor,100,100,40); //makes arch orange instead of green

//ARCHED LINE orange
    line(width,myColor,myColor*1,0); 
    
//LINEAR LINE top L to botom R   
    line(800,height,myColor+1,myColor); 

//LINEAR LINE blue fill top R
    stroke(0,60,230);
    line(800,50,myColor+1,myColor-1); 



// CIRCLE 1 PINK looped
      //  y += 1; makes green comet line wide and follow diagonal edge
    stroke(myColor+7);
    fill(162,0,158,20);
  //ellipse(width/2, height/2,x,x);
    ellipse(750,800,y+400,x);
        
          if(x > 450){
                x = 1;
          }
      
      
          x = x+2;
          
    
            
   
// CIRCLE 2 Orange Stroke
    stroke(249,158,30);
 
 // fill(162,0,158,20);
  ellipse(750,800,mouseX,mouseY);
             if(y > 600){
                  dir = 0;
  }


// CIRCLE 2 GREEN from top left corner (comet line)
   stroke(myColor-90);
   fill(0,208,25,70);
   ellipse(myColor/2,myColor,2,y-2);
             if(x > 800){
                  dir = -1;       
                           } 
            
             if(x < 100){
                  dir = 1;
                          }
                          
             if(y > 100){
                  dir = +1;
                           }
                          
             if(y > 300){
                  dir = -1;
                           }
  
   
    stroke(0,200,120,20);   
    line(z-30,y-10, pmouseX, pmouseY);
             if(z > 60){
                  dir = -1;
                           }
           
             if(y < 600){
                  dir = 0;
                           }
}
   
   
   

                
 

