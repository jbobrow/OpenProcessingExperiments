
/*
*    pear-baby
*    shape-animation using geomerative
*    
*/

import geomerative.*;    // import geomerative library
                         // http://www.ricardmarxer.com/geomerative/

RShape baby;
float a, b, c, d, lid_y;
int count = 0;
int e= 80;

void setup ()
{
    size( 300, 300 );
 
    RG.init( this );    // before using geomerative initialize it ..
    smooth(); // turn on anti-aliasing
}


void draw ()
{
    background( 120 );    // clear the background with medium grey
   
    
//variables for animation
     e--;   
    if(e<15){                       //eyes
      lid_y = -70 +e; 
      if (e < 5) e = (int)random(30, 120);
    }
    else
      lid_y =-70;

    a = map(mouseX, 0, width, -5, 5);          //pupills
    b= map(mouseY, 0, height, -5, 5);

    if(frameCount%100<50){                     //smile
        if(count<11) count++; 
    }
    else{
      if(count>0) count--;
    }
    c = map(count, 0, 20, 0, 15);
    
    d= -abs(frameCount%44-22);                  //hair
    
    if(mousePressed){
        lid_y=-58;
        tears();
    }
    
    translate( width/3, height/1.2 );  
                                              // making the baby(shape)  

    RG.beginShape(); 
    
        RG.vertex( 50, 0 );                           // head
        RG.bezierVertex(-20-c,  0 , -20-c , -50 , 0 , -60 ); 
        RG.bezierVertex( 0, -80, 10, -110, 50, -110); 
        RG.bezierVertex( 90, -110, 100, -80, 100, -60); 
        RG.bezierVertex(120+c,  -50 , 120+c , 0 , 50 , 0 );  
        
        eyes();                                        //holes for eyes
        
        RG.vertex(45, -50);                            //nose-holes
        RG.bezierVertex(35, -40, 45, -40, 45, -50);
        RG.breakShape( RG.CLOSE );       
        RG.vertex(55, -50);   
        RG.bezierVertex(55, -40, 65, -40, 55, -50);
        RG.breakShape( RG.CLOSE );   
        
        if(mousePressed){             //hole for mouth
          
          translate(0, random(5));
          
          count=0;
          a=0;
          b=-10;
          mouth_2();
        }
        else mouth_1();
    baby = RG.getShape( );
    
    RShape pupille_left =RG.getEllipse( 30+a,-60+b , 15 );    // pupills
    RShape pupille_right =RG.getEllipse( 70+a, -60+b , 15 );
 
    RG.beginShape();                                            //hair
        RG.vertex(48, -110);                                
        RG.bezierVertex(48, -120, 35, -135+d/2, 20, -140+d/2);        
        RG.bezierVertex(25, -135+d/2, 45, -125, 48, -110); 
        RG.breakShape(RG.CLOSE);
        RG.vertex(48, -110);
        RG.bezierVertex(50, -120, 60, -135+d/2, 70, -140+d/2);      
        RG.bezierVertex(70, -135+d/2, 60, -125, 48, -110); 
        RG.breakShape(RG.CLOSE);
    RShape hair =RG.getShape();
    
    RShape mouth_bg = RG.getEllipse(50, -30, 100, 45);          //mouth background
    RShape nose_bg = RG.getEllipse(50, -47, 30, 20);            //nose background
     RG.beginShape();                                           //background for head
         eyes();
    RShape head_background = RG.getShape();
   
    fill(#931507);                   //draw shapes
    RG.shape(mouth_bg);    
    fill(255);                   
    RG.shape(head_background);
    fill(0);   
    RG.shape(pupille_left);
    RG.shape(pupille_right);
    RG.shape(hair);
    RG.shape(nose_bg); 
    fill(#FA8612);
    if(mousePressed) fill(random(150, 255), 0, 0);
    RG.shape( baby ); 

}


void eyes(){
        RG.vertex(30, -55);                            //left eye
        RG.bezierVertex(50, -55, 40, lid_y, 30, lid_y);
        RG.bezierVertex(20, lid_y, 10, -55, 30, -55);
        RG.breakShape( RG.CLOSE );
        
        RG.vertex(70, -55);                            //right eye
        RG.bezierVertex(90, -55, 80, lid_y, 70, lid_y);
        RG.bezierVertex(60, lid_y, 50, -55, 70, -55);
        RG.breakShape( RG.CLOSE );
}
void mouth_1(){
        RG.vertex(90+c, -35-c);                           
        RG.bezierVertex(70, -30, 30, -30, 10-c, -35-c);
        RG.bezierVertex(40, -30, 40, -16-c, 50, -16-c);
        RG.bezierVertex(60, -16-c, 60, -30, 90+c, -35-c);
        RG.breakShape( RG.CLOSE );
}
void mouth_2(){
        c= 5*sin(frameCount/5);
        RG.vertex(55, -35);                           
        RG.bezierVertex(62, -15, 38, -15, 45, -35);
        RG.bezierVertex(20-c, -40-c, 20-c, -10-c, 50, -10);
        RG.bezierVertex(80+c, -10-c, 80+c, -40-c, 55, -35);
        RG.breakShape( RG.CLOSE );
}
void tears(){
        for(int i =0; i<20; i++){
          stroke(random(255));  
          strokeWeight(random(10));
          line(width/2, height/1.5, 0, map(i, 0, 20, 0, height)+random(5) );
          line(width/2, height/1.5, width, map(i, 0, 20, 0, height)+random(5) );
          line(width/2, height/1.5,  map(i, 0, 20, 0, width)+random(5), 0 );
          line(width/2, height/1.5,  map(i, 0, 20, 0, width)+random(5), height );
        }
        stroke(0);  
        strokeWeight(1);
        
}

