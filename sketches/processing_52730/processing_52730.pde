
//import processing.opengl.*;

Person[] persons = new Person[52];
Emotion[] emotion = new Emotion[52];
Item[] item = new Item[52];
Photograph[] photograph = new Photograph[52];
PFont caption;
PFont caption2;
PImage img;
PImage img2;

// initialize globals
String view = "radial"; 
Boolean isDragged = false; 
float damping = 0.09;
float colWidth;
float rowHeight;
int cols = 3;
int thumbSize = 12; 
int fullSize = 450;
int r = fullSize/2 + 10; 
PFont font; 

void setup() {
  size(1400, 900);
  frameRate(60);
  smooth();
  caption = loadFont("QuicksandBook-Regular-12.vlw");
  caption2 = loadFont("QuicksandLight-Regular-20.vlw");
  img = loadImage("Background.png");
  img2 = loadImage("Brackets.png");
    
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
  emotion[0] = new Emotion("GIDDY", color(184,179,8));
  emotion[1] = new Emotion("FRUSTRATED", color(70,22,107));
  emotion[2] = new Emotion("REVERENT", color(179,8,56));
  emotion[3] = new Emotion("EMPOWERED", color(82,46,145));
  emotion[4] = new Emotion("CHARMED", color(0,178,89));
  emotion[5] = new Emotion("HOPEFUL", color(239,65,53));
  emotion[6] = new Emotion("PROUD", color(244,125,48));
  emotion[7] = new Emotion("SILLY", color(242,101,49));
  emotion[8] = new Emotion("FLIRTY", color(202,48,146));
  emotion[9] = new Emotion("NOSTALGIC", color(211,140,189));
  emotion[10] = new Emotion("CHEERFUL", color(19,181,234));
  emotion[11] = new Emotion("EMPATHY", color(124,0,64));
  emotion[12] = new Emotion("SPIRITED", color(237,24,73));
  emotion[13] = new Emotion("LONGING", color(162,25,132));
  emotion[14] = new Emotion("DISMAYED", color(0,115,174));
  emotion[15] = new Emotion("BUBBLY", color(239,80,145));
  emotion[16] = new Emotion("SECRETIVE", color(211,140,189));
  emotion[17] = new Emotion("WISTFUL", color(78,132,196));
  emotion[18] = new Emotion("APPRECIATED", color(255,210,0));
  emotion[19] = new Emotion("LOST", color(82,97,172));
  emotion[20] = new Emotion("SPECIAL", color(229,80,145));
  emotion[21] = new Emotion("FEAR", color(70,22,107));
  emotion[22] = new Emotion("TREASURED", color(202,0,108));
  emotion[23] = new Emotion("LUCKY", color(122,193,67));
  emotion[24] = new Emotion("UNSTOPPABLE", color(122,204,200));
  emotion[25] = new Emotion("DEVILISH", color(237,23,79));
  emotion[26] = new Emotion("CALM", color(0,115,174));
  emotion[27] = new Emotion("CONTENT", color(0,146,126));
  emotion[28] = new Emotion("DREAMY", color(53,189,178));
  emotion[29] = new Emotion("IMAGINATIVE", color(19,181,234));
  emotion[30] = new Emotion("LOVED", color(237,23,79));
  emotion[31] = new Emotion("THRILLED", color(237,24,73));
  emotion[32] = new Emotion("CURIOUS", color(122,193,67));
  emotion[33] = new Emotion("UPBEAT", color(239,65,53));
  emotion[34] = new Emotion("SENTIMENTAL", color(78,132,196));
  emotion[35] = new Emotion("JOYFUL", color(202,48,146));
  emotion[36] = new Emotion("GRATEFUL", color(82,97,172));
  emotion[37] = new Emotion("HAPPY", color(53,189,178));
  emotion[38] = new Emotion("SINISTER", color(82,46,145));
  emotion[39] = new Emotion("ROMANTIC", color(239,80,145));
  emotion[40] = new Emotion("SNEAKY", color(0,146,126));
  emotion[41] = new Emotion("CONNECTED", color(6,178,89));
  emotion[42] = new Emotion("CHERISHED", color(242,101,49));
  emotion[43] = new Emotion("DEPRESSED", color(22,20,95));
  emotion[44] = new Emotion("WILD", color(238,79,36));
  emotion[45] = new Emotion("HUMOROUS", color(244,125,48));
  emotion[46] = new Emotion("EMBARASSED", color(184,179,8));
  emotion[47] = new Emotion("CONFUSED", color(238,49,36));
  emotion[48] = new Emotion("DEPRESSED", color(22,20,95));
  emotion[49] = new Emotion("ENERGETIC", color(229,14,99));
  emotion[50] = new Emotion("MISCHIEVOUS", color(124,0,64));
  emotion[51] = new Emotion("SAPPY", color(162,25,132));

  //Item(String name_, Emotion emotion_, new Person[] { persons[1], persons[2], etc. } );
  item[0] = new Item("Dollar wine glasses",  emotion[0], new Person[] { persons[7] } , "Item_1.png");
  item[1] = new Item("Caution Tape", emotion[1], new Person[] { persons[17] } , "Item_2.png" );
  item[2] = new Item("Carved Belizean Tusk", emotion[2], new Person[] { persons[6], persons[50] }, "Item_3.png" );
  item[3] = new Item("Pool Cue", emotion[3], new Person[] { persons[17] }, "Item_4.png" );
  item[4] = new Item("Empty Picture Frame", emotion[4], new Person[] { persons[36] }, "Item_5.png" );
  item[5] = new Item("Lyrics Journal", emotion[5], new Person[] { persons[10] }, "Item_6.png" );
  item[6] = new Item("Bridesmaid Bouquet", emotion[6], new Person[] { persons[26], persons[41] }, "Item_7.png" );
  item[7] = new Item("Broken Acrylic Snowflake", emotion[7], new Person[] { persons[34] }, "Item_8.png" );
  item[8] = new Item("Crow Mask", emotion[8], new Person[] { persons[25], persons[28] }, "Item_9.png" );
  item[9] = new Item("Pink Panther Music Box", emotion[9], new Person[] { persons[44] }, "Item_10.png" );
  item[10] = new Item("Italian Scarf", emotion[10], new Person[] { persons[24], persons[51] }, "Item_11.png" );
  item[11] = new Item("Sparkly Dinosaur Ornament", emotion[11], new Person[] { persons[49] }, "Item_12.png" );
  item[12] = new Item("Figlet Mug", emotion[12], new Person[] { persons[3], persons[14], persons[20], persons[21], persons[27], persons[39], persons[43], persons[48], persons[51] }, "Item_13.png" );
  item[13] = new Item("Vintage Opera Glasses", emotion[13], new Person[] { persons[33] }, "Item_14.png" );
  item[14] = new Item("Empty Wine Bottle", emotion[14], new Person[] { persons[7] }, "Item_15.png" );
  item[15] = new Item("Italian Apartment Keys", emotion[15], new Person[] { persons[2] }, "Item_16.png" );
  item[16] = new Item("Momiji Doll", emotion[16], new Person[] { persons[28] }, "Item_17.png" );
  item[17] = new Item("Tiny Ghost Light", emotion[17], new Person[] { persons[7] }, "Item_18.png" );
  item[18] = new Item("Hawaiian Postcard", emotion[18], new Person[] { persons[28] }, "Item_19.png");
  item[19] = new Item("Wine Corks", emotion[19], new Person[] { persons[7] }, "Item_20.png" );
  item[20] = new Item("Beaded Strawberry Keychain", emotion[20], new Person[] { persons[15] }, "Item_21.png" );
  item[21] = new Item("Ocean Shores Sand Dollars", emotion[21], new Person[] { persons[28], persons[38] }, "Item_22.png" );
  item[22] = new Item("Cappuccino Cup", emotion[22], new Person[] { persons[12], persons[46] }, "Item_23.png" );
  item[23] = new Item("Dawn Remember's CD", emotion[23], new Person[] { persons[17] }, "Item_24.png" );
  item[24] = new Item("Unopened Cigar", emotion[24], new Person[] { persons[4], persons[8] }, "Item_25.png" );
  item[25] = new Item("Stolen Street Sign 47th & 18th", emotion[25], new Person[] { persons[28], persons[32] }, "Item_26.png" );
  item[26] = new Item("White Ocean Shores Bark", emotion[26], new Person[] { persons[38], persons[28] }, "Item_27.png" );
  item[27] = new Item("Glow Up Ring", emotion[27], new Person[] { persons[6], persons[37] }, "Item_28.png" );
  item[28] = new Item("Vintage Harmonica", emotion[28], new Person[] { persons[23] }, "Item_29.png" );
  item[29] = new Item("Skeleton Watch", emotion[29], new Person[] { persons[33] }, "Item_30.png" );
  item[30] = new Item("Alaskan Shot Glass", emotion[30], new Person[] { persons[36] }, "Item_31.png" );
  item[31] = new Item("Florence Bracelet", emotion[31], new Person[] { persons[1], persons[13], persons[51] }, "Item_32.png" );
  item[32] = new Item("Chinese Dexterity Balls", emotion[32], new Person[] { persons[35] }, "Item_33.png" );
  item[33] = new Item("Cupcake Mug", emotion[33], new Person[] { persons[32] }, "Item_34.png" );
  item[34] = new Item("Cherry Necklace", emotion[34], new Person[] { persons[16] }, "Item_35.png" );
  item[35] = new Item("Fish Lure Keychain", emotion[35], new Person[] { persons[0], persons[4], persons[8], persons[28], persons[29] }, "Item_36.png" );
  item[36] = new Item("Vintage Brooch", emotion[36], new Person[] { persons[22] }, "Item_37.png" );
  item[37] = new Item("Heart Necklace", emotion[37], new Person[] { persons[11] }, "Item_38.png" );
  item[38] = new Item("Arrowhead Necklace", emotion[38], new Person[] { persons[28] }, "Item_39.png" );
  item[39] = new Item("Hana Yori Dango Necklace", emotion[39], new Person[] { persons[45] }, "Item_40.png" );
  item[40] = new Item("Dana Kellan Necklace", emotion[40], new Person[] { persons[25] }, "Item_41.png" );
  item[41] = new Item("Chalcedony Ring", emotion[41], new Person[] { persons[25] }, "Item_42.png" );
  item[42] = new Item("Labradorite Necklace", emotion[42], new Person[] { persons[9], persons[18], persons[19], persons[31], persons[38], persons[42] }, "Item_43.png" );
  item[43] = new Item("Green Gem Bracelet", emotion[43], new Person[] { persons[44] }, "Item_44.png" );
  item[44] = new Item("Blue Wig", emotion[44], new Person[] { persons[7] }, "Item_45.png" );
  item[45] = new Item("Traffic Cone", emotion[45], new Person[] { persons[0], persons[29] }, "Item_46.png" );
  item[46] = new Item("Mistletoe Headband", emotion[46], new Person[] { persons[7] }, "Item_47.png" );
  item[47] = new Item("Gigantic Pine Cone", emotion[47], new Person[] { persons[40], persons[32] }, "Item_48.png");
  item[48] = new Item("Grey Hat", emotion[48], new Person[] { persons[40] },  "Item_49.png" );
  item[49] = new Item("Pink Perfume Bottle", emotion[49], new Person[] { persons[5] }, "Item_50.png" );
  item[50] = new Item("Photo of Quote", emotion[50], new Person[] { persons[47] }, "Item_51.png" );
  item[51] = new Item("Peacock Feathers", emotion[51], new Person[] { persons[30] }, "Item_52.png" );

}

