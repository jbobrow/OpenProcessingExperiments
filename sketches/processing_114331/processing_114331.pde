
int counter1,counter2; //whileLoops need a counter, usually an integer with a good name, like counter!
 
void setup() { //we do some setup here
  size(500, 500);
  counter1 = 16; //must initialize the counter to a value to begin counting from . . . yes, you can count backwards
counter2=30;
}
 
void draw() {
  
  colorMode(HSB);
  while (counter1 >0) { //this will loop until counter is >= 16
   // println("Print this line.  " + counter);
    ellipse(width/2,height/2,150*counter1/16,150*counter1/16);
    counter1--; //with while(), you need to increment at the end of the loop
  }
  while(counter2>0){
    strokeWeight(counter2/5);
  stroke(counter2*10,200,200);
    line(10,490*counter2/30,490*counter2/30,490*counter2/30);
      stroke(counter2*5,200,200);
    line(490*counter2/30,500,490*counter2/30,490*counter2/30);
    
    line(490*counter2/30,10,10*counter2/30,490);
       //line(10,490*counter2/30,10,490*counter2/30);
     line(10,10*counter2/30,490,490*counter2/30);  
    counter2-=1;
  }
    
  //Now that the loop is over, you can do something else here.
  println("While is complete, now what?");
  noLoop(); //We will stop the loop here so it doesn't print the above line forever.
}
