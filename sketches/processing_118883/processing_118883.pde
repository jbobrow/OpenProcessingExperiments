
/* @pjs font="Apercu-Mono.ttf", "Apercu-Italic.ttf", "Apercu-Bold.ttf"; */
Grid grid;
Words words;
/*Random number*/
int number_rdm;

/*All the variables used for the Timer function*/
int time;     
//1000ms=1S
int timeT=1000;
//Time passed
int timePS;
int seconds;                  
int minutes;
int hours;
/*Array of String used to store the Timer Information for hours minutes and seconds */
String[] timer=new String[3];    
/*String wich store all the previous timer array altogether*/ 
String timer2;
/*Variable used to print the letters and setup the grid in the right position*/
int x=0;                        
int ypos=90;
int xpos=5;
/*This two boolen values are used to print the grid and the list of words only when the program start. 
The function is made so that it doesn't cycle*/
boolean print=false;              
boolean print_w=false;
boolean joke;
int cordX;
int cordY;
/*Amazing fonts used for our sketch*/
PFont font;
PFont font2;
PFont font3;
//PFont font4;

void setup(){
/*random number generator (between 1 and 3) */  
  number_rdm=int(random(0, 3)+1); 
/*Create the objects*/  
  grid=new Grid(number_rdm);
  words=new Words();
/*Setup Screen*/  
  size(600,600);
  background(255);
/*Creating the font wich are store in the data folder*/  
  font = createFont("Apercu-Mono.ttf",12);
  font2= createFont("Apercu-Italic.ttf",12);
  font3= createFont("Apercu-Bold.ttf",34);
  //font4= loadFont("Apercu-Bold-34.vlw");
  time=millis();
}
void draw(){
/*A title to the wordsearch "A Hungry Italian's Wordsearch"*/
  noStroke();
  fill(255);
  rect(0,0,600,70);
  fill(0);
  textFont(font3);
  text("A Hungry Italian's Wordsearch",10,45);
  
/*Italian Flag*/  
  fill(220,0,0,200);
  rect(500,10,30,50); 
  fill(0,200,0,255);
  rect(560,10,30,50);
/* End title section*/

/*Call of the Timer function and set up the grid square*/
  timerFunction(); 
  strokeWeight(1);
  stroke(0);
  noFill();
  rect(0, 70, 490, 465);
  noStroke();
  fill(0);
  //textSize(12);
/*Setup of the grid, basically the numbers 1 2 3 match the array inside the Grid 
  class. Number 1 is for the first grid. Number 2 for the second  and number three 
  for the third*/
  if(number_rdm==1){
    grid.printarray();
  }else if(number_rdm==2){
    grid.printarray2();
  }else if(number_rdm==3){
    grid.printarray3();
  }
/*Call the function that prints the list of words on the right*/
  words.printWords();
/*I called this fuction madness, only because it works only if the timer gets to 12.59.59
  Basically it prints a phrare in the Screen asking if the user is joking. Obviously, it is insane 
  to play for 12hours*/
  madness();                   
}
//End of DraW Function
void timerFunction(){
/*time has the values since the setup has been values. These values increase rapidly because are expressed in ms.
timePS store the amount of time passed between the setup call and this moment. If the time passed is higher than timeT it means that
has passed one second.*/
  timePS = millis() - time;     
  if (timePS > timeT) {
    seconds++;
//Every time that one second passes the timer has to be restart    
    time=millis();              
  }
/*After 60 secotes minutes are increased and second restarted. The same for the haours*/  
  if(seconds==60){               
      minutes++;
      seconds=0;
    }
  if(minutes==60){
      hours++;
      minutes=0;
    }
  if(hours==12 && minutes==59 && seconds==59){
      hours=0;
      minutes=0;
      seconds=0;
      joke=true;
    }
/*Since the words are printed only once at the beginning, the timer to print its values has to be update at every cycle. My solution 
has been to create a square arounf the timer, where the background is update at every cycle and the timer can be printed neatly*/
    stroke(255);
    //noStroke();
    fill(255);
    rect(10,550,590,120);          
    fill(0);
/*The timer values are store in Integer variable. To print the timer values I had to use a String. Here I basically convert Integer into an array of String
  and the I join the whole String together so that it becomes only one String that can be very easily printed on the Screen*/
    timer[0]=str(hours);    
    timer[1]=str(minutes);
    timer[2]=str(seconds);
    timer2= join(timer, " : "); 
    textFont(font3);
    textAlign(LEFT);
//This is the String I mentioned previuosly.    
    text("Timer :  "+timer2,10,590);  
}
/*Mouse fuction that store the cordinates of the mouse once the Bottom is pressed*/
void mousePressed(){                   
  cordX=mouseX;
  cordY=mouseY; 
  
} 
/*Function that prent the line. I wanted a straight line from when the mouse left is pressed to when it is released*/ 
void mouseReleased(){                 
  if(mouseButton==LEFT){  
   stroke(0,0,255);
    strokeWeight(3); 
  line(cordX, cordY, mouseX, mouseY);
    }
}
/*This madness Function is that one which become active only when the timer gets to 12.59.59*/
void madness(){                     
  if(joke==true && seconds<=5){
  background(0);
  fill(255);
  //textFont(font, 25);
  text("Are you Joking...?????", 100,270);
  if(seconds==5){
   restart();
    
  }
  }
}
  
