
//boolean myDisplay;
int n = 10;
float[] xTop = new float [n];
float [] xBottom = new float [n];

int myColor;
    int dir;
    int x;
    float y;
    float z;
   int[] a = {100,200,300,400,500,600,700,800};

 
 
void setup(){
   //colorMode(HSB,360,100,100,100);
    background(0);
    size(800,800);
    smooth();
    strokeWeight(.5);
      myColor = 10;
      x = 0;
      dir = 1;
      y = 10;
      z = 30;
    //  myDisplay=false;

}
 
 
void draw(){
  smooth();
//Shows mouse location
//frameRate(100);
   // println(mouseX + " : " + mouseY);



// LEFT OVAL BUTTON TOP  
    noStroke();
        if(mouseX > 17.5 && mouseX < 42.5 && mouseY > 640 && mouseY < 680){
            if(mousePressed){
              //elements borrowed form "Manual Arrays" Linda tutorial
              stroke(21,0,208);
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,800);
                  xBottom[i] = random(0,800);
                  line (xTop[i], 0, xBottom[i],800);
              }  
                  } else { 
                      fill(21,0,208);
                      ellipse(30,660,25,40);
                }
              } else { 
                 fill(0, 80, 188);
                 ellipse(30,660,25,40);

               }


// LEFT OVAL BUTTON MIDDLE
    noStroke();
         if(mouseX > 17.5 && mouseX < 42.5 && mouseY > 690 && mouseY < 730){
             if(mousePressed){
                
             //elements borrowed form "Manual Arrays" Linda tutorial
             stroke(127,0,185);
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,800);
                  xBottom[i] = random(0,800);
                  line (xTop[i], 0, xBottom[i],800);
              }
                    } else { 
                  //  stroke(127,0,185);
                      fill(127,0,185);
                      ellipse(30,710,25,40);

                }
              } else { 
                 fill(0, 80, 188);
                 ellipse(30,710,25,40);

                }
                                
    
// LEFT OVAL BUTTON BOTTOM 
    noStroke();
         if(mouseX > 17.5 && mouseX < 42.5 && mouseY > 740 && mouseY < 780){
             if(mousePressed){
               //elements borrowed form "Manual Arrays" Linda tutorial
             stroke(0,157,131);
              for(int i = 0; i < n; i++) {
                  xTop[i] = random(0,800);
                  xBottom[i] = random(0,800);
                  line (xTop[i], 0, xBottom[i],800);
              }
                    } else { 
                      fill(0,157,131);
                      ellipse(30,760,25,40);

                }
              } else { 
                 fill(0,80,188);
                 ellipse(30,760,25,40);
                }



     
//HOVER TOP LEFT   
    noStroke();    
     if(mouseX > 0 && mouseX < 25 && mouseY > 0 && mouseY < 25){
      if(mousePressed){
           for(int b = -3;b < 10; b++){
             fill(0,108,223);
             text("ಠ_ಠ",b*30,b*100);
      }    
           } else{
                for(int b = 0;b < 10; b++){
                fill(157,0,255);
                text("ಠ_ಠ",b*30,b*100);
             }
   
                }
              } else{
                     fill(0);
                     for(int b = 0;b < 10; b++){
                     text("ಠ_ಠ",b*30,b*100);
                }
     }
   
   
   
   
   
   
   
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
    fill(162,0,158,5);
    ellipse(750,800,y+400,x);
         
          if(x > 450){
                x = 1;
          }
       
       
          x = x+15;
           
     
             
    
// CIRCLE 2 Orange Stroke
    stroke(249,158,30);
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


//HOVER & CLICK BOTTOM RIGHT   
   if(mouseX > 775 && mouseX < 800 && mouseY > 775 && mouseY < 800){
     if(mousePressed){
         stroke(100);
         fill(0,90,159,30);
         ellipse(750,800,y+400,x);
            if(x > 450){
                  x = 1;
            }
            x = x+10;
            
         }else{
             stroke(100);
             fill(0,100,255,20);
             ellipse(750,800,y+400,x);
                if(x > 450){
                      x = 1;
                }
                x = x+10;
                }
           }    
    
}



     


 






    
    
    

