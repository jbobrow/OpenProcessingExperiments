
//arrays
size(400,250);
background(50);

//create the arrays
String[] names = {"John", "Paul", "Ringo", "George"};
String[] parts = {"eyes", "heads", "feet", "ears"};
int[]cant = {3,5,7,15};
//4 is selected because it is the number of items in the array and we want to return a value in that exists
//random returns a float but we need an int, so we must put it inside an int
int r = int(random(4));

//Using arrays (Concatenated)
//names[r] returns a random name
//cant[3] returns the item in the third position of the cant array
//20,20 provides the position for the text
text(names[r]+" has "+cant[3]+ " " + parts[3], 20,20);

//To know the length of elements of an array
//This is important so that you don't go outside of your array boundaries
print(cant.length);
