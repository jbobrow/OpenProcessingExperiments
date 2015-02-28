
//Author(s): Ender Wiggin

/* How to interact:
0.the window can be changed both in x & y. Best to change y-axixs
  (recommended size 600x600)
1.mousing over particular areas will print a grid of 15 x 15 squares
2.countinious mousing over the red box in the centre will clear
  the field (takes about 1/2 second)
3.this clear feature will not effect the background, see controls
  bellow to turn off the background
4.if background is working then mousing over the red middle square 
  will make an interesting effect
*/


//------------------CONTROLS-----------------
//basic controls
int lineTrans=120; //transparency control for guid lines
//int w=600; //width of screen
//int h=600; //hight of screen

//effects backround. DO NOT CHANGE "counter"
boolean backgroundTest=true; //"true" runs background while "false" stops it
int startingFreq=10; /*this is part of a random generator, as the value increases
                     the background paints more*/
float counter=1.0; //this allows the background to start filling with a patern. 

//auto grid control
int printGrid=4; /*input: positive intergers (excluding zero). Larger the value,
                the rate of the grids that auto-print will decrease*/



void setup(){
  size(600, 600, P2D);
  background(255);
  

  //starting guids 
  stroke(0, 0, 0, lineTrans);
  line(100, 0, 100, height);
  line(200, 0, 200, height);
  line(400, 0, 400, height);
  line(500, 0, 500, height);
  noStroke();
  fill(200,0,50,200);
  rect(285,285,30,30);
}

 
void draw(){
  
  //background filler effect
  if(backgroundTest){
    if(counter!=0.0){ 
        for(int x=0; x<width; x=x+20){
          for(int y=0; y<height; y=y+20){
            if(floor(random(-1, 8))==0){
              smooth();
              fill(0, 0, 0, 60);
              text("0", x, y);
              noFill();
            }
          }
        }
      counter=floor(random(-1, startingFreq));
    }
  }
  
  
  
  //blue effect grid
  if (mouseX>=100 && mouseX<=200){
    for(int a=mouseX-75; a<mouseX+75; a=a+10){
      for(int b=mouseY-75; b<mouseY+75; b=b+10){
        noStroke();
        fill(0, 45, 175, 35);
        rect(a, b, 5, 5);
        noFill();
      }
    }
  }  
  if (mouseX>=400 && mouseX<=500){
    for(int a=mouseX-75; a<mouseX+75; a=a+10){
      for(int b=mouseY-75; b<mouseY+75; b=b+10){
        noStroke();
        fill(0, 45, 175, 35);
        rect(a, b, 5, 5);
        noFill();
      }
    }
  }
 
  
  //red effect grid
  if(mouseY>=250 && mouseY<=350){
    for(int a=mouseX-75; a<mouseX+75; a=a+10){
      for(int b=mouseY-75; b<mouseY+75; b=b+10){
        noStroke();
        fill(200, 75, 75, 40);
        rect(a, b, 5, 5);
        noFill();
      }
    }  
  }
  
  //CLEAR FUNC aka: paste over board
  if(mouseX>=285 && mouseX<=315 && mouseY>=285 && mouseY<=315){
    fill(255, 255, 255, 30);
    rect(0, 0, width, height);

    
    fill(200,0,50,100);
    noStroke();
    rect(285,285,30,30);
    noFill();
    
    stroke(0, 0, 0, lineTrans);
    line(100, 0, 100, height);
    line(200, 0, 200, height);
    line(400, 0, 400, height);
    line(500, 0, 500, height);
    noStroke();
    
    counter=1.0;
  }
  

  //AUTO PRINT GRID (aka the chaos factor)
  if (floor(random(-1, printGrid))==0){
    mouseX=floor(random(0, width+1));
  }
  if (floor(random(-1, printGrid))==0){
    mouseY=floor(random(0, height+1));
  }

}//    THE END!!!!!






//------END NOTES------------------------------------------------------------
/*
other examinations:

classes
objects
how to the update parameter
P3D rendering
use of keyboard input

*/

//-------EXTRA CODE-----------------------------------------------------------

/* attempt at working in 3 space.  everything bellow is meant as a stand alone:



int lineTrans=120;

void setup(){
  size(800, 800, P3D);
  background(255);
  frameRate(30);

  stroke(0, 0, 0, lineTrans);
  line(100, 0, 100, 600);
  line(200, 0, 200, 600);
  line(400, 0, 400, 600);
  line(500, 0, 500, 600);  
}

void draw(){
  translate(250, 400, 0); 
  //rotateY(0.5);
  //noStroke();
  noFill();
  box(400, 325, 375);
  
  if (mouseX>=100 && mouseX<=200){
  //then make many light blue squares
    for(int a=mouseX-75; a<mouseX+75; a=a+10){
      for(int b=mouseY-75; b<mouseY+75; b=b+10){
        noStroke();
        fill(0, 45, 175, 35);
        translate(a, b, 0);
        box(5, 5, 2);
      }
    }
  } 

}
*/




