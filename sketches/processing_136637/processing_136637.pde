
boolean flipFlop = false;
String keyPrompt = "press any key";
float eyeDiam[] = {10,40};
float hello = random(eyeDiam[0],eyeDiam[1]);
float [] red = {255,125,30};
float[]grn = {17,152,15};
float [] blu = {255,0,175};


int faceColorR;
int faceColorG;
int faceColorB;





void setup (){
size(300,300);
frameRate(15);
background(200,6,6);
translate(150,150);
textSize(12);
text(keyPrompt,-145,-135);


  if (flipFlop == true){
     faceColorR = 10;
     faceColorG = 10;
     faceColorB = 20;
  }

//ear
fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
noStroke();
ellipse(65,-65,50,50);
ellipse(-65,-65,50,50);

//head
   fill(faceColorR,faceColorG,faceColorB);
ellipse(0,0,150,150);





//eyes and nose color
 fill(red[(int)random(3)],grn[(int)random(3)],blu[(int)random(3)]);
  ellipse(-40,-15,hello,30);
ellipse(40,-15,hello,30);


//nose
ellipse(0,2,10,10);
}

