
//Variables and Math!
//variables are names you make up that hold data
//reserved variables are not made up by you, like mouseX and mouseY

//variables can hold numbers, words, true/false, and complex data

//TYPES:
//float (floating point numbers), #'s with decimal places, ex. 10.5, -100.747474, 100.0
//int (integers), counting numbers, ex. 0, 1, 2, 3.... -1, -2,-3....
//boolean, true/false
//string, sentence "this is my string"

//math operations,  *multiplication /division +addition -subtraction
//math ops,    pow() power,  sqrt() square root not squirt
// PEMDAS is order of ops, use parens to seperate

//DEBUGGING
//bug is unexpected behavior
//1. TAKE A BREAK
//2. Haave Someone else look at your code
//3. println()   print line
//4. Symplify (Keep it Simple Stupid)
//THE ONLY WAY TO LEARN PROGRAMMING IS TO PROGRAM, NOT JUST LISTENING

float myFirstVar; //declare, made up name
float garryTheVariable;
float varisaurus;

void setup() {
  size(1020,1020);
  myFirstVar=100.0; //assign it a value
  garryTheVariable = 1.0001;
  noStroke();
}

void draw() {
  varisaurus=sqrt(mouseX*mouseY)/4;
  fill (varisaurus, varisaurus, varisaurus);
  
  if(mousePressed) {varisaurus=255-(sqrt(mouseX*mouseY)/4);
  }
  
  ellipse (mouseX,mouseY,varisaurus,varisaurus);
  
  fill (myFirstVar/4);
  if (myFirstVar==1120) {myFirstVar=100;}
  ellipse (myFirstVar-100,myFirstVar-100,15,15);
  myFirstVar = myFirstVar +1 ;
  //if(garryTheVariable > 100) {
  //  garryTheVariable= 1.5;
  //}
  ellipse(300,200,garryTheVariable*mouseX/100,garryTheVariable);
  garryTheVariable = garryTheVariable * 1.5 ; //or do garryTheVariable +=1
}