/* This is the restart function that it's called after the madness fuction has done its job
   the task of this fuction is to reset every import parameter and call back to the setup function*/
  void restart(){      
  joke=false;
  time=millis();
  //This boolean has to be set to false so that the grid of words and letter can be reprinted
  print_w=false;
  print=false;
  ypos=90;
  xpos=5;
  seconds=0;
  textSize(14);
  setup();
  }





/*Class fo the grid of letters*/
class Grid{
  /*Three array that store the words and the letters*/
  String[] s= new String[30];
  String[] s2=new String[30];
  String[] s3=new String[30];
  
  Grid(int n){
 /* When the object is created we pass the random number. As I explained previously,
   If the values is 1 the first array is called, 2 for the second and three for the third */ 
    switch (n){
      case 1: setarray();
      break;
      case 2: setarray2();
      break;
      case 3: setarray3();
      break;
  }
}
  
  void setarray(){
  s[0]=" S P Z T F S C Y K O D E Y C I V A C O R N E T T O C K O T Q";
  s[1]=" P I E C J F F O T A L M A V P C V G N L Y D H W O K R G Q M";
  s[2]=" A P L P M A S C A R P O N E C O P L P A F P H N M G O M X L"; 
  s[3]=" G U L Q E A P P A R G V I O F S L F U L F O I S X C F A L N";
  s[4]=" H O D Y Z R F L C P K S C R W W D L G J F G N O C C H I P T";
  s[5]=" E O N U V H O I M W I I G K T D P D O X L C Q N O Z R P A R";
  s[6]=" T P A I K Q Q N J D B I E X R E C C A I M U C A U C P R S O"; 
  s[7]=" T Y L W L V P Z I L J G L R W S C T O A K J C K F H S Q R N";
  s[8]=" I P O U I O O I A Y V Q A T W O D J E N T F R E R E D W T A";
  s[9]=" R E W V Q C I I B C I A T L D C J Y B G M H K N D L E F S I";
  s[10]=" Q L M D D B K G C G V C O I U V O B U N O T T Z K A U E G G";
  s[11]=" G S I B C M H V A B Y D W O V M U B U J F A Q B T I W Z M I";
  s[12]=" E O D S Y D Z R V F Q O E V E L G O K S P L G W I H R N K M";
  s[13]=" B Z I A D X I X D O H K K Q W O Q I C I B V B M J G O R X R";
  s[14]=" T F Q V Y V E F T A F P M A V L E A H F O V O R J N T E A A";
  s[15]=" F A B J L M K T A I N O T M T A R K F V T C G R T I N S M P";
  s[16]=" C O S J U K U M Z I I S T T R O B Q I O T V K W P C A F V Z";
  s[17]=" L L T N Z I Q X Z D A C N W T R R K O S E H Q S V O P E Z R";
  s[18]=" N S L K C O F C I P K I E A I N Y V D B R O I U X C A A F E";
  s[19]=" R A M S U R N Y P A Q C B P J F U Q H K A U M L C T J E U C";
  s[20]=" A I O K V Y X R R H B P C E F O J Y K L M D B V V E J W B N";
  s[21]=" Q R S R G D C R O I B A C O Q C R U G V A C V W N U B V N X";
  s[22]=" P I F T Y R Y R E I K M R L S C M K L I R Y M C S M Q G O Z";
  s[23]=" K G H B O J A E Q W G M D M B A Z X Y N P W W I G F M W I I";
  s[24]=" K L P G O R P Z M V A N X Y W C U Y J O I O M N C S W Q F M";
  s[25]=" Q H H H N D A A I G O E O V M I B K X A H A I X E T S Q N E"; 
  s[26]=" Y H R U F U T N G E X P T U K A E J W W R C A F F E P R O H";
  s[27]=" Y Y A P N D F I T V D E N W B S R P D I P G L A Y N E S L J";
  s[28]=" S Z G N W Z O A X E O R O D O M O P T N Q M R F Y V C U T U";
  s[29]=" O T S A P I T N A B P T U K Q N F D Z F B B V A Z M E H H O";
}
void setarray2(){
 s2[0]=" V B V V C W D B Y O M U A V Z G J J E Y N G L N P R H O T O ";
 s2[1]=" U W W E L N J K T N U B Z F E C F L M B N F A F F C N S T F"; 
 s2[2]=" O F H S R V N L I I W G T L I L A E I R N Q X J F A H T X R"; 
 s2[3]=" Y T R L I H O K L L Z H A Q I I Y U H C P E I U I K E L S G"; 
 s2[4]=" J X S N P X L S C O O T U Z H U G T D M F B X G B R W D U P"; 
 s2[5]=" A L O A R P O H A I O G J G Y S K L C C X X I X A A O L C E"; 
 s2[6]=" H R H H P D I U F G E D N O I L G I N O C M F M Z C F W P Q"; 
 s2[7]=" M X Y M P I R Q U A U I Q I R O E V X P R O A Z W Q A E Y V"; 
 s2[8]=" V M O H E R T N A F C P Y Q I K Q R B A C J I K S Z P F X A"; 
 s2[9]=" B M A O P C E N X D C A O K S W Z B P C X P S Z W J Z L F Z"; 
 s2[10]=" U P F F E W C G A S M X Y N T N T V A X R I Z Y F B Z O O E"; 
 s2[11]=" S H D Y R P W B J S K W T M O P G C G M K P Y N E S R D H V"; 
 s2[12]=" G X S Q O V L K W O M B X J R C I E Y I J P A S T A S H Y S"; 
 s2[13]=" G L E B N N D Y Q F A P W D A A N P R S C A Z D D P K T O X"; 
 s2[14]=" J D S W I G Q Y C E D X F A N J F G E L X Z W W A F L P N T"; 
 s2[15]=" Q W I T R A M S W O U E K A T O R A C O L O I G G A M R O F"; 
 s2[16]=" U Z H R U A K E J Q V E O L E M L M C V V J H L A V R L U H"; 
 s2[17]=" Z O I D H J Z F I Q I F J R A X K L C N G E A L Z P P B A H"; 
 s2[18]=" R Y M C C F V Y V Z X Y U R E O C I F O T N I Z P N P I N M"; 
 s2[19]=" S O V A O O X P V K G M Q V G N Q P N T P J O S R F R A P I"; 
 s2[20]=" U O T H S R R H L Z B S K Q R R W H I A L B I C O C C A R H"; 
 s2[21]=" U I G W E C O N I D Z V P Z A O L N N L T T L W C D A X J G"; 
 s2[22]=" P F R X J U A D E O Y O P M Z I V Z Y Z O O H E Q H L N G N"; 
 s2[23]=" M C M Q O K Y R O T I S O Q I G T I R A M I S U M M I F N U"; 
 s2[24]=" B H H W P C Y E P M T Y L L E N Z Q V C H H M M G M E Z N F"; 
 s2[25]=" P R O S C I U T T O O O L P A O D G A G J C G O Q V M S S E"; 
 s2[26]=" G N H Q I W S B A E N P O V W U O B X X X C D O L D A X O Q"; 
 s2[27]=" L H T E N B P O C O M E S F N B Z J Z J G K Q E Q Z Y P U N"; 
 s2[28]=" P D U C I Q O H R C P T O T A Q S D Q V O U K O H X H M F L"; 
 s2[29]=" A O I H K T A X U H J X S Y J H W Y K N I I G E Z T B Q F I"; 
}
void setarray3(){
 s3[0]=" E F X S F Q K D M E M D O S Q O A C A R O T A S A C D G O K"; 
 s3[1]=" J N U G T M O Q X K F W Q J C N N X D A R C A Z I L K T Z J";
 s3[2]=" C N O N I L O I G A F F E X C A T X G E C T Z N O A T N A K"; 
 s3[3]=" O O R P G J J H B V I M A O J I I Z D Z Z I G K B U X S B A"; 
 s3[4]=" O I N T R H P E S F D V L C H G P K H K P H Q C I N H M E M"; 
 s3[5]=" X A O I O A I O O E E S L K O I A M C S I M M C Z S Y H P D"; 
 s3[6]=" C W X Q G Q C C R V Y D P X C M S U K A R I S T O R A N T E"; 
 s3[7]=" O F Z O X L C S Q O I H C M A R T T L A U O B B C R B A N B"; 
 s3[8]=" R P X V I A I F A P D C U K S A O E Y T R C F D K V D D O G"; 
 s3[9]=" N O D W C L Z O J M E O W S H P G M T P O L B T V D Q F A Y"; 
 s3[10]=" E M E I S I E V X U P V M N Z B U F V F H S J S U R G X B O"; 
 s3[11]=" T O A S G X V A O S W M O O R M W W K L S L P G H Y P B T A"; 
 s3[12]=" T S T L Q G I M Y I C S I J P B J J X D O S X V K T S T D L"; 
 s3[13]=" O V A U B D B T T M D V Q E Y D Z H K S T F L L D E E D R U"; 
 s3[14]=" P E X J I I E I Z A R G I V W Z F F T I J B W Q R R P J E F"; 
 s3[15]=" U N O S O O C S S R L O P N U C T N U T C X V Q A J A D G J"; 
 s3[16]=" Q K C C Z Z U O X I C L I F O O P W O T V H M M U Z L I M R"; 
 s3[17]=" I N O R E P E P C T D E R G F O A A U E E K A J G O J K V X"; 
 s3[18]=" E P N L Y J I H J C W P R X G D J Y Q H W W W A K L L G X L"; 
 s3[19]=" I L A L V H U V O Y A H I N V A K U C G N H N W P C Y C P N"; 
 s3[20]=" W Z C P C Y D S V M G Q M J B A M G N A M H Z F G T S Y J N"; 
 s3[21]=" E M H C Q G Y Z A O V O L Q V H H R B P Q W Z C O B R K U G"; 
 s3[22]=" X Q O I A I K N T L K I J C X O Q T O S E I Q P O L L O Z Z"; 
 s3[23]=" W N V I F L H M S O N R O I G N O U B F C E T R I O L O K Z";
 s3[24]=" G L W A N I G B A G B U X G X A Y C X Q O I E J C Q V U U R"; 
 s3[25]=" J Q I E V R R C P E L P W C B H Q X V R J Y A K M A U J F D"; 
 s3[26]=" U T E I A H B T D L I R C B C G C E R V R L Z X O Q B U W E"; 
 s3[27]=" K G I P Q T K P X A Z X U K I H J R X R D A I N Q O Q X T P"; 
 s3[28]=" P W P L B D B W D T Y O T O P D Y R O N D A U E E C L C D H"; 
 s3[29]=" R A Y C I B L V Q O W C Z E V A H J B A H N J C C E Q B J Z";
}
/*Function to print the grid, here it's the same thing: 1 for the first, 2 for the second and 3 for the third array.
  This functions are printed only ath the start*/
void printarray(){
  if(!print){
  for( int u=0; u<grid.s.length; u++){
    for(int h=0; h<grid.s[u].length(); h++){   
      textFont(font, 14);
      textAlign(CENTER);
    text(grid.s[u].charAt(h),xpos,ypos);
     xpos+=8;  
     }
ypos=ypos+15;
xpos=5;
}
}
print=true;
}

void printarray2(){
  if(!print){
  for( int u=0; u<grid.s2.length; u++){
    for(int h=0; h<grid.s2[u].length(); h++){   
      textFont(font, 14);
      textAlign(CENTER);
    text(grid.s2[u].charAt(h),xpos,ypos);
     xpos+=8;  
     }
ypos=ypos+15;
xpos=5;
}
}
print=true;
}

void printarray3(){
  if(!print){
  for( int u=0; u<grid.s3.length; u++){
    for(int h=0; h<grid.s3[u].length(); h++){   
      textFont(font, 14);
      textAlign(CENTER);
    text(grid.s3[u].charAt(h),xpos,ypos);
     xpos+=8;  
     }
ypos=ypos+15;
xpos=5;
}
}
print=true;
}
}
/*Class that stores the list of the words to find. The list is printed on the right of the screen*/
class Words {
  
