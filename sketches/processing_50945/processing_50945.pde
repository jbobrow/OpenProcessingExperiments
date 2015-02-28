
import processing.opengl.*;

PShape web; 

Person[] persons = new Person[52];
Emotion[] emotion = new Emotion[52];
Item[] item = new Item[52];
PFont caption;

//declare objects 
//Radial radial;

// initialize globals
String view = "radial"; // stores selected view
Boolean isDragged = false; // stores whether view has been dragged

void setup() {
  size(1200, 900, OPENGL);
  frameRate(60);
  smooth();
  caption = loadFont("QuicksandBook-Regular-12.vlw");

web = loadShape("Concept 1.svg");


  //Item(String name_, Emotion emotion_, new Person[] { persons[1], persons[2], etc. } );
  item[0] = new Item("Dollar wine glasses",  new Emotion[] { emotion[0] }, new Person[] { persons[7] } );
  item[1] = new Item("Caution Tape", new Emotion[] { emotion[1] }, new Person[] { persons[17] } );
  item[2] = new Item("Carved Belizean Tusk", new Emotion[] { emotion[2] }, new Person[] { persons[6], persons[50] } );
  item[3] = new Item("Pool Cue", new Emotion[] { emotion[3] }, new Person[] { persons[17] } );
  item[4] = new Item("Empty Picture Frame", new Emotion[] { emotion[4] }, new Person[] { persons[36] } );
  item[5] = new Item("Lyrics Journal", new Emotion[] { emotion[5] }, new Person[] { persons[10] } );
  item[6] = new Item("Bridesmaid Bouquet", new Emotion[] { emotion[6] }, new Person[] { persons[26], persons[41] } );
  item[7] = new Item("Broken Acrylic Snowflake", new Emotion[] { emotion[7] }, new Person[] { persons[34] } );
  item[8] = new Item("Crow Mask", new Emotion[] { emotion[8] }, new Person[] { persons[25], persons[28] } );
  item[9] = new Item("Pink Panther Music Box", new Emotion[] { emotion[9] }, new Person[] { persons[44] } );
  item[10] = new Item("Italian Scarf", new Emotion[] { emotion[10] }, new Person[] { persons[24], persons[51] } );
  item[11] = new Item("Sparkly Dinosaur Ornament", new Emotion[] { emotion[11] }, new Person[] { persons[49] } );
  item[12] = new Item("Figlet Mug", new Emotion[] { emotion[12] }, new Person[] { persons[3], persons[14], persons[20], persons[21], persons[27], persons[39], persons[43], persons[48], persons[51] } );
  item[13] = new Item("Vintage Opera Glasses", new Emotion[] { emotion[13] }, new Person[] { persons[33] } );
  item[14] = new Item("Empty Wine Bottle", new Emotion[] { emotion[14] }, new Person[] { persons[7] } );
  item[15] = new Item("Italian Apartment Keys", new Emotion[] { emotion[15] }, new Person[] { persons[2] } );
  item[16] = new Item("Momiji Doll", new Emotion[] { emotion[16] }, new Person[] { persons[28] } );
  item[17] = new Item("Tiny Ghost Light", new Emotion[] { emotion[17] }, new Person[] { persons[7] } );
  item[18] = new Item("Hawaiian Postcard", new Emotion[] { emotion[18] }, new Person[] { persons[28] });
  item[19] = new Item("Wine Corks", new Emotion[] { emotion[19] }, new Person[] { persons[7] } );
  item[20] = new Item("Beaded Strawberry Keychain", new Emotion[] { emotion[20] }, new Person[] { persons[15] } );
  item[21] = new Item("Ocean Shores Sand Dollars", new Emotion[] { emotion[21] }, new Person[] { persons[28], persons[38] } );
  item[22] = new Item("Cappuccino Cup", new Emotion[] { emotion[22] }, new Person[] { persons[12], persons[46] } );
  item[23] = new Item("Dawn Remember's CD", new Emotion[] { emotion[23] }, new Person[] { persons[17] } );
  item[24] = new Item("Unopened Cigar", new Emotion[] { emotion[24] }, new Person[] { persons[4], persons[8] } );
  item[25] = new Item("Stolen Street Sign 47th & 18th", new Emotion[] { emotion[25] }, new Person[] { persons[28], persons[32] } );
  item[26] = new Item("White Ocean Shores Bark", new Emotion[] { emotion[26] }, new Person[] { persons[38], persons[28] } );
  item[27] = new Item("Glow Up Ring", new Emotion[] { emotion[27] }, new Person[] { persons[6], persons[37] } );
  item[28] = new Item("Vintage Harmonica", new Emotion[] { emotion[28] }, new Person[] { persons[23] } );
  item[29] = new Item("Skeleton Watch", new Emotion[] { emotion[29] }, new Person[] { persons[33] } );
  item[30] = new Item("Alaskan Shot Glass", new Emotion[] { emotion[30] }, new Person[] { persons[36] } );
  item[31] = new Item("Florence Bracelet", new Emotion[] { emotion[31] }, new Person[] { persons[1], persons[13], persons[51] } );
  item[32] = new Item("Chinese Dexterity Balls", new Emotion[] { emotion[32] }, new Person[] { persons[35] } );
  item[33] = new Item("Cupcake Mug", new Emotion[] { emotion[33] }, new Person[] { persons[32] } );
  item[34] = new Item("Cherry Necklace", new Emotion[] { emotion[34] }, new Person[] { persons[16] } );
  item[35] = new Item("Fish Lure Keychain", new Emotion[] { emotion[35] }, new Person[] { persons[0], persons[4], persons[8], persons[28], persons[29] } );
  item[36] = new Item("Vintage Brooch", new Emotion[] { emotion[36] }, new Person[] { persons[22] } );
  item[37] = new Item("Heart Necklace", new Emotion[] { emotion[37] }, new Person[] { persons[11] } );
  item[38] = new Item("Arrowhead Necklace", new Emotion[] { emotion[38] }, new Person[] { persons[28] } );
  item[39] = new Item("Hana Yori Dango Necklace", new Emotion[] { emotion[39] }, new Person[] { persons[45] } );
  item[40] = new Item("Dana Kellan Necklace", new Emotion[] { emotion[40] }, new Person[] { persons[25] } );
  item[41] = new Item("Chalcedony Ring", new Emotion[] { emotion[41] }, new Person[] { persons[25] } );
  item[42] = new Item("Labradorite Necklace", new Emotion[] { emotion[42] }, new Person[] { persons[9], persons[18], persons[19], persons[31], persons[38], persons[42] } );
  item[43] = new Item("Green Gem Bracelet", new Emotion[] { emotion[43] }, new Person[] { persons[44] } );
  item[44] = new Item("Blue Wig", new Emotion[] { emotion[44] }, new Person[] { persons[7] } );
  item[45] = new Item("Traffic Cone", new Emotion[] { emotion[45] }, new Person[] { persons[0], persons[29] } );
  item[46] = new Item("Mistletoe Headband", new Emotion[] { emotion[46] }, new Person[] { persons[7] } );
  item[47] = new Item("Gigantic Pine Cone", new Emotion[] { emotion[47] }, new Person[] { persons[40], persons[32] });
  item[48] = new Item("Grey Hat", new Emotion[] { emotion[48] }, new Person[] { persons[40] } );
  item[49] = new Item("Pink Perfume Bottle", new Emotion[] { emotion[49] }, new Person[] { persons[5] } );
  item[50] = new Item("Photo of Quote", new Emotion[] { emotion[50] }, new Person[] { persons[47] } );
  item[51] = new Item("Peacock Feathers", new Emotion[] { emotion[51] }, new Person[] { persons[30] } );
    
  //Person(String name)
  persons[0] = new Person("Alan Lampe");
  persons[1] = new Person("Alana Robinson");
  persons[2] = new Person("Aleta Corboy");
  persons[3] = new Person("Amanda Hunt");
  persons[4] = new Person("Ashley Bonnell");
  persons[5] = new Person("Aunt Marsha");
  persons[6] = new Person("Aurora Paulozzo");
  persons[7] = new Person("Ben Badura");
  persons[8] = new Person("Bi Hyunh");
  persons[9] = new Person("Carla Angeles");
  persons[10] = new Person("Carly Henley");
  persons[11] = new Person("Charles Phon");
  persons[12] = new Person("Chris Ozuko");
  persons[13] = new Person("Claire Wolf");
  persons[14] = new Person("Coleen Maloney");
  persons[15] = new Person("Dad");
  persons[16] = new Person("Daniel Wong");
  persons[17] = new Person("David McArdel");
  persons[18] = new Person("Dedee Rosen");
  persons[19] = new Person("Donna Kurtz");
  persons[20] = new Person("Ellie Allen");
  persons[21] = new Person("Erin Hobbs");
  persons[22] = new Person("Grandma");
  persons[23] = new Person("Grandpa");
  persons[24] = new Person("Hannah Pederson");
  persons[25] = new Person("Heather Krawiecki");
  persons[26] = new Person("Johnny McArdel");
  persons[27] = new Person("Julia Lattimer");
  persons[28] = new Person("Katie Shafer");
  persons[29] = new Person("Kenny White");
  persons[30] = new Person("Laura Roginski");
  persons[31] = new Person("Michal Sanford");
  persons[32] = new Person("Molly Donnelly");
  persons[33] = new Person("Mom");
  persons[34] = new Person("Nadia Omar");
  persons[35] = new Person("Nana");
  persons[36] = new Person("Neusha Hejazinia");
  persons[37] = new Person("Nick Elmur");
  persons[38] = new Person("Rachel Smith");
  persons[39] = new Person("Rebecca Morse");
  persons[40] = new Person("Ryan Rosshirt");
  persons[41] = new Person("Sara McArdel");
  persons[42] = new Person("Sarah Coffman");
  persons[43] = new Person("Sofia Babaeva");
  persons[44] = new Person("Sophia Margolis");
  persons[45] = new Person("Stephanie Chong");
  persons[46] = new Person("Susan Ozubko");
  persons[47] = new Person("Sven Schirrmeister");
  persons[48] = new Person("Tara Tabares");
  persons[49] = new Person("Tommy Bentley");
  persons[50] = new Person("Tony Monto");
  persons[51] = new Person("Tracy Hughes");
  
  //Emotion(String name)  
  emotion[0] = new Emotion("GIDDY");
  emotion[1] = new Emotion("FRUSTRATED");
  emotion[2] = new Emotion("REVERENT");
  emotion[3] = new Emotion("EMPOWERED");
  emotion[4] = new Emotion("CHARMED");
  emotion[5] = new Emotion("HOPEFUL");
  emotion[6] = new Emotion("PROUD");
  emotion[7] = new Emotion("SILLY");
  emotion[8] = new Emotion("FLIRTY");
  emotion[9] = new Emotion("NOSTALGIC");
  emotion[10] = new Emotion("CHEERFUL");
  emotion[11] = new Emotion("EMPATHY");
  emotion[12] = new Emotion("SPIRITED");
  emotion[13] = new Emotion("LONGING");
  emotion[14] = new Emotion("DISMAYED");
  emotion[15] = new Emotion("BUBBLY");
  emotion[16] = new Emotion("SECRETIVE");
  emotion[17] = new Emotion("WISTFUL");
  emotion[18] = new Emotion("APPRECIATED");
  emotion[19] = new Emotion("LOST");
  emotion[20] = new Emotion("SPECIAL");
  emotion[21] = new Emotion("FEAR");
  emotion[22] = new Emotion("TREASURED");
  emotion[23] = new Emotion("LUCKY");
  emotion[24] = new Emotion("UNSTOPPABLE");
  emotion[25] = new Emotion("DEVILISH");
  emotion[26] = new Emotion("CALM");
  emotion[27] = new Emotion("CONTENT");
  emotion[28] = new Emotion("DREAMY");
  emotion[29] = new Emotion("IMAGINATIVE");
  emotion[30] = new Emotion("LOVED");
  emotion[31] = new Emotion("THRILLED");
  emotion[32] = new Emotion("CURIOUS");
  emotion[33] = new Emotion("UPBEAT");
  emotion[34] = new Emotion("SENTIMENTAL");
  emotion[35] = new Emotion("JOYFUL");
  emotion[36] = new Emotion("GRATEFUL");
  emotion[37] = new Emotion("HAPPY");
  emotion[38] = new Emotion("SINISTER");
  emotion[39] = new Emotion("ROMANTIC");
  emotion[40] = new Emotion("SNEAKY");
  emotion[41] = new Emotion("CONNECTED");
  emotion[42] = new Emotion("CHERISHED");
  emotion[43] = new Emotion("DEPRESSED");
  emotion[44] = new Emotion("WILD");
  emotion[45] = new Emotion("HUMOROUS");
  emotion[46] = new Emotion("EMBARASSED");
  emotion[47] = new Emotion("CONFUSED");
  emotion[48] = new Emotion("DEPRESSED");
  emotion[49] = new Emotion("ENERGETIC");
  emotion[50] = new Emotion("MISCHIEVOUS");
  emotion[51] = new Emotion("SAPPY");
}

void draw() {
  background(255);
  fill(150);
  stroke(0);
  
  ellipseMode(CENTER);
  stroke(100);
  noFill();
  ellipse(width/2, height/2, 590,590);
  
  translate(width/2, height/2);
  
  shape(web, -575,-470, 1150, 900);
  
  for( int i = 0; i < 26; i++) {
   pushMatrix();
   rotate(radians(3.6*i));
   textFont(caption, 12);
   textAlign(LEFT);
   text(persons[i].name, 300, 0);
   popMatrix(); 
 } 
  
 for( int i = 26; i < persons.length; i++) {
   pushMatrix();
   rotate(radians(3.6*i));
   textFont(caption, 12);
   textAlign(LEFT);
   text(persons[i].name, 300, 0);
   popMatrix(); 
 } 
 
 for( int i = 0; i < item.length; i++) {
   pushMatrix();
   rotate(radians(3.3*i-172));
   textFont(caption, 12);
   textAlign(LEFT);
   text(item[i].name, 300, 0);
   popMatrix(); 
 } 
}



