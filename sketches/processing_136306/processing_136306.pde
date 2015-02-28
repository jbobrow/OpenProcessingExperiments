
import rita.*;
String WuyanGrammar = 
"{\"<start>\": \"<line1> % <line2> % <line3> % <line4>\","
+ "\"<line1>\": \"<pp1> <zz1> <p1>\","
+ "\"<line2>\": \"<zz2> <zp2> <p2>\","
+ "\"<line3>\": \"<zz3> <pp3> <z3>|<zz3> <p3><pz3>\","
+ "\"<line4>\": \"<pp4> <zz4> <p4>｜<pp4> <z4><zp4>\","

+ "\"<pp1>\": \"空山#empty mountain#|春山#mountain#|深林#forest#\","
+ "\"<zz1>\": \"夜静#silent night#|日暮#sunset#\","
+ "\"<p1>\": \" 清#clear|佳#good\","

+ "\"<zz2>\": \"返影#shadow#|流水#flowing water#\","
+ "\"<zp2>\": \"月出#moon comes out#|墨竹#bamboo#|夏荷#lotus#\","
+ "\"<p2>\": \"倾#lean|花#flower\","

+ "\"<zz3>\": \"老树#old tree#|古道#old street#\","
+ "\"<pp3>\": \"清泉#spring water#|枯藤#dried wine#|松间#pines#\","
+ "\"<z3>\": \"上#up|后#back|塔#tower\","

+ "\"<p3>\": \"惊#blossom#|还#come back#\","
+ "\"<pz3>\": \"春涧#gully|山鸟#mountain birds|新雨#rain|石上#above the stone|红叶#red leaves|烟渚#foggy islet|飞鸟#flying birds\","

+ "\"<pp4>\": \"青苔#moss#|白石#stone#|渔舟#boat#\","
+ "\"<z4>\": \"落#drop#|遍#spread#\","
+ "\"<zp4>\": \"桂花#osmanthus fragrans|小桥#little bridge\","

+ "\"<zz4>\": \"夜静#silent night#|返影#shadow#|日暮#sunset#|老树#old tree#|流水#flowing water#|古道#old street#\","
+ "\"<p4>\": \"惊#blossom|清#clear\"}";

RiGrammar grammar;
RiText[] rts = new RiText[4];//lines directly from grammar
RiText[] s = new RiText[4];//only chinese characters from each line
RiText[] chara1= new RiText[5];
RiText[] chara2= new RiText[5];
RiText[] chara3= new RiText[5];
RiText[] chara4= new RiText[5];

PImage[] images=new PImage[12];
int[] opacity=new int[images.length];
int counter=1;
PImage op1, op2;
int open=0;
int x=1080;//the Xpos of op

/* @pjs preload="mountain.png,bird.png,bamboo.png,boat.png,moutain_far.png,sunset.png,pine.png,tower.png,waterfall.png,forest.png"; */
/* @pjs font="STXINGKA.ttf"; */

void setup()
{
  size(1200, 600);
  frameRate(60);
  RiText.defaultFont("STXingkai-SC-Bold", 30);
  RiText.defaults.alignment = CENTER;
  RiText.defaultFill(50);
  //opening
  rts[0] = new RiText(this, "Shanshui", width / 2, 225);
  rts[1] = new RiText(this, "Poetry", width / 2, 260);
  rts[2] = new RiText(this, "山水诗 ", width / 2, 295);
  rts[3] = new RiText(this, "Click", width / 2, height/2+70);
  op1=op2=loadImage("open.png");

  //poetry
  for (int i = 0; i <4; i++) {
    s[i]=new RiText(this, " ", 0, 0);
  }
  for (int i = 0; i <5; i++) {
    chara1[i] = new RiText(this, " ", 0, 0);
    chara2[i] = new RiText(this, " ", 0, 0);
    chara3[i] = new RiText(this, " ", 0, 0);
    chara4[i] = new RiText(this, " ", 0, 0);
  }
  grammar = new RiGrammar(WuyanGrammar);

  //painting
  images[0]= loadImage("mountain.png");
  images[1]= loadImage("bird.png");
  images[2]= loadImage("bamboo.png");
  images[3]= loadImage("boat.png");
  images[4]= loadImage("moutain_far.png");
  images[5]= loadImage("sunset.png");
  images[6]= loadImage("lotus.png");
  images[7]= loadImage("moon.png");
  images[8]= loadImage("pine.png");
  images[9]= loadImage("tower.png");
  images[10]= loadImage("waterfall.png");
  images[11]= loadImage("forest.png");
}

