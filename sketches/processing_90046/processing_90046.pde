
color ballColor = color(255, 0, 0);
//direction 
int hd= 4; // blue
int vd=3;
int hd2= 2; // red 
int vd2=4;
int hd3 = 5; // green
int vd3= 3;
//end direction
//start combined direction
int mov = hd & vd; 
int mov2 = hd2 & vd2;
int mov3 = hd3 & vd3;
//position
int bx = 30; // blue
int by = 30;
int bx2 = 50; // red
int by2 = 50;
int bx3 = 40; // green
int by3 = 40;
//end position
//combined position
int ax = bx & by;
int ax2 = bx2 & by2;
int ax3 = bx3 & by3;
//end combined position
int bd = 50;
int bd2 = 50;
int bd3 = 50;

void setup(){
 size(400, 250);
fill(200);
noStroke();

}

void draw(){
  background(0);
  if (key == CODED) { // both vert and horz
    if (keyCode == UP) {
      vd=vd*1;
      vd2=vd2*1;
      vd3=vd3*1;
      
      } 
    }
    
    if (key ==CODED){ //only vetical movement
      if (keyCode == DOWN){
        vd=vd*-1;
        vd2=vd2*-1;
        vd3=vd3*-1;
      }
    }
     if (key ==CODED){ // both vert and horz
      if (keyCode == RIGHT){
        hd=hd*1;
        hd2=hd2*1;
        hd3=hd3*1;
      }
    }
     if (key ==CODED){ // only hor
      if (keyCode == LEFT){
        hd=hd*-1;
        hd2=hd2*-1;
        hd3=hd3*-1;
      }
    }
    
  if (keyPressed) {
    if (key == 'w' || key == 'W') { // turn everything black (lights out)
      fill(255);
    }
  } else {
    fill(250, 200, 100);
  ballColor=color(0,0,255);// blue
  ball(bx, by, bd,ballColor);
  
  ballColor=color(0,255,0); // reassigned to green
  ball(bx3, by3, bd, ballColor);
  
  ballColor=color(255,0,0); //red
  ball(bx2, by2, bd, ballColor);
  }
  //movement code
  bx+=hd;
   if(bx>=400-bd/2){
     hd= hd*-1;
   }
   if(bx<=0+bd/2){
     hd = hd*-1;
     
   }
   by+=vd;
    if(by>=250-bd/2){
     vd= vd*-1;
   }
   if(by<=0+bd/2){
     vd = vd*-1;
     
   }
   
   bx2+=hd2;
   if(bx2>=400-bd2/2){
     hd2= hd2*-1;
   }
   if(bx2<=0+bd2/2){
     hd2 = hd2*-1;
     
   }
   by2+=vd2;
    if(by2>=250-bd2/2){
     vd2= vd2*-1;
   }
   if(by2<=0+bd2/2){
     vd2 = vd2*-1;
     
   }//
   
   bx3+=hd3;
   if(bx3>=400-bd3/2){
     hd3= hd3*-1;
   }
   if(bx3<=0+bd3/2){
     hd3 = hd3*-1;
     
   }
   by3+=vd3;
    if(by3>=250-bd3/2){
     vd3= vd3*-1;
   }
   if(by3<=0+bd3/2){
     vd3 = vd3*-1;
     
   }
   
   //end movement code
   
   
   //fist face bounce off
   ax+=mov;
   if(ax == ax2){
     mov = mov*-1;
   }
    ax+=mov;
   if(ax == ax3){
     mov = mov*-1;
     
   } // should make blue ball bounce off red and green ball upon collision
 
   //end first bounce horizontal
   
     ax2+=mov3;
     if(ax2 == ax){
     mov2 = mov2*-1;
    
   }
   
    ax2+=mov2;
     if(ax2 == ax3){
     mov2 = mov2*-1;
   
   }  // should make red ball bounce off green and blue ball upon collision

   // end face 2 horizontal
   
   ax3+=mov3;
    if(ax3 == ax2){
     mov3 = mov3*-1;
    
   }
 
   ax3+=mov3;
    if(ax3 == ax){
     mov3 = mov3*-1;
     
   } // should make green ball bounce off red and blue balls upon collision
   
   // end 3 face horizontal 

}
  //ellipse(xpos, ypos, diam, diam);
  
//}/////// safer to use floats when making functions using void//////////////
//void ball( float xpos, float ypos, float d, float rVal, float gVal, float bVal){
  //fill(rVal, gVal, bVal);
 //ellipse(xpos, ypos, d,d); 
//}
/*void ball( float xpos, float ypos, float d, float grayVal){
  fill(grayVal);
 ellipse(xpos, ypos, d,d); 
}    used to create gray and color */

//ball(100, 150, 50, ballColor);
void ball( float xpos, float ypos, float d, color c){
  
   
  fill(c);
 ellipse(xpos, ypos, d, d);
 
 float eyed=d*.2; // creating less numbers in parameters
  float eyey=ypos-d*.2;
  float eyeLx=xpos-d*.25;
  float eyeRx=xpos+d*.25;
  
 //right eye
fill(255);
 ellipse(eyeRx, eyey, eyed, eyed);
 
 //left eye
  fill(255);
 ellipse(eyeLx, eyey, eyed, eyed);
 
 stroke(0);
 strokeWeight(d*.05);
 line(xpos-d/2, ypos, xpos+d/2, ypos);
 noStroke();
}
