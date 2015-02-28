
//Pierre MARZIN

//list to store the drawn points
ArrayList  P;
//how many steps for the revolution
float step;
 
void setup(){
  //environment
  size(800,800,P3D);
  smooth();
  background(255);
  strokeWeight(1);
  stroke(0);
  frameRate(200);
  //variables initiation
  P=new ArrayList();
  strokeWeight(1);
  step=.1;
}
 
void draw(){
  if(mousePressed){
    //when mouse is pressed, we store the points in the list and draw them
    P.add(new PVector(mouseX,mouseY,0));    
    point(mouseX,mouseY);
  }
}
 void mouseReleased(){
   
  //when mouse is released, we pick two random colors 
   strokeWeight(.5);
   color c0= color(random(255),random(255),random(255),60);
   color c1= color(random(255),random(255),random(255),150);
   stroke(c1,100);
   //the profile we've drawn will be rotated around an axis, parallel to Y and passing through (mouseX,mouseY,0) 
   translate(mouseX,mouseY);
    for(int i=0;i<P.size()-1;i++){  //for each segment of the profile
      PVector v=(PVector)P.get(i);
      PVector w=(PVector)P.get(i+1);
      for(float a=0;a<2*PI;a+=step){  //for each rotation of a step angle
       float cosa=cos(a);
       float sina=sin(a);
       float cosb=cos(a+step);
       float sinb=sin(a+step);
       fill(lerpColor(c0,c1,abs(cos(a)))); //color varies smoothly from one color to the other
       
       //and we draw the new face
       beginShape();
       vertex((v.x-mouseX)*cosa,v.y-mouseY,-(v.x-mouseX)*sina);
       vertex((w.x-mouseX)*cosa,w.y-mouseY,-(w.x-mouseX)*sina);
       vertex((w.x-mouseX)*cosb,w.y-mouseY,-(w.x-mouseX)*sinb);
       vertex((v.x-mouseX)*cosb,v.y-mouseY,-(v.x-mouseX)*sinb);
       endShape();
       }
    }
    //profile is reinitialized
   P=new ArrayList();
   stroke(0);
   strokeWeight(1);
 }
 void keyPressed(){
   //clear the display when hitting space bar
   if(keyCode==32)background(255);
 }

