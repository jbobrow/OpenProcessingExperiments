
void setup(){
size(800,800);      //size of window
}


int localX = 400;
int localY = 400;

void draw (){
  background( 255 );    //background color
  smooth();           //Antialiasing
draw_creature( localX, localY );  
 
 if ( mousePressed && (mouseButton == LEFT) ) {
   localX = mouseX;
   localY = mouseY;
 }

  int i;
    for ( i=-1 ; i<2 ; i++ ) {
      draw_creature ( localX + ( i*200 ), localY );
  }
}

void draw_creature( int x,int y ){

    rectMode(CENTER);   //Set rect pivot
    ellipseMode(CENTER);
    
    //neck object
    strokeWeight(4);
    line(x,y-20,x,y);  //neck
    
    //arms objects
    strokeWeight(4);
    line(x-20,y,x-60,y+40);  //left arm
    line(x+20,y,x+60,y+40);  //right arm
    
    //leg objects
    line(x-20,y+60,x-20,y+100);  //left leg
    line(x+20,y+60,x+20,y+100);  //right leg
    strokeWeight(1);
    fill(187);
    ellipse(x-20,y+80,20,20);  //left plate
    ellipse(x+20,y+80,20,20);  //right plate
    rect(x-20,y+100,20,10);
    rect(x+20,y+100,20,10);
    
    //body object
    fill(187);          //COLOR 1 for Char
    rect(x,y+30,40,60);  //body
    
    //chest armor
    
    //head objects
    strokeWeight(1);
    fill(187);                                                    //COLOR 1 for Char
    stroke(0);
    rect(x,y-70,80,60);
    fill(250,215,199);                                            //SKIN for Char
    rect(x,y-30,70,20);
    fill(60);                                                     //eye color
    rect(x+20,y-60,20,20);                            //right eye
    rect(x-20,y-60,20,20);                            //left eye
    noStroke();                                                   //stop stroke for eye
    fill(245);                                                    //sclera color
    rect(x+20,y-60,10,10);                            //right sclera
    rect(x-20,y-60,10,10);                            //left sclera
    fill(237,50,50);                                              //pupil color
    rect(x+20,y-60,5,5);                              //right pupil
    rect(x-20,y-60,5,5);                              //left pupil
    fill(0);                                                      //Black
    stroke(0);                                                    //stroke back to normal
    rect(x,y-36,20,5);                             //mouth
    line(x+30,y-85,x+10,y-75);            //right eyebrow
    line(x-30,y-85,x-10,y-75);            //left eyebrow
    fill(235);
    triangle(x+10,y-100,x-10,y-100,x,y-130);
    triangle(x-30,y-100,x-20,y-100,x-25,y-110);
    triangle(x+20,y-100,x+30,y-100,x+25,y-110);
    
    //beard
    fill(126,92,70);
    noStroke();
    rect(x+30,y-30,10,20);
    rect(x-30,y-30,10,20);
    rect(x+12,y-30,5,20);
    rect(x-12,y-30,5,20);
    rect(x,y-20,70,10);
    ellipse(x,y-23,40,15);
    ellipse(x,y-13,70,25);
    ellipse(x,y-3,60,25);
    ellipse(x,y+7,40,20);
    ellipse(x,y+12,25,20);
    stroke(0);
    
    
  

}

