
PImage bg,frame,wheelFG,wheelBG,highLight,wheelPos,push,menu,arrowPointer, menuScenes, menuModes, menuFlashs, menuSettings,shutter,setting,another;
PVector pushPos, menuPos;
float menuWidth;
boolean effectMenuEnabled,menuScenesEnabled, menuModesEnabled, menuFlashsEnabled, menuSettingsEnabled,shot,settingEnabled, anotherEnabled;
int pushXmove, shotAnimationCounter;

Wheel wheel;
void setup() {
  size(960,540);
//  orientation(LANDSCAPE);
  bg =loadImage("pear0.png");
  frame = loadImage("bg0.png");
  wheelPos =loadImage("wheelPos.png");
  push = loadImage("push.png");
  pushPos = new PVector(801,515); 
  menu =loadImage("menu.png");
  menuScenes=loadImage("menu_7.png");
  menuModes=loadImage("menu_4.png");
  menuFlashs=loadImage("menu_3.png"); 
  menuSettings=loadImage("menu_6.png");
  shutter =loadImage("wheelBGshutter.png");
  setting = loadImage("setting.png");
  
  menuPos = new PVector(696,height/2-13); 

  arrowPointer= loadImage("arrow.png");
  wheelBG =loadImage("wheelBG.png");
  wheelFG =loadImage("wheel.png");
  highLight =loadImage("hightlight.png");
    another = loadImage("another.png");
  wheel =new Wheel(new PVector(887,279));  
    
 imageMode(CENTER);   

}

void draw() {
 background(bg); 
 //image(wheelPos,width/2,height/2);
 if(shot)shotAnimation();
 image(frame,width/2,height/2);
 image(push,pushPos.x,pushPos.y);
 if(effectMenuEnabled)image(menu,688,height/2); 

 if( menuScenesEnabled)image(menuScenes,688,height/2-20);
 if(menuModesEnabled)image(menuModes,688,height/2-20);
 if(menuFlashsEnabled)image(menuFlashs,688,height/2-20);
 if(menuSettingsEnabled)image(menuSettings,688,height/2-20);

 if(settingEnabled) image(setting,width/2-46,height/2); 
// menuWidth = map(pushPos.x,821,848,70,0);
// menu.resize(int(menuWidth),menu.height);
 wheel.display();

  if (shotAnimationCounter>0&&shotAnimationCounter<100) {
   image(shutter,887,279); 
  }
  
  if (anotherEnabled) image(another, width/2,height/2);
  //findMouse() ;
}


void findMouse() {
 println("mouseX= "+mouseX+"  mouseY= "+mouseY); 
 
}

//void keyPressed() {
// if (keyCode== UP) wheel.angle+=0.01;
//  if (keyCode== DOWN) wheel.angle-=0.01; 
//}

void mouseDragged() {
  float d01= dist(mouseX,mouseY,wheel.pos.x,wheel.pos.y);

  if (d01< 168 && d01>30) {
     float a01= atan2((mouseY-wheel.pos.y),(mouseX-wheel.pos.x))-atan2((pmouseY-wheel.pos.y),(pmouseX-wheel.pos.x));
      wheel.angle += a01;
      
        wheel.function(); 
} else if(d01<30) {
   shot =true; 
  }



float d02 = dist(mouseX,mouseY,pushPos.x,pushPos.y);
if (pushPos.x >801) {
  pushPos.x =801;
effectMenuEnabled =false;

}
if (pushPos.x <774) {
  pushPos.x =774;
effectMenuEnabled =true; 
menuScenesEnabled=menuModesEnabled=menuFlashsEnabled=menuSettingsEnabled=false;
}
if(d02 < 20) {
  pushPos.x += mouseX-pmouseX;
  
}


}

void mouseReleased() {
//float d01= dist(mouseX,mouseY,wheel.pos.x,wheel.pos.y);
//  if (d01< 168 && d01>30) {
//
//  } 
  if(menuSettingsEnabled && mouseX>661 && mouseX<731 && mouseY > 173 &&mouseY<height-213) {
    settingEnabled =true;
} else  settingEnabled = false;

  if(mouseX>890 && mouseX<930 && mouseY >20  &&mouseY<60) {
    anotherEnabled =!anotherEnabled;
}
}



class Wheel {

  float angle, targetAngle,v,a;
  PVector pos;
  
  Wheel(PVector _pos) {
  pos =_pos;
  }
  
void function() {
//angle =int(angle/(PI/3))*(PI/3);

float number = angle/(PI/3);
println(number);
if (number>4.5 && number<=5.5) {
effectMenuEnabled =false; 
pushPos.x= 801;

menuScenesEnabled=true;
menuModesEnabled=false;
menuFlashsEnabled=false;
menuSettingsEnabled=false;
} else if ((number>=0 && number<=0.5)||(number>5.5 && number<=6.0)) {
effectMenuEnabled =false; 
pushPos.x= 801;

menuScenesEnabled=false;
menuModesEnabled=true;
menuFlashsEnabled=false;
menuSettingsEnabled=false;

} else if (number>0.5 && number<=1.5) {
effectMenuEnabled =false; 
pushPos.x= 801;

menuScenesEnabled=false;
menuModesEnabled=false;
menuFlashsEnabled=true;
menuSettingsEnabled=false;
} else if (number>1.5 && number<=2.5) {
effectMenuEnabled =false; 
pushPos.x= 801;

menuScenesEnabled=false;
menuModesEnabled=false;
menuFlashsEnabled=false;
menuSettingsEnabled=true; 
} else {
  menuScenesEnabled=false;
menuModesEnabled=false;
menuFlashsEnabled=false;
menuSettingsEnabled=false; 
  
}
if (!menuSettingsEnabled) settingEnabled = false;
//    targetAngle = int(angle/(PI/3))*(PI/3);
//   a = (targetAngle-angle)/10;
//   v +=a;


//println("targetAngle= "+ targetAngle+" angle= "+angle +" v= "+v +" a= "+a);
  }
  void display() {
angle+=TWO_PI;
angle%=TWO_PI;
//   v*=0.9;
//  angle +=v;
  
   pushMatrix();
  translate(pos.x,pos.y);
  image(wheelBG,0,0);
  rotate(angle);
  image(wheelFG,0,0);
  popMatrix(); 
   image(arrowPointer,pos.x,pos.y);
   //image(highLight,pos.x,pos.y);
  }
  
}

void shotAnimation() {
  shotAnimationCounter+=20;
  effectMenuEnabled =false; 

  
pushPos.x= 801;
  settingEnabled = false;
  
menuScenesEnabled=false;
menuModesEnabled=false;
menuFlashsEnabled=false;
menuSettingsEnabled=false;

  fill(0);
  if(shotAnimationCounter< height/2) {
  rect(0,0,width,shotAnimationCounter);
  rect(0,height,width,-shotAnimationCounter);
  } else if(shotAnimationCounter< height){
      rect(0,0,width,height-shotAnimationCounter);
  rect(0,height,width,shotAnimationCounter-height);
  } else if (shotAnimationCounter>= height) {
    shotAnimationCounter=0;
    shot =false;
  }
}

