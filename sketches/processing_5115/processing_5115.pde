
float backgroundshape,R,G,B,A;               
int x,y; 

void setup() {
  size(600,600);
  background(255);                    //white
  smooth();
  noStroke();
  backgroundshape = dist(30, 30, width, height);  //origin of shape
}

void draw(){

  pushMatrix(); 
  translate(mouseX - (width / 2), mouseY - (height / 2));
  stroke(255);
  translate(x,y);                //makes it happen 
  if (mousePressed) {     
    quad(301, 190, 208, 252, 205, 320, 360, 245);  //main wing
    quad(405, 315, 258, 426, 344, 445, 410, 362); //bottom wing

    triangle(51, 273, 0, 320, 72,290); //head
    quad(205, 320, 360, 245, 405, 315, 258, 426); //body
    triangle(50, 273, 270, 340, 260, 425); //neck
    triangle(205, 320, 280, 275, 270, 340); //middle small
    triangle(280, 274, 258, 426, 405, 315); //middle large
    triangle(485, 130, 360, 245, 405, 315); //tail


  } 
  else {

    quad(360, 245, 205, 320, 258, 426,405, 315); //body

    triangle(230, 120, 205, 320, 360, 245);  //main wing
    triangle(50, 273, 270, 340, 260, 425); //neck
    triangle(51, 273, 0, 320, 72,290); //head


    triangle(205, 320, 280, 275, 270, 340); //middle small

    triangle(280, 274, 258, 426, 405, 315); //middle large
    triangle(485, 130, 360, 245, 405, 315); //tail
    triangle (405, 315, 258, 426, 450, 460); //bottom wing
  }

  popMatrix();

  //iteration
  //noStroke();
  for(float i = 10; i < 600; i+=10){  //declare x starts at 10, repeat as long as x is less than 600, spacing of shapes
  }
  for(int j = 0; j <=height; j += 20){     ///nested for statement declare variable; states conditional -height of page/changes each loop
    for(int i = 0; i <= width; i += 20){    //x and y start at 0, draw distance of the height/width, boxes distance 20      

      float mouseDist = dist(mouseX, mouseY, i, j);          //flex
      float width = (mouseDist / backgroundshape) * 40.0;       //size of boxes near mouse
      float height = (mouseDist / backgroundshape) * 40.0;           //size of boxes near mouse


      //  frameRate(8);                                        //speed of boxes
      // R=random(255);                                       //random color
       //G=random(100);                                      //color value
       //B=random(100);                                   //color value
       //A=random(60);                                        //transparent
      fill(116,206,193, 60);                                         //color value
      rect(i, j, width, height);                            //shape
    }
  }

}









