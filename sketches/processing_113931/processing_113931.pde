
float xt;
float x;
float r;
boolean switchon1 = false;
boolean switchon2 = false;
boolean switchon3 = false;
boolean switchon4 = false;
boolean switchon5 = false;
boolean switchon6 = false;

String temp = "";
String temp2 = "";
//switchs
boolean bar1 = true;
float val1 = 0;
boolean bar2 = false;
float val2 = 0;
boolean bar3 = false;
float val3 = 0;
boolean bar4 = false;
float val4 = 0;
boolean bar5 = false;
float val5 = 0;
boolean bar6 = false;
float val6 = 0;
boolean bar7 = false;
float val7 = 0;
boolean bar8 = false;
float val8 = 0;
//
float length1;
float length2;
float length3;
float length4;
float length5;
float length6;
float length7;
float length8;

void setup (){
size(500,500);
}
void draw(){
background(108,206,187);
fill(0);
input();
display();
bars();
}

void keyPressed(){
 //if a is pressed switchon1 is activated
if (key == 'a'){
switchon1 = true;
switchon2 = false;
switchon3 = false;
switchon4 = false;

text("Input x. Between 0 and 1.", 50, 70);
}
 //if b is pressed switchon2 is activated
if (key == 'b'){
switchon1 = false;
switchon2 = true;
switchon3 = false;
switchon4 = false;

}
 //if c is pressed switchon3 is activated
if (key == 'c'){
switchon1 = false;
switchon2 = false;
switchon3 = true;
switchon4 = false;
}
 //if d is pressed switchon4 is activated
if (key == 'd'){
switchon1 = false;
switchon2 = false;
switchon3 = false;
switchon4 = true;
}

 //if h is pressed switchon5 is activated
if (key == 'i'){
switchon1 = false;
switchon2 = false;
switchon3 = false;
switchon4 = false;
if(switchon5 == false){
switchon5 = true;
}
else if(switchon5 == true){
switchon5 = false;
}
}


//if d is pressed switchon4 is activated
if (key == 'r'){
switchon1 = false;
switchon2 = false;
switchon3 = false;
switchon4 = false;
if(switchon6 == false){
switchon6 = true;
}
else if(switchon6 == true){
switchon6 = false;
}
}

 //if switchon1 is activated:
  if (switchon1 == true) {
    text("Temp2: " + temp2, 50, 150);
    //x = x/10;
    //if the key pressed is not a
    if(key != 'a'){
    key = str(key);
      //temp2 stores the keys
      temp2 = temp2 + key;
      x = float(temp2);
      //r = int(str(key));
      }
  }
   //if switchon2 is activated:
if(switchon2 == true){
  text("Input r.", 50,70);
  text("Input for R: " + temp, 50, 150);
      //if the key pressed is not b
  if(key != 'b'){
  key = str(key);
          //temp stores the keys
    temp = temp + key;
    r = float(temp);
    //r = int(str(key));
    }
    if(key == '.'){
          //temp stores the keys
    key = key - 48;
    temp = temp + key;
    r = float(temp);
    //r = int(str(key));
    }
  }
  

}




//main function
void input() {
  if(switchon5 == false){
  textSize(25);
  text("The Logistic Map", 150, 40);
  textSize(14);
  text("Press a to input x. Press b to input r. Then, press c to calculate.", 10, 70);
  text("You can also press d to iterate the result. Press i for more information.", 10, 90);
  if(switchon6 == true){
  xt = 0;
  x = 0;
  r = 0;
  length1 = 0;
  length2 = 0;
  length3 = 0;
  length4 = 0;
  length5 = 0;
  length6 = 0;
  length7 = 0;
  length8 = 0;
  }
  if (switchon3 == true) {
    calculate(r, x);
  }
  if (switchon4 == true) {
    text("Function iterated!", 50, 110);
    x = xt;
    calculate(r, x);
     if(bar1 == true){
    length1 = xt * 80; 
    val1 = length1/80;
    bar1 = false;
    bar2 = true;
    calculate(r, x);
    }
    else if(bar2 == true){
    length2 = xt * 80;
    val2 = length2/80;
    bar2 = false;
    bar3 = true;
    calculate(r, x);
    }
    else if(bar3 == true){
    length3 = xt * 80;
    val3 = length3/80;
    bar3 = false;
    bar4 = true;
    calculate(r, x);
    }
    else if(bar4 == true){
    length4 = xt * 80;
    val4 = length4/80;
    bar4 = false;
    bar5 = true;
    calculate(r, x);
    }
     else if(bar5 == true){
    length5 = xt * 80;
    val5 = length5/80;
    bar5 = false;
    bar6 = true;
    calculate(r, x);
    }
     else if(bar6 == true){
    length6 = xt * 80;
    val6 = length6/80;
    bar6 = false;
    bar7 = true;
    calculate(r, x);
    }
     else if(bar7 == true){
    length7 = xt * 80;
    val7 = length7/80;
    bar7 = false;
    bar8 = true;
    calculate(r, x);
    }
    else if(bar8 == true){
    length8 = xt * 80;
    val8 = length8/80;
    bar8 = false;
    bar1 = true;
    calculate(r, x);
    }
  }
}
}

