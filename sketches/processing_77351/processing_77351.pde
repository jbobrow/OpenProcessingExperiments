
//Levi Mousaw
//Midterm- Nick Lally


                                                //DECLARE VARIABLES
int diameter = 2;
int x = 0;
int y = 0;
int x1 = 0;
int y1 = 0;
int xChange = 1;

                                                  //COLOR VARIABLE
float r;
float g;
float b;
float a;

                                                  //ELLIPSE VARIABLES
float angle;
float rad;
float elleSize, size2;

                                                        //SETUP
void setup(){
 size (800,800);
 background (255);
 angle = 0;
 rad = 0;
 size2 =-1;
 smooth ();
 frameRate (7);
}


void draw (){
  strokeWeight (1.5);
  fill(r,g,b,a);                                       //COLOR VALUES
      r= random(255);
      g= random(255);
      b= random(255);
      a= random(255);
  
  translate(width/30,height/30);
  for (int i = 0; i < 360; i++){
    line(x,y,1000,1000);
    rotate(radians(1));
  }



trail();
 
                                                        //MOUSE SHADOWING
 float bgcolor= abs(255*sin(radians(angle)));
 float x = 200*cos(radians(angle))*cos(radians(angle*2));
 float y = 200*sin(radians(angle))*cos(radians(angle/10));
 float x1 = rad*cos(radians(angle));
 float y1 = rad*sin(radians(angle));
 
stroke (251,223,184);                                //LINE1 FROM CORNER
   line(pmouseX,pmouseY,0,0);
    //ellipse (pmouseX/2,pmouseY/2,elleSize,elleSize);
    //elleSize++; 
   stroke (251,223,184);                                 //LINE2 FROM CORNER
   line(pmouseX,pmouseY,800,800);
  
 stroke (32,178,170);
  
   ellipse1();                                         //CALL ELLIPSE
    strokeWeight (1.5);
    stroke (32,178,170);


                                                      // CIRCLE STARTING POINTS
  expand1(-75,0);
  expand1(-200,-250);
  expand1(300,-300);
  expand1(-200,250);
  expand1(0,300);
  expand1(0,-200);
  expand1(200,-50);

}



////////////FUNCTIONS//////////////////////////
void ellipse1(){                                  

                                                     //SMALLER GROWING CIRCLES
 //ellipse (150,200,diameter,diameter);
   diameter = diameter + 1;
   fill (0,0,0,0);
   
 ellipse (500,500,diameter,diameter);
   diameter = diameter + 8;
   fill (0,0,0,0);
   
  
 ellipse (0,700,diameter,diameter);
   diameter = diameter + 1;
   fill (0,0,0,0);
   
   
}

  
void trail() { 
noStroke();                                           //FOLLOWING THE MOUSE
 fill (230,0,245,a);                                  //PINK COLOR/FADE
 for(int i = 0;i < 4; i++)
   ellipse (mouseX,mouseY,elleSize,elleSize);
   elleSize++;                                         //GROWS CIRCLE
   diameter = diameter + 1;                            //INCREASE DIAMETER
   size2 = elleSize *-1;                               //DOWNSIZES
     if(elleSize>95){
    elleSize = size2;
    
   
 }
}
  
                                                        //GROW CIRCLES
void expand1(int x, int y){                             //FUNCTION2

//stroke (32,178,170); 
 ellipse(x+width/2,y+height/2,rad/2,rad/2);
  ellipse (x+width/2,y+height/2,5,5);
   stroke (0,g,145,a);
   rad+=2;
   
    println(mouseX + " : " + mouseY);                  //RESETS BACKGROUND
    if (mousePressed){
    background(255);
    }
    
      
}




