
import controlP5.*;
ControlP5 controlP5;
//image at top
PImage hiylow;
//buttons for easy medium and hard   
controlP5.Button Easy,Medium,Hard;
//area where high scores are displayed
Textarea myTextarea;
//buttons to play again and view high scores
controlP5.Button playAgain,highScores;
//choice of easy/medium/hard, user input, computer output; if the string is warm,reader
String xchoice,guees,warms,output2,line,readerz;
//area for user to type guess and name
Textfield guess,namee;
//area where computer output and warm strings are displayed
Textlabel output,warm;
//whether or not the menu should be showing
boolean menu;
//the user of the input, the random number, the maximum number, the score, the round that the 
//user is playing, the amount that the score is multiplied by, whether the highscores should be viewed and the level
int input,rnum,maxNum,score,rounds,multiplier,view=0,level=0;
//the thing that reads the text in the high score document
BufferedReader reader;
//an arraylist for the scores, one to store decrypted variables and one to store encrypted objects
ArrayList scores,decoder,encoder,decoder1;

void setup(){
    size(250,300);
    background(255);
    smooth();
    frameRate(30);
    int score = 0;
    scores = new ArrayList();
    decoder = new ArrayList();
    decoder1 = new ArrayList();
    encoder = new ArrayList();
    controlP5 = new ControlP5(this);
    hiylow = loadImage("Capture.GIF");
    Easy = controlP5.addButton("Easy",0,40,70,80,20); 
    Easy.setId(1);
    Medium = controlP5.addButton("Medium",0,40,90,80,20);
    Medium.setId(3);
    Hard = controlP5.addButton("Hard",0,40,110,80,20);
    Hard.setId(4);
    guess = controlP5.addTextfield("guess",40,85,50,20);
    guess.setId(2);
    guess.hide();
    namee = controlP5.addTextfield(" ",40,60,50,20);
    namee.setId(25);
    namee.hide();
    output2="Hi!";
    menu = false;
    warms = "You're Warm!";
    playAgain = controlP5.addButton("Play Again",0,40,85,50,20);
    playAgain.setId(5);
    playAgain.hide();
    rounds = 0;
    highScores = controlP5.addButton("View high scores",0,20,150,120,19);
    highScores.setId(6);
    //beginning
      /* try{

                       
			BufferedReader fin =createReader("highscores.txt"); 
			String line;
			int character;
			char c;
                        System.out.println("Line by line output:");
			
                    for (int u=0;u<10;u++){
                        line = fin.readLine();
                         decoder.add(line);}

                          
			fin.close();
	}

		catch(Exception e){ System.out.println(e);
            }
            String current;
            String decryptit;
            int dchar;
            for (int y =0;y<decoder.size();y++){
             decryptit="";
             current=(String)decoder.get(y);
            for(int l = 0;l<current.length();l++){
             dchar = (int)current.charAt(l);
             dchar-=5;
             decryptit+=((char)dchar+"");
           }
            println(decryptit);
            decoder1.add(decryptit);
            }
            try{
         PrintWriter decrypt;		                       
         decrypt = createWriter("highscores.txt");  
         for(int j =0;j<decoder.size();j++)
         
         decrypt.println(decoder1.get(j));
         decrypt.flush();
         decrypt.close();
         println(decoder1.get(0));
         println(decoder1.get(3));
         println("test");
         
       }
       catch(Exception e){ System.out.println(e);
       }
         try{        
                BufferedReader fin =createReader("highscores.txt"); 
          			String line;
          			int character;
          			char c;
                                  System.out.println("Line by line output:");
          			line = fin.readLine();
                                   while (line != null)
          			{				
          				StringTokenizer st = new StringTokenizer(line, "*" );
          				while (st.hasMoreTokens()) {
                                            Highscore real = new Highscore();
                                            readerz =st.nextToken();
                                            real.score = (int)Double.parseDouble(st.nextToken());
                                            readerz =st.nextToken();
                                            real.name = (st.nextToken());
                                            readerz =st.nextToken();
                                            real.d = (int)Double.parseDouble(st.nextToken());
                                            readerz =st.nextToken();
                                            real.m = (int)Double.parseDouble(st.nextToken());
                                            readerz =st.nextToken();
                                            real.y = (int)Double.parseDouble(st.nextToken());
                                            scores.add(real);
                                          }
                                          }
         } 
         catch(Exception e){ System.out.println(e);
       }
//end*/
for (int m=0;m<10;m++){
  Highscore ir = new Highscore();
  scores.add(ir);
}
   myTextarea= controlP5.addTextarea("dascores",""+scores.get(0)+"\n"+scores.get(1)+"\n"+scores.get(2)+"\n"+scores.get(3)+"\n"+scores.get(4)+"\n"+scores.get(5)+"\n"+scores.get(6)+"\n"+scores.get(7)+"\n"+scores.get(8)+"\n"+scores.get(9)+"\n",1,180,220,60);
    myTextarea.setColor(0xff0000);
    myTextarea.hide();
    }
void draw(){
    fill(255);
    rect(0,0,250,300);
    image(hiylow,-30,-30);
}

public void Hard(int theValue){
  xchoice = "Hard";
}
public void Medium(int theValue){
  xchoice = "Medium";
}
public void Easy(int theValue){
  xchoice = "Easy";
}

