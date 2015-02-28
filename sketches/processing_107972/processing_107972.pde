
float xt;
float x;
float r;
boolean switchon1 = false;
boolean switchon2 = false;
boolean switchon3 = false;
boolean switchon4 = false;
String temp = "";
String temp2 = "";

void setup (){
size(500,500);
}
void draw(){

background(255);
fill(0);
input();
display();
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
 //if switchon1 is activated:
  if (switchon1 == true) {
    text("Temp2: " + temp2, 50, 150);
    //x = x/10;
    //if the key pressed is not a
    if(key != 'a'){
      //temp2 stores the keys
      key = str(key);
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
          //temp stores the keys
    key = str(key);
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
  text("This program contains a simplified yet functional version of the logistic function.",10,10);
  text("It has been designed to aid learning about chaos and attractors.", 10, 30);
  text("Press a to input x. Press b to input r. And then, press c to calculate.", 10, 50);
  text("You can also press d to iterate the function.", 10, 70);
  if (switchon3 == true) {
    calculate(r, x);
  }
  if (switchon4 == true) {
    text("Function iterated!", 50, 90);
    x = xt;
    calculate(r, x);
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
  text("Xt: " + xt, 50, 90);
  text("X:" + x, 50, 110);
  text("R:" + r, 50, 130);
    if (switchon1 == true){
      text("Task: input x. Between 0 and 1.", 50, 150);
    }
 if (switchon2 == true){
  text("Task: input R.", 50, 150);
 }
 if (switchon3 == true){
  text("Task: Xt calculated.", 50, 150);
 }
 if (switchon3 == true){
  text("Task: Xt iterated. Press d again to iterate.", 50, 150);
  text("If the xt comes out the same after iterating it might mean that it got caught inside an attractor.", 50, 180);
 }
}


