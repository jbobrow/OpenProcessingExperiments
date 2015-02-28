
//Denali Schmidt Homework 3
//disco crazy


float x=1;
float y=2;

void setup(){
size (600,600);
background(219,166,166);
smooth();
frameRate (205);
}

void draw(){
  
  for(int i = 0; i < 600; i+=80 ){   // background when mouse is clicked
    for(int j = 0; j< 600; j+=70){
      if ( j % 10 == 0){
        line ( mouseX, mouseY, i,j);
        stroke (0,0,255, 10);
      }
     
        ellipse(i,j,1,1);
    } 
    
            fill (random(255), random (255), random (255));
            noStroke();
            ellipse (x, y, 40,40);
  }
      
     if(mousePressed == true){        // what happens when mouse is clicked
     fill(0,0,0,1);
     rect (0,0,width,height);
     //  fill (0,0,0,1);
      // rect((0),(0), mouseX, mouseY);
       
     //if( mousePressed == false){
          // ellipse (width/2, height/2, 30,30);
    // }
       
       // if (rect((width/2), (height/2), 60, 60){
            //  fill(213,219,166,20);
     // }
              // for (int k = 0; k = (mouseX) && (mouseY); k +=3){
             //  ellipse (k,k,5,5);
       // }
                for (int k = 0; k <600; k += mouseX){
                  for(int m = 0; m < 600; m += mouseY){
                    //background (255,1);
                  // float backgroundColor = map(mouseX, 0, 600, 0,255);
                    ellipse (k,m,10,10);
                  //  if( k % 10 == 0){
                  //  }
                   //if (m % 10){
                     //   =0;
                        //    }
                  }
                
                  // for (int l = 0; l< 600; l -=3){
                 //    ellipse (k,l,10,10);
      
      } 
                        fill (random(255), random (255), random (255),80);
                            ellipse ((mouseX),( mouseY), 40,40);
                       //     ellipse ((mouseX*-2),( mouseY*-2), 40,40);
                       //     ellipse ((mouseX/-2),( mouseY/-2), 40,40);
                          
                           
       
                   }
                               else{                        
                                 background(255,50);
                                  // ellipse ((mouseX-10), (mouseY-1), 40,40);
                                 //  ellipse ((mouseX+10), (mouseY*2), 30,30);
                                 //  ellipse ((mouseX+80), (mouseY-30), 20,20);
                                //   ellipse ((mouseX-10), (mouseY-20), 50,50);
                                  // ellipse ((mouseX=mouseX-400), (mouseY-60), 60,60);
                                   ellipse((mouseX+10), (mouseY), 50,50);
                                   ellipse((mouseX+10), (mouseY=10), 50,50);
                                 //  ellipse((mouseX+ int (x)), (mouseY= int (y)), 50,50);
     
    }
    
   
    }

      