public void controlEvent(ControlEvent theEvent) {
  println(theEvent.controller().name());
  switch(theEvent.id()){
    case(1):
    case(3):
    case(4):
      Hard.hide();
      Medium.hide();
      Easy.hide();
      guess.show();
      menu=true;
    break;
  }
  switch(theEvent.id()){
    case(1):
      output2= "Guess a number from 1-10";
      level=1;
       output = controlP5.addTextlabel("label",output2,20,134);
       output.setColorValue(color(0));
       maxNum=10;
       multiplier = 100;
       Random gen = new Random();
       rnum = gen.nextInt(maxNum-1)+1;
    break;
    case(3):
      output2="Guess a number from 1-100";
      level=2;
      output = controlP5.addTextlabel("label",output2,20,134);
      output.setColorValue(color(0));
      maxNum=100;
      multiplier = 10;
      gen = new Random();
      rnum = gen.nextInt(maxNum-1)+1;
    break;
    case(4):
      output2="Guess a number from 1-1000";
      level=3;
      output = controlP5.addTextlabel("label",output2,20,134);
      output.setColorValue(color(0));
      maxNum=1000;
      multiplier = 1;
      gen = new Random();
      rnum = gen.nextInt(maxNum-1)+1;
    break;
    case(2):
      score++;
      println(theEvent.controller().stringValue());
      input = (int)Double.parseDouble(theEvent.controller().stringValue());
      if((input<0)||(input>maxNum)){
        controlP5.remove("label");
        output2 = ("Please enter a value in the range 1-"+maxNum);
        output = controlP5.addTextlabel("label",output2,20,134);
        output.setColorValue(color(0));
     }
     else if (input>rnum){
       controlP5.remove("label");
       output2 = ("Go Lower!");
       output = controlP5.addTextlabel("label",output2,20,134);
       output.setColorValue(color(0));
       if ((input-(maxNum/10)<=rnum)){
         controlP5.remove("warm");    
         warm = controlP5.addTextlabel("warm",warms,20,125);
         warm.setColorValue(color(0));
       }  
     }
     else if (input<rnum){
       controlP5.remove("label");
       output2 = ("Go Higher!");
       output = controlP5.addTextlabel("label",output2,20,134);
       output.setColorValue(color(0));
       if ((input+(maxNum/10)>=rnum)){
         controlP5.remove("warm");
         warm = controlP5.addTextlabel("warm",warms,20,125);
         warm.setColorValue(color(0));
       }  
     }
     else if (input==rnum){
       controlP5.remove("label");
       score*=multiplier;
       warms = "Your score is "+score+", congrats!";
       controlP5.remove("warm");
       warm = controlP5.addTextlabel("warm",warms,20,125);
       warm.setColorValue(color(0));
       output2 = ("You got it!, Good Job!");
       namee.show();
       output2 = ("You made the high score list! \nPlease enter your name.");
     }
     break;
     case(25):
       Highscore z = ((Highscore)scores.get(9));
       if(z.score>score)
         output2 = ("You made the high score list! \nPlease enter your name in the top box.");
       else
         output2 = ("Sorry, you didn't make the high score list this time! Enter your name anyway to play again.");
       output = controlP5.addTextlabel("label",output2,20,134);
       output.setColorValue(color(0));
       guess.hide();
       namee.hide();
       String playername = (theEvent.controller().stringValue());
       playername=playername.replaceAll(" ", "");
       println(playername);
       playAgain.show();
       Highscore n = new Highscore(playername,score,day(),month(),year());
       println(n);
       for(int j=0;j<scores.size();j++){
         println("test2");
         println("test3");
         Highscore a = ((Highscore)scores.get(j));
         if(a.score>score){
           scores.add(j,n);
           println("testerrrr!");
           j=scores.size();
           for(int i = 0;i<10;i++)
           println(scores.get(i));
         }  
        }
       //beginnin
       ArrayList encoder = new ArrayList();
         for(int h = 0;h<scores.size();h++){
           Highscore ehs = (Highscore)scores.get(h);
           String highskor = (ehs+"");
           int echar;
           String ehighskor="";
           for(int l = 0;l<highskor.length();l++){
             echar = (int)highskor.charAt(l);
             echar+=5;
             ehighskor+=((char)echar+"");
           }
           encoder.add(ehighskor);
          }
     //end
      /* try{
         PrintWriter fout;		                       
         fout = createWriter("highscores.txt");  
         for(int j =0;j<10;j++)
         fout.println(encoder.get(j));
         fout.flush();
         fout.close();
         println("test");
         rounds++;
       }
       catch(Exception e){ System.out.println(e);
       } */
    break;
    case(5):
      Easy.show();
      Medium.show();
      Hard.show();
      playAgain.hide();
      controlP5.remove("warm");
      controlP5.remove("label");
      warms = "You're Warm!";
      score=0;
    break;
    case(6):
      view++;
      if(view%2==0)
        controlP5.remove("dascores");
      else
         myTextarea= controlP5.addTextarea("dascores",""+scores.get(0)+"\n"+scores.get(1)+"\n"+scores.get(2)+"\n"+scores.get(3)+"\n"+scores.get(4)+"\n"+scores.get(5)+"\n"+scores.get(6)+"\n"+scores.get(7)+"\n"+scores.get(8)+"\n"+scores.get(9)+"\n",1,180,220,60);
          myTextarea.setColor(0xff0000);
    break; 
}
}


