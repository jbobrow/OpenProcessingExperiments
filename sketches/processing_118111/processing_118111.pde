
Layer layer;
Anchor activeAnchor;
Button activeButton;
int dim = 800;
int thickness = 5;
int dragging = 0;
ArrayList inkx = new ArrayList();
ArrayList inky = new ArrayList();
ArrayList<Anchor> anchors = new ArrayList<Anchor>();
ArrayList<Button> buttons = new ArrayList<Button>();
float[] dragDs = {0.0,0.0,0.0,0.0};

void setup(){
  size(800,800);
  layer = new Layer();
  Button penButton = new Button(5,5,50,20,"Draw");
  Button eraseButton = new Button(60,5,50,20,"Erase");
  Button anchorButton = new Button(115,5,50,20,"Move");
  activeButton=penButton;
  buttons.add(penButton);
  buttons.add(eraseButton);
  buttons.add(anchorButton);
}

void draw(){
  background(250);
  layer.drawLayer();
  textSize(15);
  text("Tessela v0.9 by Guillaume Riesen",295,790);
  for(int i = 0;i<buttons.size();i++){
    Button daButton = buttons.get(i);
    daButton.drawButton();
  }
}

class Button{
  float x,y,w,h;
  String label;
  Button(float theX,float theY,float theW,float theH,String theLabel){
    x=theX;
    y=theY;
    w=theW;
    h=theH;
    label = theLabel;
  }
  void drawButton(){
    stroke(50);
    if(this==activeButton){stroke(200,50,50);}
    fill(255);
    strokeWeight(3);
    rect(x,y,w,h);
    fill(0);
    text(label,x+6,y+16);
  }
}

class Layer{
  Anchor anchor1, anchor2;
  ArrayList<Float> inkx;
  ArrayList<Float> inky;
  ArrayList<Float> inkColor;
  
  Layer(){
    anchor1 = new Anchor(400,400,100,0);
    anchor2 = new Anchor(400,400,0,100);
    activeAnchor = anchor1;
    inkx = new ArrayList<Float>();
    inky = new ArrayList<Float>();
    inkColor = new ArrayList<Float>();
  }
  void drawLayer(){
    anchor1.display();
    anchor2.display();
    pushMatrix();
    translate(anchor1.x,anchor1.y);
    rotate(anchor1.angle);
    strokeWeight(thickness/anchor1.s);
    scale(anchor1.s);
    for(int i=2;i<inkx.size();i=i+1){
      if(inkx.get(i)!=-1000 && inkx.get(i-1)!=-1000){
        color inkC;
        if(inkColor.get(i)==1){
          inkC = color(50,50,50);
        }else{
          inkC = color(250,250,250);
        }
        stroke(inkC);
        if(anchor1==activeAnchor&&inkC!=color(250,250,250)){
          stroke(150,50,50);
        }
        line(inkx.get(i-1),inky.get(i-1),inkx.get(i),inky.get(i));
      }
    }
    popMatrix();
    
    pushMatrix();
    translate(anchor2.x,anchor2.y);
    rotate(anchor2.angle);
    strokeWeight(thickness/anchor2.s);
    scale(anchor2.s);
    for(int j=1;j<inkx.size();j=j+1){  
      if(inkx.get(j)!=-1000 && inkx.get(j-1)!=-1000){
        color inkC;
        if(inkColor.get(j)==1){
          inkC = color(50,50,50);
        }else{
          inkC = color(250,250,250);
        }
        stroke(inkC);
        if(anchor2==activeAnchor&&inkC!=color(250,250,250)){
          stroke(100,0,0);
        }
        line(inkx.get(j-1),inky.get(j-1),inkx.get(j),inky.get(j));
      }
    }
    popMatrix();
  }
  void addInk(float newX,float newY){
    if(newX!=-1000){
      float cs = cos(-activeAnchor.angle);
      float sn = sin(-activeAnchor.angle);
      newX = newX-activeAnchor.x;
      newY = newY-activeAnchor.y;
      float finalX = newX*cs-newY*sn;
      float finalY = newX*sn+newY*cs;
      finalX = finalX/(activeAnchor.s);
      finalY = finalY/(activeAnchor.s);
      inkx.add(finalX);
      inky.add(finalY);
      if(activeButton.label=="Erase"){
        inkColor.add(-1.0);
      }else{
        inkColor.add(1.0);
      }
    }else{//Means a new line is being started
      inkx.add(newX);
      inky.add(newY);
      inkColor.add(5.0);
    }
  }    
}
    

