
PImage believe1;
PImage in1;
PImage yourself1;
PImage believe2;
PImage in2;
PImage yourself2;
PImage blueback;
int myState = 0;
 
void setup() {
  size(500, 400);
  believe1 = loadImage("believe1.png") ;
  in1 = loadImage("in1.png") ;
  yourself1 = loadImage("yourself1.png") ;
  believe2 = loadImage("believe2.png") ;
  in2 = loadImage("in2.png") ;
  yourself2 = loadImage("yourself2.png") ;
  blueback = loadImage("blueback.png") ;
}
 
void draw() {
 
  switch(myState) {
    case 0:
    image(blueback, 0, 0) ;
    break ;
     
    case 1:
    image(believe1, 0, 0) ;
    break ;
 
    case 2:
    image(in1, 0, 0) ;
    break ;
 
    case 3:
    image(yourself1, 0, 0) ;
    break ;
 
    case 4:
    image(believe2, 0, 0) ;
    break ;
 
    case 5:
    image(in2, 0, 0) ;
    break ;
     
    case 6:
    image(yourself2, 0, 0) ;
    break ;
    
    }
    
  }

 
void keyPressed() {
  //println(key)
   
 switch(key){
   case'a':
   //println("next");
   myState = myState + 1;
   if (myState > 6) {
     myState = 0;
   break;
}
}
}


