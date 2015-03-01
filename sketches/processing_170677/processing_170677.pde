
void setup() {
                size(500,500); // sets the canvas size to 500 width and 500 height
            background(a, b, c); // the r g b values for the background is substituted with variables
}
//sets background color to light purple 
a=199; 
b=185;
c=240;

 
void draw() {
    for(a=199; a<255; a++) {  //sets the starting value of a to 199, and tests the condition a  is less than 255, then adds one to a. This is a loop.
        ellipse(100, 150, 20, 20);  //draws a circle
        }
        if(mouseX > width/2){   //if the x value for the mouse is greater than half the canvas width
                                background(255); // background white
                                }
                                else if( mouseY> height/2) {   //if mouseX is not greater than half the width and mouseY is greater than half the height of the canvas
                                    background(40); //make background gray
                                    }
                                else{  //if both conditions are false do this action
strokeWeight(2); //how thick the lines are
}
    drawUnicorn(color(random(225),random(225),random(225))); //color change of unicorn, draws unicorn with multiple colors
            
            }
        

               
                
            
        
            void drawUnicorn(color c){
                fill(c); //c=color, fills unicorn with the multiple random colors
                
            
                        strokeWeight(2); //how thick the lines are
                ellipse(370,150,160,100); //head
                strokeWeight(5); //how thick the horn is
                
                line(390,100,480,15); // left line for horn
                line(430,115,480,15); // right line for horn 
                strokeWeight(20); //how big the eye is
                point(410, 135); //eye
                strokeWeight(2); //how thick the lines are
                line( 414, 160, 445, 160);   //mouth
                ellipse( 235, 248, 290, 140); //body
                ellipse ( 90, 310, 50, 145); //tail
                rect( 150, 310, 20, 70); //leg
                rect( 200, 315, 20, 55); //leg
                rect (255, 315, 20, 70); //leg
                rect( 288, 311, 20, 55); //leg
                } 
            
            
                void keyPressed() {  //when a key is pressed
background(77, 28, 97);  //background color turns to dark purple
                }
                void mousePressed(){
                ellipse(mouseX, mouseY, 20, 20); //when mouse pressed circles appear where the mouse is
                }