//function with the logistic equation
float calculate(float r, float x) {
  xt = r*x*(1-x);
  switchon4 = false;
  switchon3 = false;
  return r;
}
//function that displays values
void display() {
  if(switchon5 == false){
  text("Xt: " + xt, 50, 110);
  text("X:" + x, 50, 130);
  text("R:" + r, 50, 150);
  }
    if (switchon1 == true){
      text("Task: input x. Between 0 and 1.", 50, 170);
    }
 if (switchon2 == true){
  text("Task: input R.", 50, 170);
 }
 if (switchon3 == true){
  text("Task: Xt calculated.", 50, 170);
 }
 if (switchon3 == true){
  text("Task: Xt iterated. Press d again to iterate.", 50, 150);
  text("If the xt comes out the same after iterating it might mean that it got caught inside an attractor.", 50, 180);
 }
 
  if(switchon5 == true){
   textSize(25);
  text("The Logistic Map", 150, 40);
  
  textSize(20);
  text("About the program", 10, 70);
  
  textSize(14);
  text("This program contains a simplified yet functional version of the logistic",10,90);
  text("function. ", 10 , 110);
  text("It has been designed to aid learning about chaos and attractors.", 10, 130);
  text("The bars show up to 4 consecutive iterations. Enough to see", 10, 150);
  text("fixed points and oscillations.", 10, 170);
  
  textSize(20);
  text("About attractors", 10, 200);
  textSize(14);
  text("In a linear system, an attractor is a fixed point. In non-linear systems,", 10, 220);
  text("they can also be periodic or chaotic.",10,240);
  text("A fixed point: when iterated enough, the bars don't change.", 10, 260);
  text("An oscillation: when iterated enough, the bars settle into a finite",10,280);
  text(" number of values", 10,300);
  text("Chaos: when iterated enough, the bars don't settle into a finite number",10,320);
  text("of values.",10,340);

  }
 
}

//function that handles the bars

void bars(){
  int x = 30;
  int y = 190;
  //code to capture up to four oscillations 
   //length1 = xt * 80;
   if(switchon5 == false){
  //four bars
  rect(x,y, 20,length1);
  text("1",x + 6,y - 3);
  
  rect(x + 40,y,20,length2);
  text("2",x + 46,y - 3);
  
  rect(x + 80,y,20,length3);
  text("3",x + 86,y - 3);
  
  rect(x + 120,y,20,length4);
  text("4",x + 126,y - 3);
  
  rect(x + 160,y,20,length5);
  text("5",x + 166,y - 3);
  
  rect(x + 200,y,20,length6);
  text("6",x + 206,y - 3);
  
  rect(x + 240,y,20,length7);
  text("7",x + 246,y - 3);
  
  rect(x + 280,y,20,length8);
  text("8",x + 286,y - 3);
  //list
  text("List of values", 20,350);
  //left side
  text("1: " + val1,15,380);
  text("2: " + val2,15,410);
  text("3: " + val3,15,440);
  text("4: " + val4,15,470);
  //right side
  text("5: " + val5,240,380);
  text("6: " + val6,240,410);
  text("7: " + val7,240,440);
  text("8: " + val8,240,470);
   }
  
}
