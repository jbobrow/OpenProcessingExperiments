
// Sangalian Jato [ksjato@gmail.com]

PImage bg,fruit,animal,game;        //image of the buttons (visible)
PImage fruitcolmap,animalcolmap,gamecolmap;  //colormap of the buttons (hidden)
PImage anipic,frupic,aboutpic,howpic,campic,elpic,shepic,copic,kipic,stpic;
PImage campic2,elpic2,shepic2,copic2,kipic2,stpic2;
String[] fruitstring={"apple","banana","starfruit","orange","pear","pineapple",
                        "papaya","grape","watermelon","kiwi","coconut","lychee","",
                      " ","how","about","FRUITS","ANIMALS","Game"};
color[] fruitcolor={0xFF0000FF,0xFF00FFFF,0xFF00FF00,0xFFFFFF00,0xffff0000,0xffffdd55,
                    0xffff00ff,0xff5500d4,0xFFFF6600,0xffff80e5,0xff28170b,0xff66ff00, 0xFFFFFFFF,
                    0xff002b00,0xff17280b,0xff002b11,0xff4d4d4d,0xff666666,0xff808080};
String[] animalstring={"duck","bird","frog","horse","sheep","panda",
                        "dog","cat","snake","elephant","pig","camel","",
                      " ","how","about","FRUITS","ANIMALS","Game"};
color[] animalcolor={0xFF0000FF,0xFF00FFFF,0xFF00FF00,0xFFFFFF00,0xffff0000,0xffffdd55,
                    0xffff00ff,0xff5500d4,0xFFFF6600,0xffff80e5,0xff28170b,0xff66ff00, 0xFFFFFFFF,
                    0xff002b00,0xff17280b,0xff002b11,0xff4d4d4d,0xff666666,0xff808080};
String cute1;
String cute2;
String textfield="";
PFont font;
boolean one=false; boolean two=false; boolean three=false;
boolean four=false; boolean five=false; boolean six=false;
boolean seven=false; boolean eight=false; boolean nine=false;
boolean ten=false; boolean eleven=false; boolean twelve=false;
boolean playa=false; //play animal
boolean playf=false; //play fruits
boolean playg=false; //play game
boolean startpage=true;
boolean ani=false;
boolean fru=false;
boolean about=false;
boolean how=false;

void setup ()
  {
    size(800,600,JAVA2D);
    smooth();
    textAlign(CENTER);
    font=loadFont("CourierNewPS-BoldMT-48.vlw");
    textFont(font);
    bg=loadImage("Backgroundcopy.png");
    fruit=loadImage("test.png");
    fruitcolmap=loadImage("test.png");    
    animal=loadImage("test.png");
    animalcolmap=loadImage("test.png");
    game=loadImage("test.png");
    gamecolmap=loadImage("test.png");
    frupic=loadImage("fruitpic.png");
    anipic=loadImage("anipic1.png");
    aboutpic=loadImage("aboutmecopy.png");
    howpic=loadImage("howtoplaycopy.png");
    campic=loadImage("camel1.jpg");campic2=loadImage("camel2.png");
    elpic=loadImage("elephant1.jpg");elpic2=loadImage("elephant2.png");
    shepic=loadImage("sheep1.jpg");shepic2=loadImage("sheep2.png");
    copic=loadImage("coconut1.jpg");copic2=loadImage("coconut2.png");
    kipic=loadImage("kiwi1.jpg");kipic2=loadImage("kiwi2.png");
    stpic=loadImage("starfruit1.jpg");stpic2=loadImage("starfruit2.png");
  }
  
void draw()
  {
  background(bg);
  fill(0xff241c1c);
  text(textfield,400,205);
  if(startpage==true)
  {
   fill(0xff241c1c);
   rect(0,0,width,height);
   fill(0xffffd5d5);
   String s="PRESS SPACEBAR TO START";
   text(s,width/2,height/2);
  }
  if(one==true){image(campic,143,308,76,66); }
  if(two==true){image(stpic2,224,308,76,66); }
  if(three==true){image(shepic,305,308,76,66);}
  if(four==true){image(kipic2,386,308,77,66);}  
  if(five==true){image(elpic,468,308,76,66);}
  if(six==true){image(copic2,549,308,76,66);}
  if(seven==true){image(shepic2,141,381,76,66); }
  if(eight==true){image(copic,223,381,76,66); }
  if(nine==true){image(elpic2,305,381,76,66);}
  if(ten==true){image(stpic,386,381,76,66);}  
  if(eleven==true){image(campic2,468,381,76,66);}
  if(twelve==true){image(kipic,549,381,76,66);}
  if(ani==true){
    image(anipic,140,height/2,490,160);}
  if(fru==true){
    image(frupic,140,height/2,490,160);}
  if(about==true){
     image(aboutpic,140,140,520,380);
     fill(0xff241c1c);
     String s="About Me";
     text(s,width/2+5,185);}
  if(how==true){
      image(howpic,140,140,520,380);
     fill(0xff241c1c);
     String s="How to Play";
     text(s,width/2+5,185);}
}
  
