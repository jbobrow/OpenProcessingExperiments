
void setup() {
  size(500,500); //size of window
  stroke(255); // defines the outline of a shade
  smooth();
  
}

int time; // time
int x = 250; // defines what x equals
     void draw() {
       background (255); //clear the screen (white)
       fill (0); // fills shapes black
       stroke(0); // black outline       
       ellipse (x,x,300,400); //black ellipse: body
       ellipse (x+90,x+190,155,50); //black ellipse: right foot
       ellipse (x-90,x+190,155,50); //black ellipse: left foot
       
       pushMatrix(); //start translation
       translate(250, -300); //translate shape
       rotate(PI/3.25); //rotates translated shape
       translate(200, -300); //translate shape
       rotate(PI/15); //rotates translated shape
       ellipse (x+245,x+175,175,75); //black ellipse: right arm
       popMatrix(); //stop translation


        time++; // adds one to time everytime function loops
        time = time%120; // takes the remainder of time to use in "if" statement
       if (time>5) { 
         fill (255); //fills shapes white
         ellipse (x-65,x-40,80,200); //white ellipse: left eye
         ellipse (x+65,x-40,80,200); //white ellipse: right eye        
         fill (0); // fills shapes black
         stroke(0); // black outline
         ellipse (x-65,x,50,100); //black ellipse: left eye
         ellipse (x+65,x,50,100); //black ellipse: right eye
       }
       
       else {
         fill (255); // fills shapes white
         stroke(255); // white outline
         line(x-30,x-40,x-100,x-40); //white line: left eye
         line(x+30,x-40,x+100,x-40); //white line: right eye
       }
       
      if (mousePressed) {
       fill(0); // fills shapes black
       stroke (0); // black outline
       pushMatrix(); //start translation
       rotate(PI/12); //rotates translated shape
       translate(-200, -200); //translate shape
       ellipse (x+90,x+190,175,75); //black ellipse: left arm
       popMatrix(); //stop translation
      }
       
      else { 
       fill(0); // fills shapes black
       stroke (0); // black outline
       pushMatrix(); //start translation
       translate(250, -300); //translate shape
       rotate(PI/3.25); //rotates translated shape
       ellipse (x+90,x+190,175,75); //black ellipse: left arm
       popMatrix(); //stop translation
      }
  }


