
void setup() {
    size(640,480);
  
}

void draw() {
  
  background (85,36,145);
  smooth ();
  stroke(55,100,85);
  strokeWeight (7);
  fill(125,205
 ,55); 
  
  //quad(1,50
//,400,45,400,400,200,88);
   //line top
  rect (300,10,22,220);
  
  quad(78,10,11,23,77,55,55,55);
  quad (480,300,11,23,77,55,55,55);
  //Cintas
  ellipse (450,122,12,155);
  //cintas 2
  ellipse (205,122,12,155);
  //cintas 3
  ellipse (127,50,12,155);
  //cintas 3
  ellipse (507,37,12,155);
  
  ellipse (320,300,144,177);
  ellipse (320,355,125,187);
  rect (277,155,22,22);
  rect (340,155,22,22);
  rect (12,55,54,75);
  rect (550,155,22,22);
  //line left top
  rect (37,300,37,220);
  //line right
  rect (580,300,29,220);
 //line left botton
  rect (37,300,37,220);
  
  
  //cintas LOW
  //Cintas
  ellipse (150,557,12,350);
  //cintas 2
  ellipse (490,420,12,155);

  println( "x: "+ mouseX + "y: " +mouseY);
  
}




