
PImage img;              //declare img
void setup()            //void setup
{
  size(800,600);        //canvas size
  img =loadImage("universe.jpeg");//import image
 image(img,0,0);                  //setting image
 colorMode(HSB,360,150,150,150);  //colormode
}

void draw()
{
  
  if (mousePressed)
  {                                       //if mouse is preseed the followins will be genarated
    strokeWeight(2);                    //setting stroke weight w
    point(mouseX,mouseY);                 //point in the position of the moues
   point(width-mouseX,height-mouseY);   //point at diametrically position
    point(width -mouseX,mouseY);         //point at opposite position
    point(mouseX,height-mouseY);        //point at counter position 
   
   
  }
}

void mouseDragged()
{
 
  float red = map(mouseX, 0, width, 0, 360);                   //float variable red
  float blue = map(mouseY, 0, width, 0, 360);                  //float variableb lue
  float green = dist(mouseX,mouseY,width/2,height/2);          //float variable green
 
  float speed = dist(pmouseX, pmouseY, mouseX, mouseY);        //float speed
  float speed2 = 10*dist(pmouseX, pmouseY, mouseX, mouseY);     //float speed2
  float alpha = map(speed/30, 0, 20, 0, 15);                    //float alpha effect
  //println(alpha);
  float lineWidth = map(speed, 0, 10, 10, 1);                  //float linewidth as fast as you move the mouse the lines ara gonna be thicker
  lineWidth = constrain(lineWidth, 0, 5);                      
  noStroke();
   fill(0, alpha);                                              //fill from zero to alpha
  rect(width/2, height/2, width, height);                        
 
  stroke(red, green, blue, 255);                                  //stroke with those variables
  strokeWeight(lineWidth);                                        
 
  ellipse(mouseX, mouseY, speed2, speed2);                         //create elipse in the same coordinates as the points but as fast you moce the mouse
  line(pmouseX,pmouseY,mouseX,mouseY);                             //create line in the same coordinates as the points but as fast you moce the mouse
  

}


//define keyreleased code block
void keyReleased()
{
  if(key == DELETE || key== ENTER ) setup();                  //if statement ,if delete or enter are pressed then everything are deleted and the sketch goes to
                                                                      //his first state where it waiting for input
  if(key == 's' || key== 'S' )saveFrame("screenshot.png");            //if statement, you can use the s or S to save your creation
}

