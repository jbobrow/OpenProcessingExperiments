
import controlP5.*;
ControlP5 cp5;
boolean RedTurnOver =true;
boolean GreenTurnOver =true;
boolean BlueTurnOver = true;
Knob myKnobA;
void setup(){
  size(800, 600);
  
   smooth();
 ControlFont cf1 = new ControlFont(createFont("Arial",10));
  cp5 = new ControlP5(this);

     
       Group g1 = cp5.addGroup("Info")
                .setPosition(0,10)
                 .setWidth(300)
                .setBackgroundColor(color(0, 64))
                .setBackgroundHeight(250)
                 .setBarHeight(10)
                ;
     
     myKnobA = cp5.addKnob("ToneNumber")
               .setRange(1,85)
               .setValue(1)
               .setPosition(20,20)
               .setRadius(50)
               .setDragDirection(Knob.HORIZONTAL)
               .moveTo(g1)
               ;
    
    
      cp5.addSlider("size")
     .setPosition(140,50)
     .setSize(120,20)
     .setRange(0.1,4)
     .setValue(2.3)
     .moveTo(g1)
        .captionLabel().setControlFont(cf1);
     ;
    
    cp5.addToggle("RedTurnOver")
    .setPosition(10, 150)
     .setSize(40, 40)
     .moveTo(g1)
        .captionLabel().setControlFont(cf1);
     ;
        cp5.addToggle("GreenTurnOver")
    .setPosition(110, 150)
     .setSize(40, 40)
      .moveTo(g1)
         .captionLabel().setControlFont(cf1);
     ;
        cp5.addToggle("BlueTurnOver")
    .setPosition(210, 150)
     .setSize(40, 40)
      .moveTo(g1)
         .captionLabel().setControlFont(cf1);
     ;
   
 
  
    
     
}




void draw() {

 float tonenumber = cp5.getController("ToneNumber").getValue();
   float size = cp5.getController("size").getValue();
  int i = 1;
 if(RedTurnOver == false && GreenTurnOver == false && BlueTurnOver == false){
  background(255);
}
else   background(0);

//do while文でループさせている。
  do{
    ++i;
  float Redtone = i*tonenumber;
  float Greentone = i*tonenumber;
  float Bluetone = i*tonenumber;
 // rectinfoは四角形のサイズ及び間隔を表している。
  float rectinfo = 255-i*tonenumber;
 if(RedTurnOver == false){Redtone = 255-(i*tonenumber);}
 if(GreenTurnOver == false){Greentone = 255-(i*tonenumber);}
 if(BlueTurnOver == false){Bluetone = 255-(i*tonenumber);}
  fill(Redtone,Greentone,Bluetone);   
  noStroke();
  rectMode(CENTER);
  //色の値が255を超えたものから表示させない様にしている。rectinfo>=-1を超えると、大きな四角形が画面上に出てきてしまう。
 if(rectinfo>=-1) {
  rect(width/2, height/2,rectinfo*size,rectinfo*size);
}
}while(i!=255);
}



