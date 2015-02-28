

import java.util.*;
import java.io.*;

public class Hangman extends PApplet {
    /**
     * @author Matt Prorok
     * basic class to encapsulate a Hangman game--contains the main method
     * 
     */
    private PFont fontA;
    private Hangman_Draw myHangman;
    private Phrase myPhrase;
    private int myScreenDisplay;
    private InputHandler myInputHandler;
    void doNewGame()
    {
       myScreenDisplay=ScreenDisplay.SETUP;
       myInputHandler = new InputHandler();
       myInputHandler.newGame();
       myHangman = new Hangman_Draw(300, 50,this);
        
    }
    public void setup()
    {
        size(400,400);
        smooth();
        
        fontA = loadFont("Consolas-Bold-36.vlw");
        textFont(fontA,24);
        doNewGame();
            
        //myPhrase = InputHandler.initialize(Integer.parseInt(""+key));
        myHangman = new Hangman_Draw(300,50, this);
        
        
    }
    
    public void draw()
    {
        switch(myScreenDisplay){
        case ScreenDisplay.SETUP:{
            background(0,0,0);
            fill(255,255,255);
            textFont(fontA, 18);
            text("1: AFI's Top 100 Movies", 25,50);
            text("2: NFL Teams past and present", 25,75);
            text("3: Rolling Stones Studio Albums", 25, 100);
            if (keyPressed){
                if (key<='9' && key>='0'){
                    myPhrase=myInputHandler.initialize(Integer.parseInt(""+key));
                    myScreenDisplay=ScreenDisplay.GAME;
                    background(255,255,255);
                    myHangman.display();
                }
            }
            break;
        }
        case ScreenDisplay.WIN:{
            long start = System.currentTimeMillis();
            background(0,255,0);
            textFont(fontA, 36);
            fill(0,0,255);
            text("YOU WIN!", 5,150);
            delay(3000);
            doNewGame();
            break;
            
        }
        case ScreenDisplay.GAME:{
            if (myPhrase.isGuessed()){
                    myScreenDisplay=ScreenDisplay.WIN;
                    break;
                }
        if (keyPressed){
            
            if(myInputHandler.isNewGuess(key)){
                myInputHandler.updateGuess(key);
                
                    
                if (myPhrase.contains(key));
                else myHangman.addNextPart();
                
            }
           
        }
      for (int x=1; x<399; x++)
          for (int y=100; y<399; y++)
              set(x,y, color(255,255,255));
      fill(255,0,0);
      textFont(fontA, 18);
      text(myPhrase.display().toUpperCase(), 20,200);
      break;
        }
        }
    }
    
    
    public class Phrase {
    private List<Word> myWords;
    private InputHandler myInputHandler;
    public Phrase(String s, InputHandler inputHandler)
    {
        
        myWords = new ArrayList<Word>();
        String[] words = s.split("\\s+");
        for (String w: words)
            myWords.add(new Word(w, inputHandler));
    }
    
    public String display()
    {
        String display = "";
        for (int k=0; k<myWords.size(); k++){
            if(k%3==1)        
            display+=myWords.get(k).getCurrentWord()+"\n\n";
            else display+=myWords.get(k).getCurrentWord()+"   ";
        }
        
        return display.trim();
    }
    public boolean contains(char ch)
    {
        for (Word word: myWords)
            if (word.getWord().contains(""+ch))
                return true;
        return false;
    }

    public boolean isGuessed() {
        return display().indexOf('_')==-1;
    }
        
public class Word {
    
    private String myWord;
    private InputHandler myInputHandler;
    public Word(String word, InputHandler inputHandler)
    {
       myInputHandler=inputHandler;   
        myWord=word.toLowerCase();
    }
    protected String getWord()
    {
        return myWord;
    }
    public String getCurrentWord()
    {
        String curWord ="";
        for (int k=0; k<myWord.length(); k++)
            if (!myInputHandler.isNewGuess(myWord.charAt(k)) || 
                    myWord.charAt(k)<'a' || myWord.charAt(k)>'z')
                curWord+=myWord.charAt(k)+ " ";
            else curWord+="_ ";
                
        return curWord.trim();
    }
}
}
 


public class InputHandler {
    private String [] NFLTeams = {"New England Patriots","Pittsburgh Steelers","Cleveland Browns"
    ,"New York Jets","Baltimore Ravens","Chicago Bears","New York Giants","Miami Dolphins",
    "Kansas City Chiefs","Denver Broncos","Arizona Cardinals","San Diego Chargers","Indianapolis Colts"
    ,"Houston Texans","San Francisco 49ers","Oakland Raiders","St. Louis Rams","Tampa Bay Buccaneers",
    "Dallas Cowboys","Tennessee Titans","Detroit Lions","Minnesota Vikings","Green Bay Packers",
    "New Orleans Saints","Carolina Panthers","Washington Redskins","Buffalo Bills",
    "Philadelphia Eagles","Seattle Seahawks","Cincinnati Bengals","Baltimore Colts",
    "Los Angeles Rams","Houston Oilers"};

