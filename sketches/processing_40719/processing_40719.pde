
//the scene is supposed to be 2 baby birds in a tree in a nest.
//the nest falls.
//the mama bird, purple, flies to save falling baby
//gets shot from hunter in tree blind which is out of picture
//one baby lives- sort of morbid;
  

void setup ( ) {
size (660, 600);
nest = 225;
mama = 0;
}
int nest;
int mama;
void draw ( ) {
  background (175, 215, 220, 90);
  line (450, 200, 450, 550);
  line (550, 200, 550, 550); 
  fill (#18A779);
  ellipse (450, 120, 125, 125);
  fill (#0DB451);
  ellipse (370, 135, 125, 125);
  fill (#1DCE65);
  ellipse (380, 250, 150, 150);
  fill (#195F05);
  ellipse (450, 230, 125, 125);
  fill (#6BAD57);
  ellipse (520, 100, 125, 125);
  fill (#1DCE65);
  ellipse (550, 175, 150, 150);
  fill (#0DB451);
  ellipse (560, 275, 140, 140);
  fill (#816804);
  rect (375, nest, 80, 50);
  nest ++;
  fill (0,0,225);
  ellipse (375, nest, 40, 40);
  fill (#F9FA08);
  triangle (380, nest, 390, nest, 395, nest);
  fill (0, 0, 225);
  ellipse (425, 225, 40, 40);
  fill (#F9FA08);
  triangle (430, 225, 440, 225, 445, 230);
  fill (#7C08FA);
  ellipse (mama + 1, height/2, 60, 50);
  triangle (mama +1, mama +1, 20, 10, mama +1, mama +1);
  mama ++;
  
  
}


                
                