void draw() {
  background(255);
  image(img, (width/2)-fullSize, 0+75, img.width, img.height);
  image(img2, 1200, 103, img.width/2, img.height/2.5);
  

  fill(150);
  stroke(0);
  noFill();

  shapeMode(CENTER);

  //Draw Connections and Display Emotions
  for (int i = 0; i < item.length; i++) {
    item[i].drawConnections();
    item[i].displayEmotion();
  }
  
  //Draw persons in a circle
  for (int i = 0; i < persons.length; i++) {
    float angle = radians(169) / persons.length;
    float posX = width/2 + r * cos(angle * i);
    float posY = height/2 + r * sin(angle * i);

    float textAngle = angle * i*1.05;
    float textOffset = r-2; // remove hardcoded value, base on r

    persons[i].position(posX, posY);
    persons[i].display(textAngle, textOffset);    
  } 

  //Draw items in a circle
  for (int i = 0; i < item.length; i++) {

    //Change + i to change the orientation!!!
    float angle = - radians(182) / item.length;
    float posX = width/2 + r * cos(angle * i-6.3);
    float posY = height/2 + r * sin(angle * i-6.3);

    float textAngle = angle * i;
    float textOffset = r + thumbSize; // base this on r + thumbnail size
    
    item[i].position(posX, posY);
    item[i].display(textAngle, textOffset);
  }
}

void mousePressed() {
  
  for (int i = 0; i < item.length; i++) {
    
    // first, test if mouse over on photo
    if (item[i].photo.isMouseOver(mouseX, mouseY)) {
      
      // invoke mouse pressed
      item[i].photo.onMousePressed();
      
      // set all other photos to isZoomed false
      for (int n = 0; n < item.length; n++) {
        if (n != i) {
          item[n].photo.isZoomed = false;
        }
      }
      
      // break the looop
      break;
    }
  }
}

