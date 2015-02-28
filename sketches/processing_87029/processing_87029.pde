
parent.document.getElementById("appletAjaxContainer").setAttribute("style", "background-color:transparent; border:0px;");

void setup(){
  size(512,512);
  colorMode(HSB);
  noStroke();
  smooth();
  frameRate(32);
}

void draw(){
  externals.context.clearRect(0,0,width,height);
  circles(256,256,256,4);
}

void circles(float x,float y,float rad,int i){
  translate(x,y);
  rotate(radians(frameCount));
  fill((frameCount/1.6)%(256),256,256,32);
  ellipse(0,0,rad*2,rad*2);
  if(i>1){
    circles(  (4-2*sqrt(3))*rad,  0                ,  (2*sqrt(3)-3)*rad,  i-1);
    circles(  (sqrt(3)-2)*rad  ,  (3-2*sqrt(3))*rad,  (2*sqrt(3)-3)*rad,  i-1);
    circles(  (sqrt(3)-2)*rad  ,  (2*sqrt(3)-3)*rad,  (2*sqrt(3)-3)*rad,  i-1);
  }
  rotate(-radians(frameCount));
  translate(-x,-y);
}

