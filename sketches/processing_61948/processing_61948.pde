
PFont f;
PImage upHouse;
float y;
  String[] arr = {"APCS Final","CS got swaaaaaaaaag","yu mo gui gwai fai di jou","That's the motto, ninja YOLO","I'm out here tryna f(x)",
                  "2 Fast, 2 Furious","!Xobile", "A man needs his rest.","Be the leaf!","MY CABBAGES!", "I don't hate you" +"\n" + "I don't hate you too!",
                  "If they only knew..." + "\n" + "the girl with the tattoo, like I do","Fancy, but not too fancy.","Soft Kitty, Warm Kitty","Little ball of fur","Happy Kitty, Sleepy Kitty, purr purr purr",
                  "How you doin' ; )","Sick of tea? That's like being sick of breathing!","I was hiding under your porch because I love you.","Now, you must wear the cone of shame",
                  "You unlock this door with the key of imagination","beyond it is another dimenstion, a dimension of sound," + "\n" +
                  "a dimension of sight, a dimension of mind.","you're moving into a land of both shadow and substance",
                  "of things and ideas, you just crossed over into the Twilight Zone", "Well of course I know its wrong to kill, but who told you?" + "\n" + "I.Told.Me.",
                  "EveryBODY has a Dexter inside...", "Non Timebo Mala","Avada Kedrava!","You're staying? This isn't a democracy anymore.",
                  "This is a little story about four people named Everybody, Somebody, Anybody, and Nobody",
                  "There was an important job to be done and Everybody was sure Somebody would do it","Anybody could have done it, but Nobody did it",
                  "Somebody got angry about that because it was Everybody's job", "Everybody thought Anybody could do it, but Nobody realized that Everybody wouldn't do it.",
                  "It ended up that Everybody blamed Somebody when Nobody did what Anybody could have done." + "\n" + "True Story.",
                  "What the... How did you know? I love this song!" + "\n" + "Making my way downtown, walking fast, faces past and I'm home bound...",
                  "You never know the weight of your crimes.","God made man and his reason.",
                  "To be or not to be," + "\n" + "That is the question","sometimes, you have to give up on people." + "\n" +"not because you don't care but because they don't.",
                  "A long time ago, in a galaxy far far away..." + "\n" + "It is a period of civil war" + "\n" +
                 "rebel spaceships, striking from a hidden base," , "have won their first" + "\n" +
                  "victory against the evil Galactic Empire.", "smelly cat, smelly cat it's not your fault","trevor the troll","this is a typing game","punctuation matters..!" + "\n" + "and newlines too!",
                "So does CAPITALIzATION!", "5 points for every right character","100 points for the sentence and don't lose a life", "but if you don't finish you lose a life."};
int index = 43;
int textSize;
int speed = 30;
int points;
int lives=15;
int curIndex = 0;
int counter = 0;
String result = "";

void setup() {
  frameRate(speed);
  size(600,600);
  f = loadFont("AgencyFB-Bold-48.vlw");
  y = height;
  textAlign(LEFT);
}

 void draw(){
   textSize =20;
   int random = int(random(arr.length - 1));
   background(254);
   upHouse = loadImage("upparadisefalls2.jpg");
   image(upHouse,250,100);
   textFont(f,textSize);
   fill(0);
   textAlign(LEFT);
   text("Points: "+points,width - textWidth("Points: " + points),textSize);
   text("Lives: "+lives,width - textWidth("Lives: " + lives),2 * textSize);
   text(arr[index],width/11,y);
   fill(200,20,0);
   text(arr[index].substring(0,curIndex),width/11,y);
 
   y = y+1;
 
   int a = textSize;
   if( y > height + textSize){
     y = textSize;
     speed = speed + 2;
     frameRate(speed);
     index = (index+1) % arr.length;
     lives = lives-1;
     curIndex = 0;
     counter = 0;
     result = "";
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
         }else {         
           curIndex = curIndex-1;
           points = points - 5;      
         }
     }   
   } 
 }
 
 void gameOver() {
   textFont(f,50);
   fill(255,0,0);
   text("YOU LOSE",width/2,height/2);
   noLoop();
 }

