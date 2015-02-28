
float myNum,x,y,x2,y2,sin,cos,angle,glowLight,i,radius,myVar,t,dir,myFun,posY,posX,ellSize;

PImage myImg,myImg2;

int pos;

void setup(){
  size(800,800);
   myImg=loadImage("kids-clown-costume.jpeg");
   myImg2=loadImage("Dogie.gif");
   background(255);
   colorMode(RGB,100,100,100,100);
   myNum = 0;
   x=0;
   y=0;
   angle=0;
   dir=-1;
    
   i=0;
   ellSize=0;
   myVar=2;
   t=radius*sin(radians(angle));
   smooth();
}
  
  
  void draw(){
    

    
     glowLight=abs(255*sin(radians(angle)));
     
      x=sin*(radius);
      y=cos*(radius);
      
   
   
      for(int i=0;i<10;i++){
     pushMatrix();
        translate (i*300,100);
            imageFlip(myImg2,200,200,"h");
         
     rotate (radians (45));
      image(myImg,100,100);
      
     
          popMatrix();
         
         
      }
      

      
for(int i=0;i<100;i++){
 pushMatrix();
  translate (i*300,0);
    imageFlip(myImg,200,200,"v2");
         
   rotate (radians (65));
    image(myImg,100,100);
     
     popMatrix();
     
}  

for(int i=0;i<100;i++){
 pushMatrix();
  translate (i*700,0);
    imageFlip(myImg,200,200,"v");
         
   rotate (radians (90));
    image(myImg,500,500);

     popMatrix();
     
} 
     
      pos++;
        for(int i = 0; i <100; i++){
         myFun(100,i*25);
         
       //   myFun(pos,pos);
            myFun(mouseX,mouseY);
              for(int t =1; i<100; i++);
                 for(int m =1; i<600; i++);
                 ellSize=cos(x+sin(y))+26*sin(x+cos(y));
    
 }
 
  if(millis()>100000){
  } 
  
      }
  //moving ellipses

    void myFun(float posX,float posY){
   // fill(148,250,252);
       stroke(posY,500,100);
        rect(posY/4,posX/5,posX+1,posY);
                      fill(202,76,97);
                      rect(posY/3,posX*.5,posX,mouseX);
        ellipse(posX,posY,10+posX,10+posY);
      //  fill(195,255,0);
          ellipse(posX,posY,10+posX,10+posY);
            fill(148,250,252);
            ellipse(100,100,00,posX);
             fill(39,99,99);
             ellipse(200,300,100,posX);
              line(posY,posX,posX*2,posY*2);
                line(posY,posX,posX*100,posY*200);
                    line(posY,posX,posX*200,posY*400);
                    line(posY,posX,posX*1,posY*2);
                     
                     
                      fill(148,250,252);
                        x=200*cos(radians(angle))*sin(radians(angle));
                        y=200*sin(radians(angle/10))*t;
                        ellipse(x+2,y+2,10,10);
                         ellipse(800,800,200,200);
                         angle++;
                            

    
    //rectangles on top and bottom
    for(int i=0; i<600; i+=10){
     stroke(random(255),100,100);
      //rect(i,500,200,100);
       rect(i,700,100,100);
}
//rectangles on top and bottom
for(int i=0; i<600; i++){
 stroke(random(255),500,500);
  rect(i+10,0,100,100);
  
}
//dog
   image(myImg2,mouseX,mouseY);
   
    beginShape();
      for(int i=0; i<100; i++){

      
                  fill(255,0,0);
                   ellipse(200,500,250,250);
                   fill(203,255,0);
                   ellipse(400,500,250,250);
                    fill(0,202,255);
                    ellipse(600,500,250,250);


  x=300*t/2;
      y=300*sin(radians(angle/2))*cos(radians(angle));
        ellipse(x+width/2,y+height/2,10,10);
        
        fill(255);
x=400*cos(radians(angle));
  y=300*sin(radians(angle/2));
  ellipse(x+width/2,y+height/2,50,50);
        
          
    x=200*cos(radians(angle))*sin(radians(angle));
      y=200*sin(radians(angle/10))*t;
        ellipse(x+2,y+2,10,10);

   angle--;
       

          //noFill();
          


        vertex(x,y);
    
           endShape();

      }

   
    if(i>500){
       dir=1;
       
     }
       
  
if(mouseX>400){
  fill(185,224,255);
}
else
{
  fill(185,224,255);
}

//clown
    image(myImg2,mouseY,mouseX);
      for(int i=0; i <300; i++){
        stroke(.10);
      }
     
             
//ellipses in bottom center
             // fill(glowLight);
             fill(random(255));
                 ellipse(400,500,200,200);
                    ellipse(520,500,200,200);
                      ellipse(300,500,200,200);
                     
                        angle++;
   



        
       //ellipses in corners
        
        fill(glowLight);
        angle++;
         ellipse(800,800,200,200);
          noStroke();
            fill(glowLight);
            angle++;
          ellipse(myNum,800,200,200);
           noStroke();
             fill(glowLight);
             angle++;
            ellipse(800,myNum,200,200);
             noStroke();
             fill(glowLight);
             angle++;
             ellipse(0,0,200,200);
            // line(300,300,700,400);
             
        
               if(mouseX>700){
                
                 fill(255,226,5);
                 }
                 else{
                 fill(250,96,194);
                 
              
    }

        
 
   if(mousePressed){
   
   


//gradient
                   for(x=0;x<400;x++){
                    stroke(x);
                  ellipse(x,200,200,200);
                  ellipse(x+200,400,200,200);
                  ellipse(x,600,200,200);
                  
                   fill(250,96,194);
    ellipse(400,400,200,200);
    fill(96,250,210);
    ellipse(400,600,100,100);
    fill(188,250,96);
    ellipse(400,700,200,200);
    fill(188,250,96);
    ellipse(400,500,300,200);
stroke(1);

    if(mousePressed){
           stroke(.2);
           fill(359,90,69);
  // fill(glowLight);
           rect(300,300,200,200);
           fill(61,85,99);
           rect(100,300,200,200);
           fill(242,10,157);
           rect(500,300,200,200);
           

     }

                  

   
 glowLight= (255*sin(radians(angle)));
     
        

  
}
   }
}



      



     
   //imageFlip function by nick lally
