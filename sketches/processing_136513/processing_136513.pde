
//The Sketch tells about the 4 major indian festivals.
//The user has to press the corresponding key written against the number to view more about the festival
//The 0 key is used to go to the homescreen
//The sketch has incorporated music- numb(piano)


//import minim library.
//declaring Global variables.
import ddf.minim.*;
Minim minim;
AudioPlayer numb;
float x,y,x1;
PImage i1,i2,i3,i4,i5;
int state=0;

// setup codeblock
void setup()
{
  minim =new Minim(this);
  numb=minim.loadFile("numb.mp3");             //loading the soundfile
  numb.play();                                 //playing the sound
  size(1200,720);
  i1=loadImage("download1.jpg");               //loading image   
  i2=loadImage("download 2.jpg");              //loading image 
  i3=loadImage("download3.jpg");               //loading image
  i4=loadImage("download 4.jpg");              //loading image
  i5=loadImage("download5.jpg");               //loading image
}

 //draw codeblock
void draw()
{
if(state==0)
{                   // initial state of the program
 background(0);
 int i,j=50;
 x+=6;
 y+=10;
 stroke(#F53B3B);
 strokeWeight(3);
 for(i=0;i<3;i++){
 line(j,0,j,x);
 line(0,j,y,j);
 x = constrain (x ,0 , height );
 y = constrain (y ,0 , width );
 j=j+25;
 image(i1,0,0,50,50);
}
 textSize(50);
 textAlign(CENTER);
 fill(#4F9BB2);
 String s1="The Indian festivals";
 String s2="1. Makar sankranti";
 String s3="2. Holi";
 String s4="3. Rakshabandhan";
 String s5="4. Diwali";
 text(s1,600,200);
 textSize(30);
 fill(#8FE8B7);
 text(s2,600,300);
 text(s3,600,400);
 text(s4,600,500);
 text(s5,600,600);
 textSize(20);
 textAlign(RIGHT);
 text("press the key before the festival name to proceed and 0 to home",1120,690);
 }
if(state==1)                   // state 1 of the sketch
{
  fill(0);
  rect(-2,0,width+4,height+2);
  image(i2,0,0,width,200);
  fill(#64FF12);
  textAlign(CENTER);
  textSize(75);
  text("Makar Sankranti",width/2,70);
  fill(#86BFFA);
  textSize(25);
  textAlign(LEFT);
  String str="Makar Sankranti marks the transition of the Sun into the zodiac sign of Makara rashi (Capricorn) on its celestial path. The day is also believed to mark the arrival of spring in India.\nIt is a harvest festival celebrated with vigour and joy all over the country with varied customs in various parts.\nThe main feature of many celebrations is Kite flying in which people get to their roofs from the morning and start flying kites till late evening followed by grand fireworks.Boys and Men of all ages along with women try to cut each others string during kite flying and rejoicing with friends and family while doing so.\nOn this day a variety of delicacies are cooked in homes and women in many places invite others for a meal.\nMakar sankranti is celebrated in other countries too but with a different name.";
  text(str,10,210,width,height);
}
if(state==2)                  //state 2 of the sketch
{
  fill(#174B81);
  rect(-2,0,width+2,height+2);
  image(i3,0,0,width,200);
  fill(#F5C77E);
  textAlign(CENTER);
  textSize(75);
  text("Holi",width/2,70);
  fill(#E869A5);
  textSize(25);
  textAlign(LEFT);
  String str="Holi  is a spring festival also known as festival of colours, and sometimes festival of love.It is an ancient Hindu religious festival which has become popular with non-Hindus.\nHoli celebrations start with a Holika bonfire on the night before Holi where people gather, sing and dance. The next morning is free for all carnival of colours, where everyone plays, chases and colours each other with dry powder and coloured water, with some carrying water guns and coloured water-filled balloons for their water fight. Anyone and everyone is fair game, friend or stranger, rich or poor, man or woman, children and elders. The frolic and fight with colours occurs in the open streets, open parks, outside temples and buildings. Groups carry drums and musical instruments, go from place to place, sing and dance. People move and visit family, friends and foes, first play with colours on each other, laugh and chit-chat, then share Holi delicacies, food and drinks. In the evening, after sobering up, people dress up, visit friends and family.\nThe festival signifies the victory of good over evil, the arrival of spring, end of winter, and for many a festive day to meet others, play and laugh, forget and forgive, and repair relations.";
  text(str,10,210,width,height);
}
if(state==3)                  //state 3 of the sketch
{
  fill(#C65A32);
  rect(-2,0,width+2,height+2);
  image(i4,0,0,width,200);
  fill(0);
  textAlign(CENTER);
  textSize(75);
  text("Rakshabandhan",width/2,70);
  fill(#00E8A8);
  textSize(25);
  textAlign(LEFT);
  String str="Raksha Bandhan is a Hindu festival that celebrates the love and duty between brothers and sisters; the festival is also popularly used to celebrate any brother-sister like loving protective relationship between men and women who are relatives or biologically unrelated.\n On Raksha Bandhan, sisters tie a rakhi (sacred thread) on her brother's wrist. This symbolizes the sister's love and prayers for her brother's well-being, and the brother's lifelong vow to protect her.\nThe sister then feeds the brother, with her hands, one or more bites of sweets (desserts), dry fruits and other seasonal delicacies. The brother gives his sister(s) gifts such as cards, clothes, money or something thoughtful. The brother may also feed his sister, with his hands, one or more bites of sweets, dry fruits and other seasonal delicacies. They hug, and the larger family ritually congratulate the festive celebration of brother-sister love and protection.The brother(s) wear the Rakhi for the entire day, at school or work, as a reminder of their sister(s) and to mark the festival of Raksha Bandhan.";
  text(str,10,210,width,height);
}
if(state==4)                //state 4 of the sketch
{ 
  fill(0);
  rect(-2,0,width+2,height+2);
  image(i5,0,0,width,200);
  fill(#FF9100);
  textAlign(CENTER);
  textSize(75);
  text("Diwali",width/2,70);
  fill(#FAEF86);
  textSize(25);
  textAlign(LEFT);
  String str="Diwali also called the (festival of lights), is an ancient Hindu festival celebrated in autumn every year.The festival spiritually signifies the victory of light over darkness, knowledge over ignorance, good over evil, and hope over despair.\nBefore Diwali night, people clean, renovate and decorate their homes.On Diwali night, Hindus dress up in new clothes or their best outfit, light up diyas (lamps and candles) inside and outside their home, participate in family puja typically to Lakshmi - the goddess of wealth and prosperity. After puja (prayers), fireworks follow,then a family feast including sweets, and an exchange of gifts between family members and close friends. Diwali also marks a major shopping period in nations where it is celebrated.\nThe religious signiicance of the festival varies from religion to religion but that does not lessen the joy, happiness, vigour and cheer in the atmosphere surrounding the days before and after diwali.";
  text(str,10,210,width,height);
}
 }
void keyReleased(){         //keyboard input to switch between different states of the sketch
switch(key)
{ 
  case '0':
  state=0;
  break;
  case '1':
  state=1;
  break;
  case '2':
  state=2;
  break;
  case '3':
  state=3;
  break;
  case '4':
  state=4;
  break;
}
  }