    private String[] AFI = {"Citizen Kane","The Godfather","Mr Smith Goes to Washington","Goodfellas","Saving Private Ryan","The Shawshank Redemption","To Kill a Mockingbird","Casablanca","Psycho","The Graduate","Gone With The Wind","The Wizard of Oz","Schindler's List","Star Wars","Raging Bull","Singin' in the Rain","Lawrence of Arabia","Vertigo","The Wizard of Oz","City Lights","The Searchers","2001: A Space Odyssey","Sunset Boulevard","The General","On the Waterfront","It's a wonderful Life","Chinatown","Some Like it Hot","The Grapes of Wrath","E.T. the Extra-Terrestrial","High Noon","All About Eve","Double Indemnity","Apocalypse Now","The Maltese Falcon","The Godfather Part II","One Flew Over the Cuckoo's Nest","Snow White and the Seven Dwarfs","Annie Hall","The Bridge on the River Kwai","The Best Years of our Lives","The Treasure of the Sierra Madre","Dr. Strangelove","The Sound of Music","King Kong","Bonnie and Clyde","Midnight Cowboy","The Philadelphia Story","Shane","It happened One Night","A Streetcar Named Desire","Rear Window","Intolerance","The Lord of the Rings: The Fellowship of the Ring","West Wide Story","Taxi Driver","The Deer Hunter","MASH","North by Northwest","Jaws","Rocky","The Gold Rush","Nashville","Duck Soup","Sullivan's Travels","American Graffiti","Cabaret","Network","The African Queen","Raiders of the Lost Ark","Who's Afraid of Virginia Woolf?","Unforgiven","Tootsie","A Clockwork Orange","Butch Cassidy and the Sundance Kid","The Silence of the Lambs","In the Heat of the Night","Forrest Gump","All the President's Men","Modern Times","The Wild Bunch","The Apartment","Spartacus","Sunrise: A song of Two Humans","Titanic","Easy Rider","A Night at the Opera","Platoon","12 Angry Men","Bringing Up Baby","The Sixth Sense","Swing Time","Sophie's Choice","The French Connection","Pulp Fiction","The Last Picture Show","Do the Right Thing","Blade Runner","yankee Doodle Dandy","Toy Story","Ben-Hur"
    };
    private String[] Stones = {"The Rolling Stones","The Rolling Stones, Now!",
    "Out of Our Heads","England's Newest Hit Makers","December's Children (And Everybody's)",
    "Aftermath","Between the Buttons","Their Satanic Majesties Request","Beggars Banquet",
    "Let it Bleed","Sticky Fingers","Exile on Main St.","Goats Head Soup","It's Only Rock n' Roll",
    "Black and Blue","Some Girls","Emotional Rescue","Tattoo You","Undercover","Dirty Work",
    "Steel Wheels","Voodoo Lounge","Bridges to Babylon","A Bigger Bang"};
    private Set<Character> myGuessedChars = new HashSet<Character>();
    private Map<Integer, String[]> myFiles = new HashMap<Integer, String[]>();
    private Phrase myPhrase;
    
    public InputHandler()
 {
        myFiles.put(1, AFI);
        myFiles.put(2, NFLTeams);
        myFiles.put(3, Stones);
 }   
    public void newGame()
    {
        myGuessedChars.clear();
    }
    public void updateGuess(char guess)
    {
        guess=(""+guess).toUpperCase().charAt(0);
        
        myGuessedChars.add(guess);
        String toDisplay = myPhrase.display();
        
    }
    
    public Phrase initialize(int n) 
    {
     
       String[] possibilities = myFiles.get(n);
            
        myPhrase = new Phrase(possibilities[new Random().nextInt(possibilities.length)], this);
        return myPhrase;
    }
    
    public boolean isNewGuess(char ch)
    {
        return (ch >='a' && ch <='z')&&!(myGuessedChars.contains((""+ch).toUpperCase().charAt(0)));
    }
   


}  
public class ScreenDisplay {
  public static final int SETUP=0;
  public static final int GAME=1;
  public static final int WIN=2;
}

public class Hangman_Draw  {
    
    private int xDraw, yDraw;
    private int myX, myY;
    private int numBodyParts;
    private PApplet parent;
    private Hangman myHangman;
    private InputHandler myInputHandler;
    public Hangman_Draw(int x, int y, Hangman p)
    {
        myX=x;
        myY=y;
        myHangman=p;
        parent=myHangman;
       
        xDraw=x+20;
        yDraw=y+10;
        numBodyParts=0;
        display();
    }
    
    public void display()
    {
        parent.fill(0,0,0);
        parent.line(myX,myY,myX,myY+50);
        parent.line(myX,myY,myX+20,myY);
        parent.line(myX+20,myY,myX+20,myY+10);
    }
    
    public void addNextPart()
    {
        switch(numBodyParts){
        case 0: {
            parent.fill(255,255,255);
            parent.ellipse(xDraw,yDraw+5,10,10);
            yDraw+=10;
            break;
        }    
        case 1: {
            parent.line(xDraw, yDraw, xDraw, yDraw+15);
            yDraw+=15;
            break;
        }
        case 2: {
            parent.line(xDraw, yDraw, xDraw-10, yDraw-2);
            break;
        }
        case 3: {
            parent.line(xDraw, yDraw, xDraw+10, yDraw-2);
            break;
        }
        case 4: {
            parent.line(xDraw, yDraw, xDraw-6, yDraw+12);
            break;
        }
        case 5: {
            parent.line(xDraw, yDraw, xDraw+6, yDraw+12);
            break;
        }
        case 6: {
            numBodyParts=-1;
            xDraw=myX+20;
            yDraw=myY+10;
            parent.fill(0,255,255);
            parent.text("YOU LOSE", 100, 100);
            parent.delay(3000);
            myHangman.doNewGame();
            break;
        }
        
        }
    numBodyParts++;
    }
    
    
}
}

