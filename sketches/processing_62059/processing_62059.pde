
PFont f;
PImage upHouse;
float y;
  String[] arr = {"Stephen's APCS Final","Class of 2012","Thank you for everything Mr.Ferraro"+"\n"+"You made Balboa fun for me.","I learned a lot from you." +"\n" +
                   "more than just CS or math.","Keep in touch, I'll visit if I can.","CS got swaaaaaaaaag",
                  "This is a story about 4 people named","Everybody, Somebody, Anybody, and Nobody",
                  "There was an important job to be done and","Everybody was sure Somebody would do it","Anybody could have done it, but Nobody did it",
                  "Somebody got angry about that because it was Everybody's job", "Everybody thought Anybody could do it", "but Nobody realized that Everybody wouldn't do it.",
                  "It ended up that Everybody blamed Somebody","when Nobody did what Anybody could have done." + "\n" + "True Story.","yu mo gui gwai fai di jou","You Only Live Once",
                  "That's the motto, ninja YOLO","I'm out here tryna f(x)","Batter Up",
                  "BACON STRIPS&","BACON STRIPS&" + "\n"+"BACON STRIPS&",
                  "We don't dooo thattt hereee","AYYYYYY NAKOOOOO","!Xobile", "Only the Avatar, master of all 4 elements,"+ "\n" + "could stop them.","A man needs his rest.","Be the leaf!","MY CABBAGES!", "I don't hate you" +"\n" + "I don't hate you too!",
                  "If they only knew" + "\n" + "the girl with the tattoo.","Fancy, but not too fancy.","soft kitty, warm kitty","little ball of fur","happy kitty, sleepy kitty","purr purr purr",
                  "How you doin' ; )","Damnit they took my kidney","I was hiding under your porch because I love you.","Now, you must wear the cone of shame","Legen-wait for it... DARY,", "LEGENDARY",
                  "You unlock this door with the key of imagination","beyond it is another dimension, a dimension of sound,",
                  "a dimension of sight, a dimension of mind.","you are moving into a land of both shadow and substance",
                  "of things and ideas","you just crossed over into the Twilight Zone",
                  "I am Linsane.","I'm Awesome.", "Non Timebo Mala","Avada Kedrava!", "A long time ago, in a galaxy far far away...","It is a period of civil war",
                 "rebel spaceships, striking from a hidden base," , "have won their first" + "\n" +
                  "victory against the evil Galactic Empire.",
                  "Making my way downtown, walking fast, faces past and I'm home bound...",
                  "You never know the weight of your crimes.","God made man and his reason.",
                  "A neutron walks into a bar and said","\"I'd like a beer, please\"", "After the bartender gave him one, he said",
                  "\"How much will that be?\"" ,"\"For you?\" said the bartender" + "\"No Charge.\"",
                  "To be or not to be," + "\n" + "That is the question","sometimes, you have to give up on people.","not because you don't care but because they don't.",
                  "smelly cat, smelly cat what are they feeding you?","smelly cat, smelly cat it's not your fault",
                  "trevor the troll","this is a typing game,"+" punctuation matters..!" + "\n" + "and newlines too!" +"\n" +
                "So does CAPITALIzATION!","you get 5 points for every right character"+"\n"+"100 points for the sentence" +"\n" + "but if you don't finish you lose a life."};
int index = 71;
int textSize;
int points;
int lives=25;
int curIndex = 0;
int counter = 0;
String result = "";
float i = 0.25;
int inc = 1;

void setup() {
  //frameRate(speed);
  size(600,600);
  f = loadFont("AgencyFB-Bold-48.vlw");
  y = 20;
  textAlign(LEFT);
}

 void draw(){
   textSize =20;
   int random = int(random(arr.length - 1));
   background(254);
   upHouse = loadImage("upparadisefalls2.jpg");
   image(upHouse,192/2,0);
   textFont(f,textSize);
   fill(0);
   textAlign(LEFT);
   fill(0,200,100);
   text("Points: "+points,width - textWidth("Points: " + points),textSize);
   fill(0,100,200);
   text("Lives: "+lives,width - textWidth("Lives: " + lives),2 * textSize);
   fill(0);
   text(arr[index],width/12,y);
   fill(200,20,0);
   text(arr[index].substring(0,curIndex),width/12,y);
  
   y = y+i;
 
   int a = textSize;
   if( y > height + textSize){
     
     println("This is i: " + i);
      reset();
   }
    if(lives < 0){
      gameOver();
     }
 }
 
 void keyPressed() {
     String s = arr[index];
   
     if(keyPressed){
       if(key == s.charAt(curIndex)) {
         curIndex++;
         points = points + 5;
         result = "" + key;
       }
      if(keyPressed && curIndex >= s.length()){
         if(keyPressed)
         counter++;
         if(counter==0|| counter ==1){
         curIndex = curIndex-1;
         lives = lives + 1;
         points = points + 100;
         reset();
         }else {         
           curIndex = curIndex-1;
           points = points - 5;      
         }
     }   
   } 
 }
 void reset(){
     inc++;
     i = i + (1.000000005/inc);
     y = 1;
     index = (index+1) % arr.length;
     lives = lives-1;
     curIndex = 0;
     counter = 0;
     result = "";
 }
 
 void gameOver() {
   textFont(f,50);
   fill(255,0,0);
   textAlign(CENTER);
   text("YOU LOSE",width/2,height/4);
   text("Thank You for playing" + "\n"+"Falling Strings",width/2, height/2);
   noLoop();
  }


