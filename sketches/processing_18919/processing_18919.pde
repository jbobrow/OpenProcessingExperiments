

//Recreate an image.
//by Jason Fitzgerald
//Week 2
//Notes: I chose the logo for the band Bauhaus.
  
//trying a random color command!
 float face;
 float face2;
   float colorValue;
     float grain; //for use with the 'film grain' effect
       float direction;//film grain effect direction
  
  
void setup(){
   
 background(colorValue); //was faceG
   
  size(400,400);
  grain = 30;//film grain
  direction = random(3);//film grain direction
    smooth();
      frameRate(30);
   
   
}
  
void draw(){
   background(colorValue);
    colorValue = map(mouseX,0,width,0,255);
    
        
  
  face = map(mouseX,0,width,255,0);
  face2 = map(mouseY,0,height,255,0);

  fill(face);
    stroke(face2);
     ellipse(200, 200, 385, 385);

    
     
 //lines
//fill(255);
fill(face2);
  strokeWeight(5);
    rect(150,80,60,60);
   
   
 fill(face2);
   strokeWeight(5);
     strokeCap(SQUARE);
       line(115,80,150,80);
 
  strokeWeight(5);
    strokeCap(SQUARE);
      line(210,175,210,135);
    

  
 //face profile
 strokeWeight(5);
   strokeCap(SQUARE);
     line(275,252,275,23);
     
  strokeWeight(5);
    strokeCap(SQUARE);
      line(275,250,225,250);
      
   strokeWeight(5);
     strokeCap(SQUARE);
        line(275,250,225,250);
        
strokeWeight(5);
  fill(face2);
    rect(245,250,15,95);
    
      fill(face2);
          rect(175,344,85,1);
          
          fill(face2);
            rect(225,295,30,1);
            
            fill(face2);
              rect(199,344,40,43);
              
              fill(face2);
                noFill();
                  strokeWeight(8);
                    ellipse(200,200,385,385);
           
          
              
           
                
  //grain+= direction;{
   // strokeWeight(1);
       // line(grain,0,grain,400);
        
      //  }
       // if(grain > width){
      //    direction = random(35);
     //     grain = 0;
    //    }
     //   if(grain < 0){
       //   direction =1;
        //}
         //if (grain > width){
  //direction = -1;
         }
         // trying to slap another one in here...
   //       grain+= direction;{
 //   strokeWeight(1);
  //      line(grain,0,grain,400);
        
  //      }
   //     if(grain > width){
   //       direction = random(23);
//          grain = 0;
  //      }
  //      if(grain < 0){
  //        direction = -1;
  //      }
  //       if (grain > width){
 // direction = 1;
  //       }
  
//}


