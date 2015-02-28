
int value=0;

/*int[] val = {
  278,
  184,
  133,
  112,
  112,
  107,
  106,
  104,
  102,
  100,
};
String[] name = {
   "Avatar",
   "Titanic",
  "Harry Potter and the beathly hallows part 2",
  "Transformers: dark of the moon",
  "The Lord of the Rings: The Return of the King",
  "Pirates of the Caribbean: Dead Man's Chest",
  "Toy Story 3",
  "Pirates of the Caribbean: On Stranger Tides",
  "Alice in Wonderland",
  "The Dark Knight",
};

*/
void setup(){
  size(1100,600);
 // noStroke();
  background(255);
}



void draw(){
fill(51,255,51,63);
ellipse(100,300,556,556);//1
fill(0);
text("Avatar $278 million",15,50,50);

fill(66,100,66,63);
ellipse(200,300,368,368); //2
fill(0);
text("Titanic $184 million",50,100,50);


fill(255,10,1,63);
ellipse(300,300,266,266); //3
fill(0);
text("Harry Potter and the deathly hallows part 2 $133 million",150,150,50);


fill(50,50,255,63);
ellipse(400,300,224,224); //4
fill(0);
text("Transformers: dark of the moon $112 million",250,200,50);

fill(255,0,154,63);
ellipse(500,300,222,222); //5
fill(0);
text("The Lord of the Rings: The Return of the King $111 million",350,250,50);


fill(255,0,0,63);
ellipse(600,300,214,214); //6
fill(0);
text("Pirates of the Caribbean: Dead Man's Chest $107 million",450,300,50);


fill(204,153,255,63);
ellipse(700,300,212,212); //7
fill(0);
text("Toy Story 3 $106 million",550,350,50);


fill(51,51,203,63);
ellipse(800,300,208,208); //8
fill(0);
text("Pirates of the Caribbean: On Stranger Tides $104 million",550,400,50);


fill(255,255,0,63);
ellipse(900,300,206,206); //9
fill(0);
text("Alice in Wonderland $103 million",750,450,50);

fill(234,234,79,63);
ellipse(1000,300,200,200); //10
fill(0);
text("The Dark Knight $100 million",820,500,50);




PFont font;
font= loadFont("AlBayan-20.vlw");
textFont (font);
fill(0);
text("Highest grossing films",600,25,50);
}