void draw()
{

  background(255); 

  //painting
  pushMatrix();
  translate(59, 60);
  //near mountain
  tint(255, opacity[0]);
  image(images[0], 300, height-324);
  //far mountain
  tint(255, opacity[4]);
  image(images[4], 0, 0);
  //forest
  tint(255, opacity[11]);
  image(images[11], 100, 0);
  //pine
  tint(255, opacity[8]);
  image(images[8], width-380, height-420);
  //waterfall
  tint(255, opacity[10]);
  image(images[10], width/2-100, 70);
  //tower
  tint(255, opacity[9]);
  image(images[9], width/2-210, 10);
  //bamboo
  tint(255, opacity[2]);
  image(images[2], 0, height-560);
  //lotus
  tint(255, opacity[6]);
  image(images[6], 0, height-450);
  //boat
  tint(255, opacity[3]);
  image(images[3], width/2-100, height-300);
  //bird
  tint(255, opacity[1]);
  image(images[1], 300, height/2-130);
  //sunset
  tint(255, opacity[5]);
  image(images[5], 100, 0);
  //moon
  tint(255, opacity[7]);
  image(images[7], 150, 0);
  popMatrix();

  //poetry
  for (int i = 0; i < 5; i++) {
    chara1[i].draw();
    chara2[i].draw();
    chara3[i].draw();
    chara4[i].draw();
  }

  //canvas
  stroke(50);
  line(58, 60, width-55, 60);
  line(58, height-100, width-55, height-100);

  //folding effect
  fill(255);
  noStroke();
  rect(0, 0, x+60, height);
  tint(255, 255);
  image(op1, width-80, -3);
  image(op2, x, -3);
  print(x);
  if (open==1 && x>0 &&millis()%1==0 )
  {
    x=x-10;
  }
  //opening
  for (int k = 0; k < rts.length; k++)
  {
    rts[k].draw();
    if (open==1)
      rts[k].fadeOut(1, 1);
  }
}

void mouseClicked()
{

  //opening
  if (counter==1)
  {
    counter++;
    open=1;
    print("yes");
  }

  //generate poetry
  String result = grammar.expand();
  println(result);
  String[] lines = result.split("%");
  String[][] parts = {
    lines[0].split("#"), lines[1].split("#"), lines[2].split("#"), lines[3].split("#")
    };
    for (int j=0;j<4;j++) {
      String sentence="";
      for (int i=0;i<3;i++)
      {
        sentence=sentence+parts[j][i*2];//024...chinese
      }
      s[j].text(sentence);
    }
  for (int j=0;j<4;j++) {
    println(lines[j]);
    for (int i=0;i<6;i++)
    {
      println(j+","+i+") "+parts[j][i]);
    }
  }

  //split each lines into single characters
  chara1=s[0].splitLetters();
  chara2=s[1].splitLetters();
  chara3=s[2].splitLetters();
  chara4=s[3].splitLetters();



  //Painting
  for (int i=0;i<images.length;i++) {
    opacity[i]=0;
  }

  //IMG display
  for (int j=0;j<4;j++) {
    for (int i=1;i<6;i+=2)//135..english
    {
      if (parts[j][i].equals("mountain")) 
        opacity[0]=255;
      if (parts[j][i].equals("mountain birds ")||parts[j][i].equals("flying birds ") )
        opacity[1]=255;
      if (parts[j][i].equals("bamboo")) 
        opacity[2]=255;
      if (parts[j][i].equals("boat")) 
        opacity[3]=255;
      if (parts[j][i].equals("empty mountain")) 
        opacity[4]=255;
      if (parts[j][i].equals("sunset")) 
        opacity[5]=255;
      if (parts[j][i].equals("lotus")) 
        opacity[6]=255;
      if (parts[j][i].equals("moon")) 
        opacity[7]=255;
      if (parts[j][i].equals("pines")) 
        opacity[8]=255;
      if (parts[j][i].equals("tower ")) 
        opacity[9]=255;
      if (parts[j][i].equals("flowing water")) 
        opacity[10]=255;
      if (parts[j][i].equals("forest")) 
        opacity[11]=255;
    }
  }
  /*
  for(int i=0;i<images.length;i++)
   {
   opacity[i]=255;
   }  */
  //poetry display vertically
  for (int i = 0; i <5; i++)
  { 
    chara1[i].x=width-100;
    chara2[i].x=width-150;
    chara3[i].x=width-200;
    chara4[i].x=width-250;
    chara1[i].y=30*i+120;
    chara2[i].y=30*i+140;
    chara3[i].y=30*i+120;
    chara4[i].y=30*i+140;
  }
}