//paste function at the bottom of your sketch, and use like this: imageFlip(imageName,x,y,"mode")
//modes are "v", "v2", "h", "h2"
//"v" mirrors vertically, "v2" mirrors top half vertically
//"h" mirrors horizontally, "h2" mirrors left half horizontally
void imageFlip(PImage imageName, int xPos, int yPos, String mode){
   
 //records original pixel config so it can set it back at the end
 imageName.loadPixels();
 int ogImage[] = new int[imageName.width*imageName.height];
 for(int i = 0; i < imageName.width*imageName.height; i++){
   ogImage[i] = imageName.pixels[i];
 }
 imageName.updatePixels();
   
 //"v2" flips the top half of the image across the x-axis
 if(mode == "v2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = imageName.pixels[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
   
 //"v" flips the entire image across the x-axis
 }else if(mode == "v"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }
   
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(imageName.height - 1 - i)*(imageName.width) + j] = tempImage[i*(imageName.width) + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
   
 //"h2" flips the left half of the image across the y-axis
 }else if(mode == "h2"){
   imageName.loadPixels();
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[i*imageName.width + j] = imageName.pixels[(i+1)*(imageName.width) - j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
   
 //"h" flips the entire image across the y-axis
 }else if(mode == "h"){
   imageName.loadPixels();
   int tempImage[] = new int[imageName.width*imageName.height];
   for(int i = 0; i < imageName.width*imageName.height; i++){
    tempImage[i] = imageName.pixels[i];
   }
   for(int i = 0; i < imageName.height; i++){
     for(int j = 1; j < imageName.width; j++){
       imageName.pixels[(i+1)*(imageName.width) - j] = tempImage[i*imageName.width + j];
     }
   }
   imageName.updatePixels();
   image(imageName,xPos,yPos);
 } else {
   println("No mirror direction specified!");
   println("Use v, v2, h, or h2 for the 4th argument");
 }
   
 //resets image to original
 imageName.loadPixels();
 for(int i = 0; i < imageName.width*imageName.height; i++){
   imageName.pixels[i] = ogImage[i];
 }
 imageName.updatePixels();
}