  String[] w= new String[30];
  
  Words(){
  w[0]="Pizza";
  w[1]="Spaghetti"; 
  w[2]="Pasta";
  w[3]="Buongiorno";
  w[4]="Grazie";
  w[5]="Parmigiano";
  w[6]="Prosciutto";
  w[7]="Formaggio";
  w[8]="Antipasto";
  w[9]="Fagiolino";
  w[10]="Caffe";
  w[11]="Cornetto";
  w[12]="Peperoni";
  w[13]="Gelato";
  w[14]="Foccacia";
  w[15]="Mascarpone";
  w[16]="Pollo";
  w[17]="Cinghiale";
  w[18]="Vino";
  w[19]="Coniglio";
  w[20]="Carota";
  w[21]="Pomodoro";
  w[22]="Albicocca";
  w[23]="Cetriolo";
  w[24]="Ristorante";
  w[25]="Gnocchi";
  w[26]="Amaretto";
  w[27]="Tiramisu";
  w[28]="Grappa";
  w[29]="Funghi";
}
/*Print function that print the array of words to find. Again also this fuction it's calle only at the beginning.*/
void printWords(){
 int y_dist=90;
if(!print_w){
 for( int r=0; r<words.w.length; r++){
   textFont(font2, 15);
   textAlign(RIGHT);
    text(words.w[r], width-10,y_dist);
     y_dist+=15;  
     }
     print_w=true;
}
}
}


