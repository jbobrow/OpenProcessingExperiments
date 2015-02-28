
float gravity = 6.674E-11;// N m^2 kg^−2
body[] bodies;
int standardHeight = 1024;
PImage bg;
PVector cameraLocation;
float cameraWidth;
float time;
float timeStep;
timeValue[] timeValues;
float timeStepAcceleration = 0.1;
String help = "\narrows : time\nspace : scale";
void setup(){
  size(800,600);
  bg = loadImage("MilkyWay.jpg");
//  if(1f*width/height>1f*bg.width/bg.height){
//    bg.resize(width,0);
//  }else{
//    bg.resize(0,height);
//  }
//  bg.save("MilkyWay_small.jpg");
  String[] data = loadStrings("MoonData.txt");
  bodies = new body[0];
  for(int i=1;i<data.length;i++){
    String[] columns = split(data[i],"\t");
    if(i==1){
      bodies = (body[]) append(bodies,new body(
        columns[0],
        float(columns[2]),
        float(columns[4])*1000,
        loadImage(columns[0]+".jpg")));
    }else{
      PImage img = loadImage(columns[0]+"_small.jpg");
//      if(img.height>standardHeight){
//        img.resize(0,standardHeight);
//      }
//      img.save(columns[0]+"_small.jpg");
      bodies = (body[]) append(bodies,new body(
        columns[0],
        getBody(columns[1]),
        float(columns[2]),
        float(columns[3])*1000,
        float(columns[4])*1000,
        img));
    }
  }
  makeAllOrbitsLow();
  cameraReset();
  imageMode(CENTER);
  stroke(255,128);
  ellipseMode(CENTER);
  strokeWeight(5);
  noFill();
  selectedBody = getBody("Sun");
  mouseDown = new PVector();
  timeValues = new timeValue[8];
  timeValues[0] = new timeValue("seconds/s",1f/60f);
  timeValues[1] = new timeValue("minute/s",1f/60f*60);
  timeValues[2] = new timeValue("hours/s",1f/60f*60*60);
  timeValues[3] = new timeValue("days/s",1f/60f*60*60*24);
  timeValues[4] = new timeValue("weeks/s",1f/60f*60*60*24*7);
  timeValues[5] = new timeValue("months/s",1f/60f*60*60*24*31);
  timeValues[6] = new timeValue("years/s",1f/60f*60*60*24*365);
  timeValues[7] = new timeValue("decades/s",1f/60f*60*60*24*365*10);
  timeStep = timeValues[2].value;
}
void cameraReset(){
  cameraLocation = new PVector();
  cameraWidth = 2*getBody("Neptune").orbit()*width/height;
}
class timeValue{
  String name;float value;
  timeValue(String nam,float val){
    name = nam;value = val;
  }
}
void draw(){
  background(0);
  image(bg,width/2,height/2);
  if(bodySelected){
    cameraLocation.sub(selectedBody.getLocation(time));
    mouseDown.sub(selectedBody.getLocation(time));
  }
  time += timeStep;
  if(bodySelected){
    cameraLocation.add(selectedBody.getLocation(time));
    mouseDown.add(selectedBody.getLocation(time));
  }
//  float time = 0;
  for(int i=0;i<bodies.length;i++){
    PVector loc = bodies[i].getLocation(time);
    loc.sub(cameraLocation);
    loc.mult(width/cameraWidth);
    loc.add(new PVector(width/2,height/2));
    float toScreenRad = bodies[i].radius*width/cameraWidth;
    if(bodies[i].name.equals("Sun")){toScreenRad
      *= (1f+250f/bodies[i].picture.width);}
    float toScreenWidth = toScreenRad
      *bodies[i].picture.width/bodies[i].picture.height;
    if(loc.x>-toScreenWidth&&loc.y>-toScreenRad
      &&loc.x<width+toScreenWidth&&loc.y<height+toScreenRad){
      if(toScreenRad<1){
        int a = round(loc.x);int b = round(loc.y);
        if(a>=0&&a<width&&b>=0&&b<height){
          set(a,b,color(255));
        }
        if(allOrbitsAreLow==false&&toScreenRad>0.01){
          text(bodies[i].name,5+loc.x,-5+loc.y);
        }
      }else{
        image(bodies[i].picture,loc.x,loc.y,
          2*toScreenRad*bodies[i].picture.width
          /bodies[i].picture.height,2*toScreenRad);
        if(bodies[i].name.equals("Sun")){toScreenRad
          /= (1f+250f/bodies[i].picture.width);}
        text(bodies[i].name,loc.x+toScreenRad,loc.y);
        if(bodySelected){
          if(selectedBody==bodies[i]){
            ellipse(loc.x,loc.y,2*toScreenRad,2*toScreenRad);
          }
        }
      }
    }
  }
  if(mousePressed){
    if(mouseButton==LEFT){
      // click and drag
      PVector drag = PVector.sub(mouseDown,mouseToScreen());
      drag.mult(0.5);
      cameraLocation.add(drag);
    }else if(mouseButton==RIGHT){
      float z = -(mouseY-mouseYzoom)*4f/height;
//      if(bodySelected){
//        PVector selectedOnScreen = PVector.mult(PVector.sub(
//          cameraLocation,selectedBody.getLocation(time)),
//          1f/cameraWidth);
//        cameraWidth = constrain(mouseZoom*exp(z),6.2,
//          2*getBody("Neptune").orbit()*width/height);
//        cameraLocation = PVector.add(PVector.mult(
//          selectedOnScreen,cameraWidth),
//          selectedBody.getLocation(time));
//      }else{
//      }
      PVector selectedOnScreen = PVector.mult(PVector.sub(
        cameraLocation,mouseDown),
        1f/cameraWidth);
      cameraWidth = constrain(mouseZoom*exp(z),
        getBody("Deimos").radius,
        12*getBody("Neptune").orbit()*width/height);
      cameraLocation = PVector.add(PVector.mult(
        selectedOnScreen,cameraWidth),
        mouseDown);
    }
//    if(keyPressed&&key==' '){
//      if(mouseButton==LEFT){
//        // translate at velocity
//        PVector m = new PVector(mouseX-width/2,mouseY-height/2);
//        m.mult(cameraWidth/height*0.02);
//        cameraLocation.add(m);
//      }else if(mouseButton==RIGHT){
//        float z = (mouseY-height/2)*0.1/height;
//        cameraWidth *= exp(z);
//      }
//    }else{}
  }
  textFont(createFont("Calibri",16));
  for(int i=1;i<timeValues.length;i++){
    if(timeStep>timeValues[i-1].value
      &&timeStep<=timeValues[i].value){
      text(nf(timeStep/timeValues[i-1].value,1,1)+" "+
        timeValues[i-1].name+help,8,16);
    }
  }
}
PVector mouseToScreen(){
  PVector m = new PVector(mouseX-width/2,mouseY-height/2);
  m.mult(cameraWidth/width);
  m.add(cameraLocation);
  return m;
}
PVector mouseDown;
float mouseZoom;
int mouseYzoom;
body selectedBody;
boolean bodySelected = false;
void mousePressed(){
  mouseDown = mouseToScreen();
  if(mouseButton==RIGHT){
    mouseYzoom = mouseY;
    mouseZoom = cameraWidth;
  }else{
    bodySelected = false;
    for(int i=0;i<bodies.length;i++){
      PVector bodyLoc = bodies[i].getLocation(time);
      PVector dx = PVector.sub(bodyLoc,mouseToScreen());
      if(dx.mag()<bodies[i].radius){
        selectedBody = bodies[i];
        bodySelected = true;
      }
    }
  }
}
boolean allOrbitsAreLow = false;
void keyPressed(){
  if(key=='r'){
    cameraReset();
  }
  if(key==' '){
    PVector selectedOnScreen = PVector.mult(PVector.sub(
      cameraLocation,selectedBody.getLocation(time)),
      1f/cameraWidth);
    if(allOrbitsAreLow){
      allOrbitsAreLow = false;
    }else{
      makeAllOrbitsLow();
      if(bodySelected==false){cameraReset();}
    }
    if(bodySelected){
      cameraLocation = PVector.add(PVector.mult(
        selectedOnScreen,cameraWidth),
        selectedBody.getLocation(time));
    }
  }
  if(keyCode==UP){
    timeStep = timeStep/(1f-timeStepAcceleration);
  }else if(keyCode==DOWN){
    timeStep = timeStep*(1f-timeStepAcceleration);
  }
  timeStep = constrain(timeStep,timeValues[0].value+1f/60f/1000f,
    timeValues[timeValues.length-1].value);
}

