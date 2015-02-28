
int generate_update;
float move=0;
float speed;
int get_update;
int val;
String[] questions = {
  "What is your favorite color?",
  "Would you have sex on the first date?",
   "When is your favorite time?",
   "How important is god in your life?"
};

// a 2D array
String[][] choices = {
  { "Green", "*R*A*I*N*B*O*W*", "blue", "Rather not say"},
  { "....yes?", "yes", "YES", "No. Wait, yes."},
   { "#2", "Midnight", "Never", "Hammer" },
   {"A little", "A lot", "Neutral", "There is no spoon"} 
};

String[] question3 = {"Hmm, interesting, what will you say next?", "Oh, really? I wasn't expecting that, but keep going", "I knew you'd say that! Anyways, keep going", "Awkward.. how will I factor that in?","#lol You're answers are terrible.", "#GoingToBeBestTHeResultsEver", "#ShitSonReally #keepAnswering", "#BeyoncesBackBitches So am I, let's keep going", "Please wait, I didn't compute this potential..", "Have you considered your the ramifications of your actions?", "Wait. No, nvm. Keep Answering.", "What am I going to do with you.. :sigh: keep answering please..", "I'm writing this all down, keep going, I'll catch up.", "We can't all be winners I guess. Oh well keep answering and I'll see what I can do.", "Got it! Keep going champ!", "You attract the ladies and the fellows don't you, you sly thing." , "Snow peas are similar to a snow lion in only one way"} ;

// a 2D array
String[][] responseImages = {
  { "1.jpg", "2.jpg", "3.jpg", "4.jpg" },
  { "5.jpg", "6.jpg", "7.jpg","8.jpg" },
   { "9.jpg", "10.jpg", "11.jpg","12.jpg" },
   { "13.jpg", "14.jpg", "15.jpg","16.jpg" },
 { "17.jpg", "18.jpg", "1.jpg","2.jpg" }
};

PImage icon1, icon2, icon3, icon4; 

int height=600;
int width=600;
int size=100;
int margin = 50;
float gap=(((width)-((margin)+(4*size)))/3);

int counter=0;
int counter1=100;
int counter2=100;
int counter3=100;
int counter4=100;
/*
String[]question = new String[4];
String[]options=new String[4];
String[] girls= new String[7];*/

int a=5;
int b=5;
int c=5; 
int d=5; 

PFont thickfont, thinfont;

float choice1=0;
float choice2=0;
float choice3=0;
float choice4=0;

float a1=5;
float b1=10;
float c1=15;
float d1=20;

int r,g,b2;

Heart heart;



