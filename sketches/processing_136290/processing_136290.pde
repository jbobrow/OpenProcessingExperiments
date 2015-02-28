
String [] q1_a = new String [2];
//String[] choose_q1_a = new String[2];
//String [] temp;

int height=600;
int width=600;
int size=100;
int margin = 30;
float gap=(((width)-((2*margin)+(4*size)))/3);
//float mind, sam, dog, tat, div, god, green;



int counter=0;
int counter1=100;
int counter2=100;
int counter3=100;
int counter4=100;

String[]question = new String[4];
String[]options=new String[4];
String[] girls= new String[7];
//String[] filler= new String[2];
int a=5;
int b=5;
int c=5; 
int d=5; 
PFont SansSerif48;

boolean choice=false;
float choice1=0;
float choice2=0;
float choice3=0;
float choice4=0;

float a1=5;
float b1=10;
float c1=15;
float d1=20;


void setup() {
  size(width, 600);




  question[0]= "question1";
  question[1]= "question2";
  question[2]= "question3";
  question[3]= "question4";

  options[0]= "a";
  options[1]= "b";
  options[2]= "c";
  options[3]= "d";

  textSize (5);
  fill (255);
  text("START", 500, 100);


  background (120);

  SansSerif48 = loadFont("SansSerif-48.vlw");
  smooth ();
  textSize (20);
  text ("RESTART", 500, 550);
}


void draw () {



  background (120, 10);
  noFill();
  stroke(0);
  rect(margin, height-(margin+size), size, size);
  rect(margin+100+gap, height-(margin+size), size, size);
  rect(margin+200+gap*2, height-(margin+size), size, size);
  rect(margin+300+gap*3, height-(margin+size), size, size);


  textFont(SansSerif48, 40); 
  if (counter == 0) {
    fill (255);
    text("START", 400, 350);
  }

  if (counter == 1) {


    fill (255);
    textSize(50);
    text (question[0], 120, 250); //question1?
    fill (0);
    textSize(80);

    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));
  }

  if (counter == 2) {
    fill (255);
    textSize(50);
    text (question[1], 60, 250); //question1
    fill (0);
    textSize(80);
    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));
  }

  if (counter == 3) {
    fill (255);
    textSize(50);
    text (question[2], 60, 250); //question3
    fill (0);
    textSize(80);
    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));
  }

  if (counter == 4) {
    fill (255);
    textSize(50);
    text (question[3], 60, 250); //question4
    fill (0);
    textSize(80);
    text (options[0], margin+(size/3), height-(margin+(size/3.5)));
    text (options[1], margin+(size/3)+140, height-(margin+(size/3.5)));
    text (options[2], margin+(size/3)+290, height-(margin+(size/3.5)));
    text (options[3], margin+(size/3)+430, height-(margin+(size/3.5)));
  }
update();

}




void mousePressed() {


  if (mouseX>400 && mouseY<400) {
    counter= 1;
  }
  else {
    if ( (mouseX< (margin+size))&&(mouseY>height-(margin+size))) { //counter++;
      counter+=1;
      counter1+=(a);
      
      choice1=+a1;
       choice=true;
    
      
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
        //if ( (mouseX>320 && mouseX<420)&&     
        if ( (mouseX>(margin)+(size*2)+(gap*2)) && (mouseX< (margin)+(size*3)+(gap*2)) && (mouseY>height-(margin+size)) ) {
          counter+=1;
          counter1-=(a*.75);
          counter2-=(b*.75);
          counter3+=c;
          counter4-=(d*.75);
        }
        else {
          //if ( (mouseX>465 && mouseX<565)&&
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
    println("a = " + a);
    println("counter1 = " + counter1);
    println("counter2 = " + counter2);
    println("counter3 = " + counter3);
    println("counter4 = " + counter4);

    println("MX " + mouseX);

    println("MY "+mouseY);
  }
  
}

void update(){
     if (choice==true){
      String [] q1_a = {"tree","in"};
String[] choose_q1_a = new String[q1_a.length];
arraycopy(q1_a, choose_q1_a);

    println(choose_q1_a);
    println(a1);
}
}
