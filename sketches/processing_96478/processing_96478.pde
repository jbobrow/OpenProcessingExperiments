
//final project
color [] palette = {#544334,#9e784a,#621110,#6d6d60,#FFFFFF};
//Lable arrays////////////////////////////////////////////////////////
String [] P2Lables={"Barbed Wire","Hammer","IcePick","Knife","Machete", "Spear","Unknown"};
String [] P3Lables={"Cleaver","Electrocuted","Fireplace Poker","Hand","Knife","Knitting Needle","Machete","Pitchfork","Spear"};
String [] P4Lables={"Axe","Cleaver","Garden Harrow","Hacksaw","Hand","Knife","Machete","Scalpel","Spear","Unknown"};
String [] P5Lables={"Machete"};
String [] P6Lables={"Bottle","Dart","Hand","Knife","Machete","Spear","Tree Branch","Unknown"};
String [] P7Lables={"Axe","Hand","Knife","Machete","Party Horn","Scythe","Spear","Tent Spike","Tree Trimming Saw"};
String [] P8Lables={"Axe","Deck Post","Electrocuted","Guitar","Hand","Harpoon","Machete","Mirror","Pipe","Sana Rock","Spear","Syringe","Unknown","Wrench"};
String [] P9Lables={"Autopsy Probe","Barbecue Skewer","Barbed Wire","Car Door","Hand","Knife Sharpener","Pencil","Possesion","Razor"};
String [] P10Lables={"Chain","Claw Hook","Drill","Electrocuted","Gun","Hand","Liquid Nitrogen","Machete","Metal Grate","Noose Pole"};
String [] P11Lables={"Door","Electrocuted","Freddy's Glove","Hand","Machete","Pipe","Shelf Bracket"};
String [] P12Lables={"Arrow","Camp Fire","Deer Antlers","Knife","Machete"};
//Kill Counts/////////////////////////////////////////////////////
int [] P2Kills = {1,1,1,2,2,2,1};
int [] P3Kills = {1,1,1,1,2,1,1,2,1};
int [] P4Kills = {1,1,1,1,2,3,1,1,2,1};
int [] P5Kills = {1};
int [] P6Kills = {1,1,5,1,6,2,1,1};
int [] P7Kills = {2,5,1,1,1,1,1,2,1};
int [] P8Kills = {1,1,1,1,3,1,1,1,1,1,2,1,1,1};
int [] P9Kills = {1,1,1,1,1,9,1,1,4,1};
int [] P10Kills = {2,1,1,1,1,5,1,6,1,2};
int [] P11Kills = {1,1,1,1,12,2,1};
int [] P12Kills = {1,1,1,1,2};

//global v's/////////////////////////////////////////////////////
float x;
float y;

int i;

String lables;
int kills;

int d = 45;

int w;

int kp2 = P2Kills.length;
int kp3 = P3Kills.length;
int kp4 = P4Kills.length;
int kp5 = P5Kills.length;
int kp6 = P6Kills.length;
int kp7 = P7Kills.length;
int kp8 = P8Kills.length;
int kp9 = P9Kills.length;
int kp10 = P10Kills.length;
int kp11 = P11Kills.length;
int kp12 = P12Kills.length;

//set up//////////////////////////////////////////////////////////
void setup(){
  size(800,600);
  smooth();
  background(palette[3]);
  
  
}//end setup

//draw///////////////////////////////////////////////////////////
void draw(){
  strokeCap(SQUARE);
  
  translate(100,550);
  background(palette[3]);
 
 // grind markers//////////
 stroke(palette[4]);
 strokeWeight(3);
 line(0,0,0,-500);
 line(0,0,650,0);
 line(-10,-499,10,-499);
 text("15 ",-25,-499);
 line(-10,-330,10,-330);
 text("10",-25,-330);
 line(-10,-166,10,-166);
 text("5",-25,-166);
 line(-10,0,10,0);
 text("0",-25,0);
 
 //buttons/////////////////
 
 strokeWeight(1);
 stroke(#000000);
 ellipseMode(CENTER);


 fill(palette[1]);
 ellipse(-60,-height/13,d,d);
 ellipse(-60,-height*2/13,d,d);
 ellipse(-60,-height*3/13,d,d);
 ellipse(-60,-height*4/13,d,d);
 ellipse(-60,-height*5/13,d,d);
 ellipse(-60,-height*6/13,d,d);
 ellipse(-60,-height*7/13,d,d);
 ellipse(-60,-height*8/13,d,d);
 ellipse(-60,-height*9/13,d,d);
 ellipse(-60,-height*10/13,d,d);
 ellipse(-60,-height*11/13,d,d);
 
 fill(#000000);
 text("Part II \n    1",-79,-height*11/13);
 text("Part III \n   2",-79,-height*10/13);
 text("Part IV\n    3",-79,-height*9/13);
 text("Part V\n    4",-79,-height*8/13);
 text("Part VI\n    5",-79,-height*7/13);
 text("Part VII\n    6",-79,-height*6/13);
 text("Part VIII\n    7",-79,-height*5/13);
 text("Part IX\n    8",-79,-height*4/13);
 text("Part X\n    9",-79,-height*3/13);
 text("Part XI\n    0",-79,-height*2/13);
 text("Part XII\n    -",-79,-height/13);
 
 //bars//////////////////////////////////////////////////////////
 strokeWeight(10);
 stroke(palette[2]);
 
if(w == 1){
  for(int i = 0; i < kp2; i++){
    x =(i+1)*(650/(kp2 + 1));
    y = P2Kills[i]*-33;
    line(x,0,x,y);
    text("Friady the 13th Part II",width/2-70,-510);
    text(P2Lables[i],x,50);
    text(P2Kills[i],x,y-25);
  }//end for
}//end if
if(w == 2){
  for(int i = 0; i < kp3; i++){
    x =(i+1)*(650/(kp3 + 2));
    y = P3Kills[i]*-33;
    line(x,0,x,y);
      text("Friday the 13th Part III",width/2-70,-510);
    text(P3Lables[i],x,50);
    text(P3Kills[i],x,y-25);
  }//end for
}//end if
if(w == 3){
  for(int i = 0; i < kp4; i++){
    x =(i+1)*(650/(kp4 + 1));
    y = P4Kills[i]*-33;
    line(x,0,x,y);
      text("Friday the 13th Part IV: The Final Friday",width/2-100,-510);
     text(P4Lables[i],x,50);
    text(P4Kills[i],x,y-25);
  }//end for
}//end if
if(w == 4){
  for(int i = 0; i < kp5; i++){
    x =(i+1)*(650/(kp5 + 1));
    y = P5Kills[i]*-33;
    line(x,0,x,y);
    text("Friday the 13th Part V: New Beginnings",width/2-90,-510);
     text(P5Lables[i],x,50);
    text(P5Kills[i],x,y-25);
  }//end for
}//end if
if(w == 5){
  for(int i = 0; i < kp6; i++){
    x =(i+1)*(650/(kp6 + 1));
    y = P6Kills[i]*-33;
    line(x,0,x,y);
    text("Friday the 13th Part VI: Jason Lives",width/2-70,-510);
     text(P6Lables[i],x,50);
    text(P6Kills[i],x,y-25);
  }//end for
}//end if
if(w == 6){
  for(int i = 0; i < kp7; i++){
    x =(i+1)*(650/(kp7 + 1));
    y = P7Kills[i]*-33;
    line(x,0,x,y);
    text("Friday the 13th Part VII: New Blood",width/2-100,-510);
     text(P7Lables[i],x,50);
    text(P7Kills[i],x,y-25);
  }//end for
}//end if
if(w == 7){
  for(int i = 0; i < kp8; i++){
    x =(i+1)*(650/(kp8 + 1));
    y = P8Kills[i]*-33;
    line(x,0,x,y);
    text("Part VIII: Jason Takes Manhattan",width/2-70,-510);
     text(P8Lables[i],x,50);
    text(P8Kills[i],x,y-25);
  }//end for
}//end if
if(w == 8){
  for(int i = 0; i < kp9; i++){
    x =(i+1)*(650/(kp9 + 1));
    y = P9Kills[i]*-33;
    line(x,0,x,y);
    text("Jason Goes To Hell",width/2-70,-510);
     text(P9Lables[i],x,50);
    text(P9Kills[i],x,y-25);
  }//end for
}//end if
if(w == 9){
  for(int i = 0; i < kp10; i++){
    x =(i+1)*(650/(kp10 + 1));
    y = P10Kills[i]*-33;
    line(x,0,x,y);
    text("Jason X",width/2-50,-510);
     text(P10Lables[i],x,50);
    text(P10Kills[i],x,y-25);
  }//end for
}//end if
if(w == 10){
  for(int i = 0; i < kp11; i++){
    x =(i+1)*(650/(kp11 + 1));
    y = P11Kills[i]*-33;
    line(x,0,x,y);
    text("Freddy Vs. Jason",width/2-50,-510);
     text(P11Lables[i],x,50);
    text(P11Kills[i],x,y-25);
  }//end for
}//end if
if(w == 11){
  for(int i = 0; i < kp12; i++){
    x =(i+1)*(650/(kp12 + 1));
    y = P12Kills[i]*-33;
    line(x,0,x,y);
    text("Friday the 13th (Remake)",width/2-70,-510);
     text(P12Lables[i],x,50);
    text(P12Kills[i],x,y-25);
  }//end for
}//end if
//end bars//////////////////////////////////////////////////////// 

 
 
 //average line//////////////
 stroke(palette[4]);
 strokeWeight(2);
 line(0,-height/2-50,650,-height/2-50);
 fill(palette[4]);
 text("Average Total Deaths per Movie", 650/2,-height/2-55);
 

  
}//end draw
void keyPressed(){
if(key=='1') w =1;
if(key == '2') w = 2;
if(key == '3') w = 3;
if(key == '4') w = 4;
if(key == '5') w = 5;
if(key == '6') w = 6;
if(key == '7') w = 7;
if(key == '8') w = 8;
if(key == '9') w = 9;
if(key == '0') w = 10;
if(key == '-') w = 11;
if(key == ' ') w = 0;

}
