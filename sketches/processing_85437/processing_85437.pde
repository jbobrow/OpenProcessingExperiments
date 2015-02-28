
//Pierre MARZIN

PFont font;
//arraylist to store the profile points
ArrayList  P;
//revolution steps
float step;
//first point of the rotation axis
PVector A;
int drawMode;
//3 layers
PGraphics axisLayer,profileLayer,volumeLayer;

void setup(){
  size(600,600,P3D);
  background(255); 
  font = loadFont("CenturyGothic-18.vlw"); 
  textFont(font); 
  fill(0);
  textMode(SCREEN);
  text("Doodle, then click somewhere and drag to define the axis of rotation \n(red line), and so on... Space bar to restart. Have fun", 5, 40); 
  P=new ArrayList();
  //revolution steps
  step=.1;
  //used to define the different moments (drawing, defining the axis, rendering)
  drawMode=0;
  //layer for drawing the axis
  axisLayer=createGraphics(width,height,P3D);
  //layer for drawing the profile
  profileLayer=createGraphics(width,height,P3D);
  //layer for rendering the volume
  volumeLayer=createGraphics(width,height,P3D);
  axisLayer.beginDraw();
  axisLayer.background(255,0);
  axisLayer.strokeWeight(.5);
  axisLayer.stroke(#FF0000);
  axisLayer.endDraw();
  profileLayer.beginDraw();
  profileLayer.background(0,0);
  profileLayer.stroke(0);
  profileLayer.endDraw();
  volumeLayer.beginDraw();
  volumeLayer.smooth();
  volumeLayer.background(255,0);
  volumeLayer.endDraw();
}

void draw(){
 
  // first we draw the profile on layer profileLayer
  if(mousePressed && drawMode==0){    
    P.add(new PVector(mouseX,mouseY,0));
    line(pmouseX,pmouseY,mouseX,mouseY);
    profileLayer.line(pmouseX,pmouseY,mouseX,mouseY);
  }
  if (mousePressed && drawMode==1){//first point of the axis is placed
     A=new PVector(mouseX,mouseY);
     drawMode++;
   }
  //when the first point of the axis is defined, we draw the axis 
  //(we have to clear the canvas and redraw all layers)
  if(drawMode==2){
    background(255);
    axisLayer.beginDraw();
    axisLayer.background(255,0);
    axisLayer.line(A.x,A.y,mouseX,mouseY);    
    axisLayer.endDraw();   
    image(volumeLayer,0,0); 
    image(axisLayer,0,0);  
    image(profileLayer,0,0);
  }    
}
 void mouseReleased(){
   if(drawMode==0) {
     drawMode++;//profile is drawn
   }
   else{//second point of the axis is placed, so we calculate and render the volume
   profileLayer.background(255,0);//clear the profile
   axisLayer.background(255,0);//clear the axis
   volumeLayer.beginDraw();
   volumeLayer.strokeWeight(.5);
   // two random colors are used to vary the volume's color
   color c0= color(random(255),random(255),random(255),60);
   color c1= color(random(255),random(255),random(255),150);
   volumeLayer.stroke(c0,30);
   volumeLayer.translate(mouseX,mouseY);
   PVector U=new PVector(mouseX-A.x,mouseY-A.y);//U is the vector representing the rotation axis
   U.normalize();
   float ux=U.x;
   float uy=U.y;
    for(int i=0;i<P.size()-1;i++){//for each pair of points in the profile
      PVector v=(PVector)P.get(i);
      PVector w=(PVector)P.get(i+1);
      for(float a=0;a<2*PI;a+=step){// rotation around the axis
        float cosa=cos(a);
        float sina=sin(a);
        float cosb=cos(a+step);
        float sinb=sin(a+step);
       volumeLayer.fill(lerpColor(c0,c1,abs(cos(a))));//color varies
       
       //rotation matrix is applied to each pair of points in the profile
       //and the face is rendered to the "volume" layer
       volumeLayer.beginShape();
       volumeLayer.vertex((v.x-mouseX)*(ux*ux+(1-ux*ux)*cosa)+(v.y-mouseY)*(ux*uy*(1-cosa)),(v.x-mouseX)*ux*uy*(1-cosa)+(v.y-mouseY)*(uy*uy+(1-uy*uy)*cosa),
       -(v.x-mouseX)*uy*sina+(v.y-mouseY)*(ux*sina));
       volumeLayer.vertex((w.x-mouseX)*(ux*ux+(1-ux*ux)*cosa)+(w.y-mouseY)*(ux*uy*(1-cosa)),(w.x-mouseX)*ux*uy*(1-cosa)+(w.y-mouseY)*(uy*uy+(1-uy*uy)*cosa),
       -(w.x-mouseX)*uy*sina+(w.y-mouseY)*(ux*sina));
       volumeLayer.vertex((w.x-mouseX)*(ux*ux+(1-ux*ux)*cosb)+(w.y-mouseY)*(ux*uy*(1-cosb)),(w.x-mouseX)*ux*uy*(1-cosb)+(w.y-mouseY)*(uy*uy+(1-uy*uy)*cosb),
       -(w.x-mouseX)*uy*sinb+(w.y-mouseY)*(ux*sinb));
       volumeLayer.vertex((v.x-mouseX)*(ux*ux+(1-ux*ux)*cosb)+(v.y-mouseY)*(ux*uy*(1-cosb)),(v.x-mouseX)*ux*uy*(1-cosb)+(v.y-mouseY)*(uy*uy+(1-uy*uy)*cosb),
       -(v.x-mouseX)*uy*sinb+(v.y-mouseY)*(ux*sinb));
       volumeLayer.endShape();       
       }            
    }
    volumeLayer.endDraw();
    //new Profile
   P=new ArrayList();
   //ready to draw another volume
   drawMode=0;
   //volume is rendered
   image(volumeLayer,0,0);
   }
 }
 void keyPressed(){
   if(keyCode==32){
     background(255);
     volumeLayer.background(255,0);
   }
 }


