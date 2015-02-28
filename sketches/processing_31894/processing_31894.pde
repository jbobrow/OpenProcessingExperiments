
//Poem Start//
//found at http://poemhunter.com/poem/jabberwocky/

println("'Twas brillig, and the slithy toves");
println("Did gyre and gimble in the wabe:");
println("All mimsy were the borogoves,");
println("And the mome raths outgrabe.");

println("'Beware the Jabberwock, my son!");
println("The jaws that bite, the claws that catch!");
println("Beware the Jubjub bird, and shun");
println("The frumious Bandersnatch!'");

println("He took his vorpal sword in hand:");
println("Long time the manxome foe he sought --");
println("So rested he by the Tumtum tree,");
println("And stood a while in thought.");

println("And, as in uffish thought he stood,");
println("The Jabberwock, with eyes of flame,");
println("Came whiffling through the tulgey wood,");
println("And burbled as it came!");

println("One two! One two! And through and through");
println("The vorpal blade went snicker-snack!");
println("He left it dead, and with its head");
println("He went galumphing back.");

println("'And hast thou slain the Jabberwock?");
println("Come to my arms, my beamish boy!");
println("Oh frabjous day! Callooh! Callay!'");
println("He chortled in his joy.");

println("'Twas brillig, and the slithy toves");
println("Did gyre and gimble in the wabe:");
println("All mimsy were the borogoves,");
println("And the mome raths outgrabe.");

//DRAWING A BOX
background(0,178,239);
size(100,100);

//LINES UNDER
line(35,0,35,100);
line(63,0,63,100);
line(50,0,50,100);


//TRIANGLE IN BOX
//MIDDLE
triangle(25,25,50,75,75,25);
//BOTTOM
triangle(35,100,50,75,63,100);
//TOP
triangle(25,25,50,0,75,25);



//CIRCLES INSIDE THE BOX
ellipse(50,50,10,10);
ellipse(25,50,10,10);
ellipse(75,50,10,10);

ellipse(50,25,10,10);
ellipse(25,25,10,10);
ellipse(75,25,10,10);

ellipse(50,75,10,10);
ellipse(25,75,10,10);
ellipse(75,75,10,10);


//LINES DIVIDING PLANE VERTICALLY
line(10,0,10,100);
line(25,0,25,100);
line(75,0,75,100);
line(86,0,86,100);


//LINES DIVIDING PLANE HORIZONTALLY
line(0,50,100,50);
line(0,25,100,25);
line(0,75,100,75);