void mousePressed()
 {
   if(playf==true)
    {
      if(mouseButton==LEFT)
      {
      color testcolor=0;
      testcolor=fruitcolmap.get(mouseX,mouseY);
      for(int i=0;i<fruitstring.length;++i)
        {
          if(testcolor==fruitcolor[i])
          textfield=fruitstring[i];
        }
       // if(textfield=="exit")
        //{exit();}
        if(textfield=="about")
        {about=true;how=false;}
        if(textfield=="how")
        {how=true;about=false;}
        if(textfield=="FRUITS")
        {about=false;how=false;}
        if(textfield=="ANIMALS")
        {playa=true;ani=true;fru=false;about=false;}
        if(textfield=="Game")
        {playa=false;playf=false;playg=true;ani=false;fru=false;about=false;how=false;
      one=true;two=true;three=true;four=true;five=true;six=true;
      seven=true;eight=true;nine=true;ten=true;eleven=true;twelve=true;}
      }
    }
    
   if(playa==true)
    {
      if(mouseButton==LEFT)
      {
       color testcolor=0;
      testcolor=animalcolmap.get(mouseX,mouseY);
      for(int i=0;i<animalstring.length;++i)
        {
          if(testcolor==animalcolor[i])
          textfield=animalstring[i];
        }
       // if(textfield=="exit")
        //{exit();}
        if(textfield=="about")
        {about=true;how=false;}
        if(textfield=="how")
        {how=true;about=false;}
        if(textfield=="ANIMALS")
        {about=false;how=false;}
        if(textfield=="FRUITS")
        {playa=false;playf=true;ani=false;fru=true;about=false;how=false;}
        if(textfield=="Game")
        {ani=false;fru=false;about=false;how=false;playa=false;playf=false;playg=true;
      one=true;two=true;three=true;four=true;five=true;six=true;
      seven=true;eight=true;nine=true;ten=true;eleven=true;twelve=true;}
      }
    }
    
   if(playg==true)
    {
    color testcolor=0;
    int i;
    if(mouseButton==LEFT)
    {textfield="";
      testcolor=gamecolmap.get(mouseX,mouseY);
      for(i=0;i<animalstring.length;++i) 
      {
      if(testcolor==animalcolor[i])
         cute1=animalstring[i];
     }
     //if(cute1=="exit")
        //{exit();}
     if(cute1=="FRUITS")
        {textfield="FRUITS";
          playa=false;playf=true;playg=false;ani=false;fru=true;about=false;how=false;
         one=false;two=false;three=false;four=false;five=false;six=false;
         seven=false;eight=false;nine=false;ten=false;eleven=false;twelve=false;}
      if(cute1=="ANIMALS")
        {textfield="ANIMALS";
        playa=true;playf=false;playg=false;ani=true;fru=false;about=false;how=false;
         one=false;two=false;three=false;four=false;five=false;six=false;
         seven=false;eight=false;nine=false;ten=false;eleven=false;twelve=false;}
      if(cute1=="about")
        {about=true;how=false;}
      if(cute1=="how")
        {how=true;about=false;}
      if(cute1=="Game")
        {ani=false;fru=false;about=false;how=false;playa=false;playf=false;playg=true;
      one=true;two=true;three=true;four=true;five=true;six=true;
      seven=true;eight=true;nine=true;ten=true;eleven=true;twelve=true;}
   }
       
    if(mouseButton==RIGHT)
   {textfield="";
    testcolor=gamecolmap.get(mouseX,mouseY);
     for(i=0;i<animalstring.length;++i) 
    {
      if(testcolor==animalcolor[i])
         cute2=animalstring[i];
     }}
     if(cute1=="duck" && cute2=="pig" || cute1=="pig" && cute2=="duck")
     {one=false;eleven=false;textfield="Good!";}
     if(cute1=="dog" && cute2=="frog" || cute1=="frog" && cute2=="dog")
     {three=false;seven=false;textfield="Nice!";}
     if(cute1=="sheep" && cute2=="snake" || cute1=="snake" && cute2=="sheep")
     {five=false;nine=false;textfield="Great!";}
     if(cute1=="cat" && cute2=="panda" || cute1=="panda" && cute2=="cat")
     {eight=false;six=false;textfield="Good!";}
     if(cute1=="elephant" && cute2=="bird" || cute1=="bird" && cute2=="elephant")
     {ten=false;two=false;textfield="Bravo!";}
     if(cute1=="camel" && cute2=="horse" || cute1=="horse" && cute2=="camel")
     {twelve=false;four=false;textfield="Brilliant!";}
     if(one==false && two==false && three==false && four==false && five==false && six==false &&
     seven==false && eight==false && nine==false && ten==false && eleven==false && twelve==false &&
     playa==false && playf==false)
     {
       textfield="PERFECT! Thanks for playing ^_^";
     }
    redraw();
  }  
 }
  
 void keyPressed()
  {
    if(key==' ')
    {
      startpage=false;
      playf=true;
      how=true;
      fru=true;
      textfield="FRUITS";
    }
  }


