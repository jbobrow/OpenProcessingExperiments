
//Jason Kim's Poem 
//Poem Link: http://www.poemhunter.com/poem/just-beyond-the-sunset/

println("Just Beyond The Sunset");
println("");
println("Just beyond the sunset");
println("Someone waits for me");
println("Just beyond the sunset");
println("Lies my destiny");
println("Where the purple mountains");
println("Lie in deep tranquillity");
println("There I’ll find the treasure");
println("Of love eternally");
println("");
println("Just beyond the sunset");
println("Waits someone so fair");
println("Just beyond the sunset");
println("All alone they wait there");
println("Their hair is golden");
println("The colour of the sand");
println("Their eyes sparkle in the night");
println("Like diamonds in your hand");
println("");
println("Just beyond the sunset");
println("Lies a home for me");
println("Where the world is peaceful");
println("Like a paradise should be");
println("Just beyond the sunset");
println("Someday is where you’ll find me");

//Canvas
background(20,120,200);
size(800,400);

//Sun
stroke(255,255,0);
fill(200,200,20);
ellipse(400,100,50,50);

//aura
stroke(255,255,50);
noFill();
ellipse(400,100,60,60);

stroke(255,255,50);
noFill();
ellipse(400,100,70,70);

stroke(255,255,50);
noFill();
ellipse(400,100,90,90);

stroke(255,255,50);
noFill();
ellipse(400,100,120,120);

//Beach Sand
fill(255,255,250);
rect(0,300,800,100);


text("Just Beyond The Sunset",335,185);
fill(255,255,255);

//sand line

stroke(100,100,100);
line(0,300,800,300);
line(0,310,800,310);
line(0,325,800,325);
line(0,350,800,350);

//purple mountains

fill(100,20,200);
triangle(0,300,50,200,100,300);
triangle(100,300,200,150,300,300);
triangle(300,300,350,200,400,300);
triangle(400,300,450,200,500,300);
triangle(500,300,600,150,700,300);
triangle(700,300,750,200,800,300);
triangle(800,300,850,200,900,300);



