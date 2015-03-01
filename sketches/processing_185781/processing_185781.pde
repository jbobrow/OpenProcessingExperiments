
//Created by Gentry Demchak
//Visualizing Patterns and Space
//fibonacci Sequence Visualization
//This visualization is based entirely on the fibonacci sequence.
//rectangle lengths represent the actual fibonacci numbers.
//the color of the rectangles have been presented in grey scale,
//where the shade is also represented by the fibonacci sequence.
//Therefore, the combination of the two numbers will always be equal to the
//third number in the sequence.
//I have also applied the rule of the fibonachi pattern to the fibonachi sequence itself.



int[] fibonacci1 = {0, 10, 10, 20, 30, 50, 80};
int[] fibonacci2 = {10,20,30,50,80,130};
int[] fibonacci3 = {30,50,80,130,210};
int[] fibonacci4 = {80,130,210,240};
int[] fibonacci5 = {210,340,450};
int[] fibonacci6 = {450,790};
int[] fibonacci7 = {1240};
int pace = 10; 
int timing = 50;
int x;
int speed;
int y;
int size;
int xoffset;

void setup() {
size(600,70);

speed = 5;
y = 0;
size = 10;
xoffset = 0;
 
}

void draw() {
   background(0);
   stroke(255);
   
   runTestSequence(y,size,xoffset,fibonacci1);
   runTestSequence(y+10,size,xoffset,fibonacci2);
   runTestSequence(y+20,size,xoffset,fibonacci3);
   runTestSequence(y+30,size,xoffset,fibonacci4);
   runTestSequence(y+40,size,xoffset,fibonacci5);
   runTestSequence(y+50,size,xoffset,fibonacci6);
   runTestSequence(y+60,size,xoffset,fibonacci7);
   speed();

}


void runTestSequence(float y, float size, float xoffset, int [] sequence) {
   for(int Bar = 0; Bar < sequence.length; Bar++){
   for (int i = 0; i < sequence.length; i+=100){
  //int duration = pace/timing[Bar]; //space between bars
    fill(sequence[Bar]);
    rect((sequence[Bar])+x+(xoffset),y,sequence[Bar],size);
 }
 }
 if (x > 800) {
  x = -2500; 
 }
}

void speed() {
   x += speed;
}






