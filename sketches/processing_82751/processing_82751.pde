
//import controlP5.*;
//ControlP5 cp5;

int year = 1;

XML xml;
PImage img;

Handle[] handles;
int totalEntries;

//RadioButton r;

void setup() {
  img = loadImage("map.jpg");
  size(960, 426);
  
  int rectx11 = width/2 ;
  int recty11 = height - 50 ;
  int rectx12 = 50 ;
  int recty12 = 20 ;
//  int rectx13 = 150 ;
//  int recty13 = 150 ;
//  int rectx14 = 200 ;
//  int recty14 = 200 ;
  
  int rectx21 = width/2 + 70;
  int recty21 = height - 50;
  int rectx22 = 50;
  int recty22 = 20;
//  int rectx23 = 170;
//  int recty23 = 170;
//  int rectx24 = 220;
//  int recty24 = 220;
  
  int rectx31 = width/2 + 140;
  int recty31 = height - 50;
  int rectx32 = 50;
  int recty32 = 20;
//  int rectx33 = 190;
//  int recty33 = 190;
//  int rectx34 = 240;
//  int recty34 = 240;
  
  
//   cp5 = new ControlP5(this);
//  r = cp5.addRadioButton("radioButton")
//         .setPosition(width/2,height - 50)
//         .setSize(40,20)
//         .setColorForeground(color(120))
//         .setColorActive(color(255, 0, 0))
//         .setColorLabel(color(255))
//         .setItemsPerRow(5)
//         .setSpacingColumn(50)
//         .addItem("1999",1)
//         .addItem("2004",2)
//         .addItem("2010",3)
//         ;
//     
//     for(Toggle t:r.getItems()) {
//       t.captionLabel().setColorBackground(color(0,80));
//       t.captionLabel().style().moveMargin(-7,0,0,-3);
//       t.captionLabel().style().movePadding(7,0,0,3);
//       t.captionLabel().style().backgroundWidth = 45;
//       t.captionLabel().style().backgroundHeight = 13;
//     }
     
  xml = loadXML("data.xml");  
  
  XML[] children = xml.getChildren("row");
  totalEntries = children.length;
  handles = new Handle[totalEntries];
  
  for (int i = 0; i < totalEntries; i++) {
    String nation = children[i].getString("Name");
    int year1 = children[i].getInt("year1");
    int year2 = children[i].getInt("year2");
    int year3 = children[i].getInt("year3");
    int x = children[i].getInt("x");
    int y = children[i].getInt("y");
  
    println("nation = " + nation);
    println("1999 = " + year1);
    println("2004 = " + year2);
    println("2010 = " + year3);
    println("year = " + year);
    
    handles[i] = new Handle(nation, x, y, year1, year2, year3, 
                            rectx11, recty11, rectx12, recty12, 
                            rectx21, recty21, rectx22, recty22, 
                            rectx31, recty31, rectx32, recty32);
    
    
  
   };
}

void draw(){
  background(255);
  smooth();
  image(img, 0, 0);
  
  for (int i = 0; i < totalEntries; i++){
    handles[i].update();
    handles[i].display(); 
  }
}

//void controlEvent(ControlEvent theEvent) {
//  if(theEvent.isFrom(r)) {
////    print("got an event from "+theEvent.getName()+"\t");
////    for(int i=0;i<theEvent.getGroup().getArrayValue().length;i++) {
////      print(int(theEvent.getGroup().getArrayValue()[i]));
////    }
//    println("\t value: "+theEvent.getValue());
//    year = int(theEvent.group().value());
//    println(year);
//    
//    
//  }
//}

class Handle {
 String country;
 int xp, yp;
 int fy, sy, ty;
 float boxx;
 float boxy;
 float yy;
 int rx11, ry11, rx12, ry12;
 int rx21, ry21, rx22, ry22;
 int rx31, ry31, rx32, ry32;
 
  
  Handle(String nat, int xPos, int yPos, int firstyear, int secondyear, int thirdyear, int rectxTemp11, int rectyTemp11, int rectxTemp12, int rectyTemp12, int rectxTemp21, int rectyTemp21, int rectxTemp22, int rectyTemp22,int rectxTemp31, int rectyTemp31, int rectxTemp32, int rectyTemp32) {
     country = nat;
     xp = xPos;
     yp = yPos;
     fy = firstyear;
     sy = secondyear;
     ty = thirdyear;
     yy = fy;
     rx11 = rectxTemp11;
     ry11 = rectyTemp11;
     rx12 = rectxTemp12;
     ry12 = rectyTemp12;
     
     rx21 = rectxTemp21;
     ry21 = rectyTemp21;
     rx22 = rectxTemp22;
     ry22 = rectyTemp22;
     
     rx31 = rectxTemp31;
     ry31 = rectyTemp31;
     rx32 = rectxTemp32;
     ry32 = rectyTemp32;
     
     
  }
  void update(){
//     yy = fy;

     
  }
  void display(){
//    println(country);
    fill(0);
    text("1999", rx11+7, ry11+35); 
    fill(0);
    rect(rx11, ry11, rx12, ry12);
    
    fill(0);
    text("2004", rx21+7, ry21+35);
    rect(rx21, ry21, rx22, ry22);
    
    fill(0);
    text("2010", rx31+7, ry31+35);
    rect(rx31, ry31, rx32, ry32);
    
    
    fill(0, 0, 0, 81);
    ellipse(xp, yp, 100, 100);
    noStroke();
    
    fill(0);
    text(country, xp, yp);
    
//    if (year == 1){
//      
//      
//    } else if (year == 2){
//      
//    } else if (year == 3){
//      
//    }
    
//    println(yy);
//  }
 if (mouseX >= rx11 && mouseX <= rx11 + rx12 
     && mouseY >= ry11 && mouseY <= ry11 + ry12){
      fill(0, 102, 153, 31);
      ellipse(xp, yp, yy, yy);
      fill(0);
      noStroke();
      
      text(fy + "%", xp, yp+15);
     }else if (mouseX >= rx21 && mouseX <= rx21 + rx22 
     && mouseY >= ry21 && mouseY <= ry21 + ry22){
      fill(102, 0, 153, 31);
      ellipse(xp, yp, sy, sy);
      fill(255, 255, 255, 31);
      ellipse(xp, yp, 100, 100);
      fill(0);
      noStroke();
      text(sy + "%", xp, yp+15);
      
     } else if (mouseX >= rx31 && mouseX <= rx31 + rx32 
     && mouseY >= ry31 && mouseY <= ry31 + ry32){
      fill(153, 102, 0, 31);
      ellipse(xp, yp, ty, ty);
      fill(255, 255, 255, 31);
      ellipse(xp, yp, 100, 100);
      fill(0);
      noStroke();
      
      text(ty + "%", xp, yp+15);
     }

  }
}



