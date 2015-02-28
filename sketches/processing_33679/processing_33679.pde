
// variable for number of groceries so that you can easily change in on the fly
int num_of_groceries = 10;

//array created using the above variable so that your array size will change
// on the fly when you want to change the number of elements
String[] groceries = new String[num_of_groceries];

void setup() {
  //assigning variables to the array
  groceries[0] = "beer";
  groceries[1] = "milk";
  groceries[3] = "eggs";  
  groceries[2] = "bread";
  groceries[4] = "chocolate";
  println(groceries);

// the following will throw an error because there are 
// fewer than 18 cells in the array
//(like giving someone 10 boxes and asking what's in the 14th box)
//  println(groceries[18]);
}


void draw() {
  //nothing here!
}

void keyTyped() {
 if (key == 'l') {
   //this will list all the items in our array
  for(int gro_num = 0; gro_num < num_of_groceries; gro_num = gro_num + 1) {
    //this line can also be written shorter. I would write it like this:
    //for(int i = 0; i<groceries.length; i++) {
    //most programmers use i in for loops. gro_num is less confusing (I hope)
    println("groceries[" + gro_num + "] = " + groceries[gro_num]);
  }
 }
 //list items individually
 if (key == '0') {
   println("groceries[0] = " + groceries[0]);
 }
 if (key == '1') {
   println("groceries[1] = " + groceries[1]);
 }
 if (key == '2') {
   println("groceries[2] = " + groceries[2]);
 }
 if (key == '3') {
   println("groceries[3] = " + groceries[3]);
 }
 if (key == '4') {
   println("groceries[4] = " + groceries[4]);
 }
 
 // this shows you how you can change one thing in an array
 // (without affecting the other values in the array)
 if (key == 'e') {
   //change an item to something else. kitty's hungry!
   groceries[3] = "cat food";
 }
}

