
int numShapes=20; 
int numPngs=27;
PImage[] images= new PImage[numPngs];
PShape[] shapes= new PShape[numShapes];
String imageName;
int keys=0;  

float slidingLess=-2;
float slidingMore=2;

float x=0, y=0;
float speed=.5;
float angle=.0;

float dragX=.015;
float dragY=.015;
float dragScaleX=1.0;
float dragScaleY=1.0;
float easing=.0175;



void setup(){
  size(480,320);
  smooth();
  noCursor(); 

  frameRate(24);
  randomSeed(4);
  
 
  for(int i=0; i< shapes.length;i++){
    imageName="fsmleg"+nf(i+1,4)+".svg";
    shapes[i]=loadShape(imageName);
  }
 for(int i=0; i<images.length; i++){
    imageName="fsmfood"+nf(i+1,3)+".png";
    images[i]=loadImage(imageName);

 }
  
    
}


void draw(){
  
  
  if(dragScaleX!=1.0 || dragScaleY!=1.0){  //drag mouse to change scale
   dragScaleX+=(1-dragScaleX)*easing;
  dragScaleY+=(1-dragScaleY)*easing; } 
  scale(dragScaleX, dragScaleY);
  

 
  if (keys==-1) PngLoader();
  else {ShapeLoader();}
  

}



  void mouseDragged(){
  
    if((mouseX<width/2 && mouseX>pmouseX) || (mouseX> width/2 && mouseX<pmouseX))
    dragScaleX+=dragX;
      else if ((mouseX<width/2 && mouseX<pmouseX) || (mouseX> width/2 && mouseX>pmouseX))
      dragScaleX-=dragX;
    if((mouseY<height/2 && mouseY>pmouseY) || (mouseY> height/2 && mouseY<pmouseY))
    dragScaleY+=dragY;
    else  if((mouseY<height/2 && mouseY<pmouseY) || (mouseY> height/2 && mouseY>pmouseY))
    dragScaleY-=dragY;
  }
 
      
   
      
      
 
  void keyPressed(){
     if(key==' '){
      if(keys==0 || keys==1){
    
      keys=-1; 
      }
      else {
      
        keys=1;
      }
     }
    }
 
      
  
  
 void ShapeLoader(){

  background(200);
  angle=0;
   for(int i=0; i<shapes.length; i++){
     
             x=mouseX-width/2;
             y=mouseY-height/2;
        
        angle+=random(-.001,.001);  //for creating movement, doesn't work very well
        x+=cos(angle)*speed;
        y+=sin(angle)*speed;
             
      pushMatrix();    
  rotate(angle);
  translate(constrain(x,-45, width/3), constrain(y, -20, height/2));  //Im not sre why I needed to constrain like this
  translate(random(-1,1), random(-1,1));  
    rotate(random(-.01,.01));
    shape(shapes[i],0,0);
   popMatrix();

  
   }
 }
 

   