class Anchor{
  float x, y, x2, y2, dx, dy;
  float s;
  float angle;
  
  Anchor(float xpos, float ypos, float xSize, float ySize){
    x = xpos;
    y = ypos;
    dx = xSize;
    dy = ySize;
    x2 = x + dx;
    y2 = y + dy;
    s = sqrt(sq(dx)+sq(dy));
    angle = 0;
    anchors.add(this);
  }
  
  void display(){
    stroke(0);
    fill(0);
    if(activeButton.label=="Move"&&this==activeAnchor){
      if(dragging==1){
        x = mouseX;
        y = mouseY;
      }
      if(dragging==2){
        x2 = mouseX;
        y2 = mouseY;
      }
      if(dragging==3){
        x = mouseX+dragDs[0];
        y = mouseY+dragDs[1];
        x2 = mouseX+dragDs[2];
        y2 = mouseY+dragDs[3];
      }
      dx = x2-x;
      dy = y2-y;
      s = sqrt(sq(dx)+sq(dy));
    }
    pushMatrix();
    translate(x,y);
    angle = atan(dy/dx);
    rotate(angle);
    if(dx<0){
      rotate(PI);
      angle = angle+PI;
    }
    scale(s);
    strokeWeight(1/s);
    if(this==activeAnchor){
      stroke(200,50,50);
    }else{
      stroke(50);
    }
    line(0,0,1,0);
    line(.1,0,.2,.1);
    line(.2,.1,.3,0);
    ellipse(0,0,3/s,3/s);
    ellipse(1,0,3/s,3/s);
    popMatrix(); 
  }
}

void mouseDragged(){
  if(activeButton.label=="Draw"||activeButton.label=="Erase"){
    layer.addInk(mouseX,mouseY);
  }
}

void mousePressed(){
  for(int i=0;i<buttons.size();i++){
    Button iButt=buttons.get(i);
    if(mouseX>iButt.x&&mouseX<iButt.x+iButt.w&&mouseY>iButt.y&&mouseY<iButt.y+iButt.h){
      activeButton=iButt;//hehe
      break;
    }
  }
  if(activeButton.label=="Draw"||activeButton.label=="Erase"){
    layer.addInk(-1000,-1000);//signal to start a new stroke
  }else{
    Anchor iAnch;
    for(int i=0;i<anchors.size();i++){//check whether any anchors are being selected
       iAnch = anchors.get(i);
       float mdx = mouseX-iAnch.x;
       float mdy = mouseY-iAnch.y;
       float s2 = sq(iAnch.s);
       float clickDist;
       float t = ((mouseX-iAnch.x)*iAnch.dx + (mouseY-iAnch.y)*iAnch.dy)/s2;
       if(s2==0){
         clickDist = sq(mouseX-iAnch.x)+sq(mouseY-iAnch.y);
       }else if(t<0){ 
         clickDist = sq(mouseX-iAnch.x)+sq(mouseY-iAnch.y);
       }else if(t>1){ 
         clickDist = sq(mouseX-iAnch.dx)+sq(mouseY-iAnch.dy);
       }else{
         clickDist = sq(mouseX-(iAnch.x+t*iAnch.dx))+sq(mouseY-(iAnch.y+t*iAnch.dy));
       }
       if(clickDist < 15){
         activeAnchor = anchors.get(i);
         if(dragging!=0){
           dragging=0;
         }else{
           dragging = 3;
           float[] stupidSyntaxWorkaround = {iAnch.x-mouseX,iAnch.y-mouseY,iAnch.x2-mouseX,iAnch.y2-mouseY};
           dragDs = stupidSyntaxWorkaround;
           if(abs(mouseX-iAnch.x)<15&&abs(mouseY-iAnch.y)<15){
             activeAnchor = anchors.get(i);
             dragging = 1;
           }
           if(abs(mouseX-iAnch.x-iAnch.dx)<15&&abs(mouseY-iAnch.y-iAnch.dy)<15){
             activeAnchor = anchors.get(i);
             dragging = 2;
           }
         }
       }
    }
  }
}