void setup() {
 

heart=new Heart (); 
size(width, 600);
int r=int(random(255));  
int g=int(random(255));  
int b2=int(random(255)); 

  
 
  // a test, can we get the question text, the choices, and what image to display
   println(questions[0]);
  println("  " + choices[0][0] + " is " + responseImages[0][0]);
  println("  " + choices[0][1] + " is " + responseImages[0][1]);
  println("  " + choices[0][2] + " is " + responseImages[0][2]);
   

//  question[0]= "What is your favorite color";
  //question[1]= "what is your favorite song";
  //question[2]= "question3";
  //question[3]= "question4";

/*  options[0]= "a";
  options[1]= "b";
  options[2]= "c";
  options[3]= "d";*/

  textSize (5);
  fill (255);
  text("START", 500, 100);

  background (#DBFFEB);

 thickfont= loadFont("Kartika-Bold-48.vlw");
 thinfont=loadFont("Kartika-48.vlw");
  smooth ();
get_update=update(17);
 
  }

void draw () {


frameRate(10);
  background (#DBFFEB, 10);
  fill (255);
  rectMode(CENTER);
  noStroke();
  fill(#BEF7D8);
  rect(width/2, 50,600, 120,7);
  fill(255);
  rect (width/2, 400, 500, 500,3);


  noFill();
strokeWeight(random(1,10));
  stroke(#0d1120,30);
  fill(#dee8fb);
  ellipse(margin+25, height-(margin), size, size);
  ellipse(margin+115+gap, height-(margin), size, size);
 ellipse(margin+215+gap*2, height-(margin), size, size);
  ellipse(margin+315+gap*3, height-(margin), size, size);
  fill(#5381db);
  ellipse (margin+25, height-margin, 40,40);
    ellipse(margin+115+gap, height-(margin), 40,40);
 ellipse(margin+215+gap*2, height-(margin), 40,40);
  ellipse(margin+315+gap*3, height-(margin),40,40);
  textFont(thickfont, 40); 
  if (counter == 0) {
    fill(#0d1120);
      textFont(thickfont, 15); 
    text("welcome to Okcutie! Answer all of the questions to ensure your closest match.",25,70);
   
      textFont(thickfont, 40); 
    fill (#0d1120);
    text("START", 400, 350);
  
heart.display();
textFont(thickfont, 20);
    fill (#0d1120);
text("Okcutie", 70, 50);
}
  if (counter == 1) {
    fill (#0d1120);
    textSize(20);
//52d68c
    text (questions[0], width/4, (height/5)); //question1?

         textFont(thinfont, 15); 
    text (choices[0][0], margin,   height-105);
    text (choices[0][1], margin+140,   height-105);
    text (choices[0][2], margin+290,   height-105);
    text (choices[0][3], margin+400,   height-105);
    fill (0);
    /*textSize(100);

    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));*/
  }

  if (counter == 2) {
  fill (#0d1120);
if (counter1==105){
      icon1 = loadImage(responseImages[0][0]);
     icon1.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon1, width/2, height/2); 
}else if (counter2==105){
  icon1=loadImage(responseImages[0][1]);
    icon1.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon1, width/2, height/2);
} else if (counter3==105){
  icon1=loadImage(responseImages[0][2]);
    icon1.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon1, width/2, height/2);
} else if (counter4==105){
    icon1=loadImage(responseImages[0][2]);  
  icon1.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon1, width/2, height/2);
} 
 
      //fill (255);
      
textFont(thickfont, 20); 
    text (questions[1], width/4, (height/5)); //question1

textFont(thinfont, 15); 
    text (choices[1][0], margin,   height-105);
    text (choices[1][1], margin+140,   height-105);
    text (choices[1][2], margin+290,   height-105);
    text (choices[1][3], margin+400,   height-105);
    fill (0);
    /*textSize(100);
    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));*/
  }

  if (counter == 3) {
fill (#0d1120);
    if (counter1==110){
      icon2 = loadImage(responseImages[1][0]);//aa
     icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2); 
}else if (counter2==103){//ab
  icon2=loadImage(responseImages[1][1]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter3==103){//ac
  icon2=loadImage(responseImages[1][2]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter4==103){//ad
    icon2=loadImage(responseImages[1][3]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter1==102){//ba
      icon2= loadImage(responseImages[2][0]);
     icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2); 
}else if (counter2==110){//bb
  icon2=loadImage(responseImages[2][1]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter3==102){//bc
  icon2=loadImage(responseImages[2][2]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter4==102){//bd
    icon2=loadImage(responseImages[2][3]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);

} else if (counter1==101){//ca
      icon2= loadImage(responseImages[3][0]);
     icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2); 
}else if (counter2==101){//cb
  icon2=loadImage(responseImages[3][1]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter3==110){//cc
  icon2=loadImage(responseImages[3][2]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter4==101){//cd
    icon2=loadImage(responseImages[3][3]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
     } else if (counter1==100){//da
      icon2= loadImage(responseImages[4][0]);
     icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2); 
}else if (counter2==100){//db
  icon2=loadImage(responseImages[4][1]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter3==100){//dc
  icon2=loadImage(responseImages[4][2]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
} else if (counter4==110){//dd
    icon2=loadImage(responseImages[4][2]);
    icon2.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon2, width/2, height/2);
}

    //fill (255);
a=0;
b=0; 
c= 0;
d=0;
         textFont(thickfont, 20); 
    text (questions[2], width/4, (height/5)); //question3

         textFont(thinfont, 15); 
    text (choices[2][0], margin,   height-105);
    text (choices[2][1], margin+140,   height-105);
    text (choices[2][2], margin+290,   height-105);
    text (choices[2][3], margin+400,   height-105);
  fill (#0d1120);
    /*textSize(100);
    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));*/
  }

if (counter == 4) {
    /*if (counter1==120){
      icon3 = loadImage(responseImages[][]);
     icon3.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon3, width/2, height/2); 
}else if (counter2==120){
  icon3=loadImage(responseImages[][]);
    icon3.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon3, width/2, height/2);
} else if (counter3==120){
  icon3=loadImage(responseImages[][]);
    icon3.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon3, width/2, height/2);
} else if (counter4==120){
  icon3=loadImage(responseImages[][]);
    icon3.resize(width/4, height/4);
     imageMode (CENTER);
     image (icon3, width/2, height/2);
} */
noStroke();


fill ((get_update+80),(get_update+80),(get_update+100),90);

triangle(0, height/2, 100, 100, 270,425);
//triangle(0+(move+speed), height/2, 100+(move+speed), 100, 270+(move+speed),425);
speed=(random(-5,15));
  fill (#0d1120);

         textFont(thickfont, 20); 
    text(question3[int(get_update)],margin/2, height/2); //question3 




     
  fill (#0d1120);

         textFont(thickfont,20); 
    text (questions[3], width/4, (height/5)); //question3

         textFont(thinfont, 15); 
    text (choices[3][0], margin,   height-105);
    text (choices[3][1], margin+140,   height-105);
    text (choices[3][2], margin+290,   height-105);
    text (choices[3][3], margin+400,   height-105);
    fill (0);
    /*textSize(100);
    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));*/
  }
  
if (counter == 5) {
 fill (#0d1120);
textFont(thickfont, 30); 

if (counter1==110 &&  counter2==96 &&  counter3==96 &&  counter4==96){
fill (#0d1120);
  textFont(thickfont, 40);
  text("Date Sam!", width/4, height/2);
}else if (counter1==102 &&  counter2==103 &&  counter3==95 &&  counter4==95){
  textFont(thickfont, 40);
  text("Date Mind!", width/4, height/2);
  }else if (counter1==101 &&  counter2==94 && counter3==103 &&  counter4==94){
  textFont(thickfont, 40);
  text("Date God!", width/4, height/2);
    }else if (counter1==100 &&  counter2==93 && counter3==93 &&  counter4==103){
  textFont(thickfont, 40);
  text("Date Green!", width/4, height/2);
      }else if (counter1==102 &&  counter2==103 &&  counter3==95 &&  counter4==95){
  textFont(thickfont, 40);
  text("Date Green!", width/4, height/2);
       }else if (counter1==94 &&  counter2==110 &&  counter3==94 &&  counter4==94){
  textFont(thickfont, 40);
  text("Date Diverse!", width/4, height/2);
   }else if (counter1==93 &&  counter2==101 &&  counter3==102 &&  counter4==93){
  textFont(thickfont, 40);
  text("Date Tattoo!", width/4, height/2);
     }else if (counter1==92 &&  counter2==100 &&  counter3==92 &&  counter4==102){
  textFont(thickfont, 40);
  text("Date Tattoo!", width/4, height/2);
     }else if (counter1==101 &&  counter2==94 &&  counter3==103 &&  counter4==94){
  textFont(thickfont, 40);
  text("Date Sam!", width/4, height/2);  
       }else if (counter1==93 &&  counter2==101 &&  counter3==102 &&  counter4==93){
  textFont(thickfont, 40);
  text("Date Mind!", width/4, height/2);  
       }else if ( counter1==92 &&  counter2==92 &&  counter3==110 &&  counter4==92){
  textFont(thickfont, 40);
  text("Date god!", width/4, height/2);  
       }else if ( counter1==91 &&  counter2==91 &&  counter3==100 &&  counter4==101){
  textFont(thickfont, 40);
  text("Date God!", width/4, height/2);  
         }else if (counter1==100 &&  counter2==93 &&  counter3==93 &&  counter4==103){
  textFont(thickfont, 40);
  text("Date Sam!", width/4, height/2);
         }else if (counter1==92 &&  counter2==100 &&  counter3==92 &&  counter4==102){
  textFont(thickfont, 40);
  text("Date Diverse!", width/4, height/2);  
       }else if (counter1==91 &&  counter2==91 &&  counter3==100 &&  counter4==101){
  textFont(thickfont, 40);
  text("Date God!", width/4, height/2);  
   }else if (counter1==90 &&  counter2==90 &&  counter3==90 &&  counter4==110){
  textFont(thickfont, 40);
  text("Date Dog!", width/4, height/2);  
fill (#0d1120,20);
  triangle (0, height/2, width/2, 0, width, height);
}
}

if (counter==6){
  background(0);

}

}




void mousePressed() {
  if (mouseX>400 && mouseY<400) {
    counter= 1;
  }
  else {
    if ( (mouseX< (margin+size))&&(mouseY>height-(margin+size))) { //counter++;
      counter+=1;
      counter1+=(a);
      counter2-=(b*.25);
      counter3-=(c*.25);
      counter4-=(d*.25);
    }

    else {
      if ( (mouseX> (margin)+(size)+(gap)) && (mouseX< (margin)+(size*2)+(gap)) && (mouseY>height-(margin+size)) ) {
        counter+=1;
        counter1-=(a*.50);
        counter2+=b;
        counter3-=(c*.50);
        counter4-=(d*.50);
      }

      else {
        if ( (mouseX>(margin)+(size*2)+(gap*2)) && (mouseX< (margin)+(size*3)+(gap*2)) && (mouseY>height-(margin+size)) ) {
          counter+=1;
          counter1-=(a*.75);
          counter2-=(b*.75);
          counter3+=c;
          counter4-=(d*.75);
        }

        else {
          if ((mouseX>(margin)+(size*3)+(gap*3)) && (mouseX< (margin)+(size*4)+(gap*3)) && (mouseY>height-(margin+size)) ) {
            counter+=1;
            counter1-=a;
            counter2-=b;
            counter3-=c;
            counter4+=d;
          }//if the value isn't clicked, the value will end up in the 80's otherwise the value with the highest amount of clicks should be the largest number, and the
        }
      }
    }

    println("a = " + a);// apple t auto formats code -- crazy life hack
    println("b = " + b);
    println("c = " + c);
    println("d = " + d);

    println("counter = " + counter);

    println("counter1 = " + counter1);
    println("counter2 = " + counter2);
    println("counter3 = " + counter3);
    println("counter4 = " + counter4);
  }
}


 int update (int val) { 
 int generate_update= int(random(val)); 
 return generate_update; 
 } 



class Heart {
  PVector loc=new PVector();
  PVector speed=new PVector();
   int x, y;
   int s;
  Heart (){
    loc=new PVector(random(width), 15);
      x=50;
      y=15;
      


 }

void display (){ 
fill(255, 0,0);
noStroke();

    beginShape(); 
    vertex(50, 15);  
    bezierVertex(50, (-5), 90, 5, 50, 40);  
    vertex(50, 15);  
    bezierVertex(50, (-5), 10, 5, 50,40);  
    endShape();
 }
}

