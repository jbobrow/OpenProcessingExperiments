
size(400,400);
background(50);

//Create the array

String[] names = {"Dik diks", "Elephant shrews", "Water weasels", "Marmots"};
String[] parts = {"eyes", "paws", "feet", "ears"};
String[] adj = {"little","small","cute","strange"};

// Using arrays


int [] cant = {3, 5, 7, 15};
int r = int(random(4));

textAlign(CENTER);
textSize(20);
text(names[r]+" have "+ cant[r] +" "+ adj[r] +" "+ parts[r] +".", width/2, width/2);


// To know the length of elements of an array


print(cant.length);
