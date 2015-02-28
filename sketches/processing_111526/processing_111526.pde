
//This is a simple drawing program
//There are different modes, mainly d(raw) and c(olor)
//you have to start with selecting the shape, f.ex. r(rect), then press d for drawing, then you can press the mouse
//onto the canvas, and a rectangle will appear. Press keys a(rc),e(llipse),r(ectangle),t(triangle) for selecting different shapes
// press c for color mode, then the color you want  eg b(lue),c(cyan), r(ed),g(reen),p(urple),y(ellow), and 
// you have to pay attention to black color =a, changing color=m(ix) else it is intuitive
// o for color off, this is important if you want to change size of forms.
//Then you can drag the mouse to the right to increase the size, to the left to decrease it
//Then again choose d for drawing-> the size is changed
// f for fill the shape, and f again for noShape (form)

int x,y;
char shape;
color _color;
int cr=255;
int cg=255;
int cb=255;
int si=10;
boolean colorMode=false;
boolean drawMode=false;
boolean fillMode=false;

void setup(){
size(400,500);
background(cr,cg,cb);
x=mouseX;
y=mouseY;
shape='n';
cr=0;cg=0;cb=0;
//noLoop();
}

void draw(){
//noFill();
//stroke(40);
//strokeWeight(1);
x=mouseX;
y=mouseY;
}


void mousePressed(){
  //x=mouseX;
 // y=mouseY;
  //si=10;
  strokeWeight(2);
  print("The color values are "+cr+" and "+cg+" and "+cb);
 stroke(cr,cg,cb);
 if(drawMode==true){
switch(shape){
 case 'a':
 arc(x, y, si, si, PI, TWO_PI);
 break; 
 case 'e':
 print("drawing an ellipse"+"\n");
 ellipse(x,y,si,si);
 break;
 case 'r':
  print("drawing a rectangle"+"\n");
 rect(x,y,si,si); 
 break;
  case 'q':
  print("drawing a quad");
  quad(x, y, 216, 18, 216, 360, 144, 360);
 break;
  case 't':
  print("drawing a triangle");
  //has a fixed point, can be changed here with si instead of 360
 //but for really free choice there should be more different values 
 //instead of using only si (could be programmed with size change)
 triangle(x, x,x, si, si, 360); 
 break;
}
 }
}
void mouseReleased(){

}
void mouseDragged(){
  if(drawMode==false){
  if(x<mouseX){
  si+=1;
  print("si"+si);
  }else{
  si-=1;
  print("si"+si);
  }
  print("x:"+x+" mouse x:"+mouseX);
  }
  //also possible for mouseY and another variable

}


void keyPressed(){
  if(key=='c'){
    colorMode=true;
    print ("mode is now color"+_color+": choose one\n");
   }
  if(key=='d'){
    drawMode=true;
    print ("mode is now draw"+": choose one shape!\n");
   }
   //every mode off
    if(key=='o'){
    colorMode=false;
    drawMode=false;
    print ("draw and color off, you can change size now\n");
   }
   
   if(colorMode==false){
    if(key=='a'){
    shape='a';
    print ("assigned arc "+shape+"\n");
   }
   if(key=='e'){
   shape='e';
    print ("assigned ellipse "+shape+"\n");
   } 
   if(key=='l'){
    shape='l';
    print ("assigned line "+shape+"\n");
   }
   if(key=='p'){
    shape='p';
    print ("assigned point "+shape+"\n");
   }
   if(key=='q'){
    shape='q';
    print ("assigned quad "+shape+"\n");
   }
   if(key=='r'){
   shape='r';
    print ("assigned rectangle "+shape+"\n");
   }
   if(key=='s'){
   save("sketchImage.png");
   print ("Image saved"+"\n");
   }
   if(key=='t'){
   shape='t';
   print ("assigned triangle"+shape+"\n");
   }
   }
   if(colorMode==true){
   //colors
    if(key=='a'){
    //assign variables to have the color also for filling
    cr=255; cg=255;cb=255;  
    //stroke(255,255,255);
    print ("black color"+"\n");
    }
    if(key=='b'){
    cr=0; cg=0;cb=255;   
    //stroke(0,0,255);
    print ("blue color"+"\n");
    }
    if(key=='c'){
    cr=0; cg=255;cb=255; 
    //stroke(0,255,255);
    print ("cyan color"+"\n");
    } 
    if(key=='g'){
    cr=0; cg=255;cb=0; 
    //stroke(0,255,0);
    print ("green color"+"\n");
    }  
    if(key=='m'){
    cr=int(random(255)); cg=int(random(255));cb=int(random(255)); 
    print ("random colors"+"\n");
    } 
     if(key=='p'){
    cr=255; cg=0;cb=255; 
    //stroke(255,0,255);
    print ("purple color"+"\n");
    }
    if(key=='r'){
    cr=255; cg=0;cb=0; 
    //stroke(255,0,0);
   // _color=new color(255,0,0);
    print ("red color"+"\n");
    }
    if(key=='y'){
    cr=255; cg=255;cb=0; 
    //stroke(255,255,0);
    print ("yellow color"+cr+cg+cb+"\n");
    }  
   }
   
   if(key=='f'){
   //shape='f';
   if (fillMode==false){
   fill(cr,cg,cb);
    print ("fill mode activated"+shape+"\n");
    fillMode=true;
   }else{
   noFill();
    print ("fill mode deactivated"+shape+"\n");
   }
   }
 
  
}
