

import processing.pdf.*;                    //import PDF library
boolean record;                             //create a boolean to turn recording on/off


void setup () {
  size (480, 720);
  background (230,220,205);
  smooth();
}

void draw () {

  if (record) {                                //use an if statement to start recording
    beginRecord(PDF, "frame-####.pdf");          // Note that #### will be replaced with the frame number. Fancy!
}

rectMode(CENTER);
noStroke();
fill(230,205,200);
for ( int k=0 ; k <=width;k+=15){
for ( int j=0 ; j <=height; j+=15){
  rect (k,j,3,3);
}
}

/*

noStroke();
rectMode (CENTER);

fill(0,100,100);                            //middle band
rect (width/2, height/2, width, 2);  
fill(0,55,70);
rect (width/2, height/2+4, width, 2);
fill(0,55,70);
rect (width/2, height/2-4, width, 2);
fill(205,180,130);
rect (width/2, height/2+8, width, 2);
fill(205,180,130);
rect (width/2, height/2-8, width, 2);
fill(0,100,100);
rect (width/2, height/2+12, width, 2);
fill(0,100,100);
rect (width/2, height/2-12, width, 2);
fill(0,55,70);
rect (width/2, height/2+16, width, 2);
fill(0,55,70);
rect (width/2, height/2-16, width, 2); 

fill(0,100,100);                            //UPPER MIDDLE BAND
rect (width/2, height/2-63, width, 2);  
fill(0,55,70);
rect (width/2, height/2-59, width, 2);
fill(0,55,70);
rect (width/2, height/2-67, width, 2);
fill(205,180,130);
rect (width/2, height/2-55, width, 2);
fill(205,180,130);
rect (width/2, height/2-71, width, 2);
fill(0,100,100);
rect (width/2, height/2-51, width, 2);
fill(0,100,100);
rect (width/2, height/2-75, width, 2);
fill(0,55,70);
rect (width/2, height/2-47, width, 2);
fill(0,55,70);
rect (width/2, height/2-79, width, 2); 

fill(0,100,100);                            //LOWER MIDDLE BAND
rect (width/2, height/2+65, width, 2);  
fill(0,55,70);
rect (width/2, height/2+61, width, 2);
fill(0,55,70);
rect (width/2, height/2+69, width, 2);
fill(205,180,130);
rect (width/2, height/2+57, width, 2);
fill(205,180,130);
rect (width/2, height/2+73, width, 2);
fill(0,100,100);
rect (width/2, height/2+53, width, 2);
fill(0,100,100);
rect (width/2, height/2+77, width, 2);
fill(0,55,70);
rect (width/2, height/2+49, width, 2);
fill(0,55,70);
rect (width/2, height/2+81, width, 2); 

fill(0,100,100);                            //middle band HEIGHT
rect (width/2, height/2, 2, height);  
fill(0,55,70);
rect (width/2+4, height/2,2,height);
fill(0,55,70);
rect (width/2-4, height/2,2,height);
fill(205,180,130);
rect (width/2+8, height/2,2,height);
fill(205,180,130);
rect (width/2-8, height/2,2,height);
fill(0,100,100);
rect (width/2+12, height/2,2,height);
fill(0,100,100);
rect (width/2-12, height/2,2,height);
fill(0,55,70);
rect (width/2+16, height/2,2,height);
fill(0,55,70);
rect (width/2-16, height/2,2,height); 

*/



rectMode(CENTER);                          //First set center square
noStroke();
fill( 205,180,130);
rect(width/2,height/2,64,64);
fill( 0,20,50);
rect(width/2,height/2,54,54);
fill( 0,100,100);
rect(width/2,height/2,48,48);
fill( 0,55,70);
rect(width/2,height/2,42,42);
fill( 0,20,50);
rect(width/2,height/2,34,34);
fill( 205,180,130);
rect(width/2,height/2,28,28);
fill( 0,100,100);
rect(width/2,height/2,22,22);
fill( 0,20,50);
rect(width/2,height/2,15,15);
fill( 205,180,130);
rect(width/2,height/2,8,8);

rectMode(CENTER);                          //Upper center scuare
noStroke();
fill( 205,180,130);
rect(width/2,height/2-128,64,64);
fill( 0,20,50);
rect(width/2,height/2-128,54,54);
fill( 0,100,100);
rect(width/2,height/2-128,48,48);
fill( 0,55,70);
rect(width/2,height/2-128,42,42);
fill( 0,20,50);
rect(width/2,height/2-128,34,34);
fill( 205,180,130);
rect(width/2,height/2-128,28,28);
fill( 0,100,100);
rect(width/2,height/2-128,22,22);
fill( 0,20,50);
rect(width/2,height/2-128,15,15);
fill( 205,180,130);
rect(width/2,height/2-128,8,8);

rectMode(CENTER);                          //Lower center scuare
noStroke();
fill( 205,180,130);
rect(width/2,height/2+128,64,64);
fill( 0,20,50);
rect(width/2,height/2+128,54,54);
fill( 0,100,100);
rect(width/2,height/2+128,48,48);
fill( 0,55,70);
rect(width/2,height/2+128,42,42);
fill( 0,20,50);
rect(width/2,height/2+128,34,34);
fill( 205,180,130);
rect(width/2,height/2+128,28,28);
fill( 0,100,100);
rect(width/2,height/2+128,22,22);
fill( 0,20,50);
rect(width/2,height/2+128,15,15);
fill( 205,180,130);
rect(width/2,height/2+128,8,8);

rectMode(CENTER);                          //changed sq
noStroke();
fill( 0,20,54);
rect(width/2-64,height/2+192,64,64);
fill( 0,100,100);
rect(width/2-64,height/2+192,54,54);
fill( 0,55,70);
rect(width/2-64,height/2+192,48,48);
fill( 205,180,130);
rect(width/2-64,height/2+192,42,42);
fill( 0,20,50);
rect(width/2-64,height/2+192,34,34);
fill( 0,20,50);
rect(width/2-64,height/2+192,28,28);
fill( 0,100,100);
rect(width/2-64,height/2+192,22,22);
fill( 0,20,50);
rect(width/2-64,height/2+192,15,15);
fill( 0,55,70);
rect(width/2-64,height/2+192,8,8);

rectMode(CENTER);                          //chang sqright
noStroke();
fill( 0,20,54);
rect(width/2+64,height/2+192,64,64);
fill( 0,100,100);
rect(width/2+64,height/2+192,54,54);
fill( 0,55,70);
rect(width/2+64,height/2+192,48,48);
fill( 205,180,130);
rect(width/2+64,height/2+192,42,42);
fill( 0,20,50);
rect(width/2+64,height/2+192,34,34);
fill( 0,20,50);
rect(width/2+64,height/2+192,28,28);
fill( 0,100,100);
rect(width/2+64,height/2+192,22,22);
fill( 0,20,50);
rect(width/2+64,height/2+192,15,15);
fill( 0,55,70);
rect(width/2+64,height/2+192,8,8);


rectMode(CENTER);                          //chang sqright
noStroke();
fill( 0,20,54);
rect(width/2-64,height/2-192,64,64);
fill( 0,100,100);
rect(width/2-64,height/2-192,54,54);
fill( 0,55,70);
rect(width/2-64,height/2-192,48,48);
fill( 205,180,130);
rect(width/2-64,height/2-192,42,42);
fill( 0,20,50);
rect(width/2-64,height/2-192,34,34);
fill( 0,20,50);
rect(width/2-64,height/2-192,28,28);
fill( 0,100,100);
rect(width/2-64,height/2-192,22,22);
fill( 0,20,50);
rect(width/2-64,height/2-192,15,15);
fill( 0,55,70);
rect(width/2-64,height/2-192,8,8);

rectMode(CENTER);                          //chang sqright
noStroke();
fill( 0,20,54);
rect(width/2+64,height/2-192,64,64);
fill( 0,100,100);
rect(width/2+64,height/2-192,54,54);
fill( 0,55,70);
rect(width/2+64,height/2-192,48,48);
fill( 205,180,130);
rect(width/2+64,height/2-192,42,42);
fill( 0,20,50);
rect(width/2+64,height/2-192,34,34);
fill( 0,20,50);
rect(width/2+64,height/2-192,28,28);
fill( 0,100,100);
rect(width/2+64,height/2-192,22,22);
fill( 0,20,50);
rect(width/2+64,height/2-192,15,15);
fill( 0,55,70);
rect(width/2+64,height/2-192,8,8);


rectMode(CENTER);                          //very right
noStroke();
fill( 0,20,54);
rect(width/2+128,height/2-128,64,64);
fill( 0,100,100);
rect(width/2+128,height/2-128,54,54);
fill( 0,55,70);
rect(width/2+128,height/2-128,48,48);
fill( 205,180,130);
rect(width/2+128,height/2-128,42,42);
fill( 0,20,50);
rect(width/2+128,height/2-128,34,34);
fill( 0,20,50);
rect(width/2+128,height/2-128,28,28);
fill( 0,100,100);
rect(width/2+128,height/2-128,22,22);
fill( 0,20,50);
rect(width/2+128,height/2-128,15,15);
fill( 0,55,70);
rect(width/2+128,height/2-128,8,8);


rectMode(CENTER);                          //very right
noStroke();
fill( 0,20,54);
rect(width/2-128,height/2-128,64,64);
fill( 0,100,100);
rect(width/2-128,height/2-128,54,54);
fill( 0,55,70);
rect(width/2-128,height/2-128,48,48);
fill( 205,180,130);
rect(width/2-128,height/2-128,42,42);
fill( 0,20,50);
rect(width/2-128,height/2-128,34,34);
fill( 0,20,50);
rect(width/2-128,height/2-128,28,28);
fill( 0,100,100);
rect(width/2-128,height/2-128,22,22);
fill( 0,20,50);
rect(width/2-128,height/2-128,15,15);
fill( 0,55,70);
rect(width/2-128,height/2-128,8,8);


rectMode(CENTER);                          //very right
noStroke();
fill( 0,20,54);
rect(width/2-128,height/2,64,64);
fill( 0,100,100);
rect(width/2-128,height/2,54,54);
fill( 0,55,70);
rect(width/2-128,height/2,48,48);
fill( 205,180,130);
rect(width/2-128,height/2,42,42);
fill( 0,20,50);
rect(width/2-128,height/2,34,34);
fill( 0,20,50);
rect(width/2-128,height/2,28,28);
fill( 0,100,100);
rect(width/2-128,height/2,22,22);
fill( 0,20,50);
rect(width/2-128,height/2,15,15);
fill( 0,55,70);
rect(width/2-128,height/2,8,8);

rectMode(CENTER);                          //middle left
noStroke();
fill( 0,20,54);
rect(width/2+128,height/2,64,64);
fill( 0,100,100);
rect(width/2+128,height/2,54,54);
fill( 0,55,70);
rect(width/2+128,height/2,48,48);
fill( 205,180,130);
rect(width/2+128,height/2,42,42);
fill( 0,20,50);
rect(width/2+128,height/2,34,34);
fill( 0,20,50);
rect(width/2+128,height/2,28,28);
fill( 0,100,100);
rect(width/2+128,height/2,22,22);
fill( 0,20,50);
rect(width/2+128,height/2,15,15);
fill( 0,55,70);
rect(width/2+128,height/2,8,8);


rectMode(CENTER);                          //middle left
noStroke();
fill( 0,20,54);
rect(width/2+128,height/2+128,64,64);
fill( 0,100,100);
rect(width/2+128,height/2+128,54,54);
fill( 0,55,70);
rect(width/2+128,height/2+128,48,48);
fill( 205,180,130);
rect(width/2+128,height/2+128,42,42);
fill( 0,20,50);
rect(width/2+128,height/2+128,34,34);
fill( 0,20,50);
rect(width/2+128,height/2+128,28,28);
fill( 0,100,100);
rect(width/2+128,height/2+128,22,22);
fill( 0,20,50);
rect(width/2+128,height/2+128,15,15);
fill( 0,55,70);
rect(width/2+128,height/2+128,8,8);


rectMode(CENTER);                          //middle left
noStroke();
fill( 0,20,54);
rect(width/2-128,height/2+128,64,64);
fill( 0,100,100);
rect(width/2-128,height/2+128,54,54);
fill( 0,55,70);
rect(width/2-128,height/2+128,48,48);
fill( 205,180,130);
rect(width/2-128,height/2+128,42,42);
fill( 0,20,50);
rect(width/2-128,height/2+128,34,34);
fill( 0,20,50);
rect(width/2-128,height/2+128,28,28);
fill( 0,100,100);
rect(width/2-128,height/2+128,22,22);
fill( 0,20,50);
rect(width/2-128,height/2+128,15,15);
fill( 0,55,70);
rect(width/2-128,height/2+128,8,8);



rectMode(CENTER);                          //very upper
noStroke();
fill( 0,20,54);
rect(width/2,height/2-256,64,64);
fill( 0,100,100);
rect(width/2,height/2-256,54,54);
fill( 0,55,70);
rect(width/2,height/2-256,48,48);
fill( 205,180,130);
rect(width/2,height/2-256,42,42);
fill( 0,20,50);
rect(width/2,height/2-256,34,34);
fill( 0,20,50);
rect(width/2,height/2-256,28,28);
fill( 0,100,100);
rect(width/2,height/2-256,22,22);
fill( 0,20,50);
rect(width/2,height/2-256,15,15);
fill( 0,55,70);
rect(width/2,height/2-256,8,8);

rectMode(CENTER);                          //very lower
noStroke();
fill( 0,20,54);
rect(width/2,height/2+256,64,64);
fill( 0,100,100);
rect(width/2,height/2+256,54,54);
fill( 0,55,70);
rect(width/2,height/2+256,48,48);
fill( 205,180,130);
rect(width/2,height/2+256,42,42);
fill( 0,20,50);
rect(width/2,height/2+256,34,34);
fill( 0,20,50);
rect(width/2,height/2+256,28,28);
fill( 0,100,100);
rect(width/2,height/2+256,22,22);
fill( 0,20,50);
rect(width/2,height/2+256,15,15);
fill( 0,55,70);
rect(width/2,height/2+256,8,8);







fill( 205,180,130);                    //2d
rect(width/3+16,height/2-64,64,64);
fill( 0,20,50);
rect(width/3+16,height/2-64,54,54);
fill( 0,100,100);
rect(width/3+16,height/2-64,48,48);
fill( 0,55,70);
rect(width/3+16,height/2-64,42,42);
fill( 0,20,50);
rect(width/3+16,height/2-64,34,34);
fill( 205,180,130);
rect(width/3+16,height/2-64,28,28);
fill( 0,100,100);
rect(width/3+16,height/2-64,22,22);
fill( 0,20,50);
rect(width/3+16,height/2-64,15,15);
fill( 205,180,130);
rect(width/3+16,height/2-64,8,8);

fill( 205,180,130);                    //3d
rect(width/3+16,height/2+64,64,64);
fill( 0,20,50);
rect(width/3+16,height/2+64,54,54);
fill( 0,100,100);
rect(width/3+16,height/2+64,48,48);
fill( 0,55,70);
rect(width/3+16,height/2+64,42,42);
fill( 0,20,50);
rect(width/3+16,height/2+64,34,34);
fill( 205,180,130);
rect(width/3+16,height/2+64,28,28);
fill( 0,100,100);
rect(width/3+16,height/2+64,22,22);
fill( 0,20,50);
rect(width/3+16,height/2+64,15,15);
fill( 205,180,130);
rect(width/3+16,height/2+64,8,8);

fill( 205,180,130);                    //4th
rect(width/2+64,height/2+64,64,64);
fill( 0,20,50);
rect(width/2+64,height/2+64,54,54);
fill( 0,100,100);
rect(width/2+64,height/2+64,48,48);
fill( 0,55,70);
rect(width/2+64,height/2+64,42,42);
fill( 0,20,50);
rect(width/2+64,height/2+64,34,34);
fill( 205,180,130);
rect(width/2+64,height/2+64,28,28);
fill( 0,100,100);
rect(width/2+64,height/2+64,22,22);
fill( 0,20,50);
rect(width/2+64,height/2+64,15,15);
fill( 205,180,130);
rect(width/2+64,height/2+64,8,8);

fill( 205,180,130);                    //5th
rect(width/2+64,height/2-64,64,64);
fill( 0,20,50);
rect(width/2+64,height/2-64,54,54);
fill( 0,100,100);
rect(width/2+64,height/2-64,48,48);
fill( 0,55,70);
rect(width/2+64,height/2-64,42,42);
fill( 0,20,50);
rect(width/2+64,height/2-64,34,34);
fill( 205,180,130);
rect(width/2+64,height/2-64,28,28);
fill( 0,100,100);
rect(width/2+64,height/2-64,22,22);
fill( 0,20,50);
rect(width/2+64,height/2-64,15,15);
fill( 205,180,130);
rect(width/2+64,height/2-64,8,8);

rectMode(CENTER);                ///outside rects
noFill();
stroke(0,20,50);
strokeWeight(16);
rect(width/2, height/2,480,720);
stroke(230,220,205);
strokeWeight(18);
rect(width/2, height/2,435,675);
stroke(0,100,100);
strokeWeight(9);
rect(width/2, height/2,435,675);

/* 
 noStroke();
 fill (0,100,100);
 rectMode (CENTER);
 
 rect (width/2, height/16, width, 8);         //1st band
 fill(205,180,130);
 rect (width/2, height/25, width, 5);          //2d band
 fill(0,20,50);
 rect (width/2, height/20, width, 10);          //3d band
 fill(0,55,70);
 rect (width/2, height/14, width, 7);          //4d band
 fill (0,100,100);
 rect (width/2, height/12-1, width, 8);         //5st band
 fill(0,20,50);
 rect (width/2, height/10-6, width, 10);       //6t band
 fill(205,180,130);
 rect (width/2, height/10+2, width, 5);        //7th band
 */




}
