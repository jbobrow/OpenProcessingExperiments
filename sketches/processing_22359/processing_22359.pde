
//naming the image variable. 
PImage treebackground;
PImage shakingtree; 

//image sizing and selection.
void setup() {
   smooth();
   size(600,400);
   treebackground = loadImage("treebackgroundsmall.jpg");
   shakingtree = loadImage("treeshakingsmall.jpg");
}

//determining decimal variables that will cause the jitter image to move. 
float angle;
float cosine;
float jitter;

//setting the background image (that can not be seen).
void draw() {
background(treebackground);

//playing with how fast it jitters around and setting restrictions.
if(second()%5 == 0){
jitter = (random(-0.4, 0.20));
}
 
//having both a jitter and angle (rotation). 
  angle = angle + jitter;
  cosine = sin(angle);
  translate(width/2, height/2);
  rotate(cosine);
  
//positioning the jitter image based on a corner (hence why negative numbers are used).
  imageMode(CORNER);
  image(shakingtree,-369,-350);
}




