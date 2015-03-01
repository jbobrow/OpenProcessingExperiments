
PFont f;                          //  Declare PFont variable
String[] words = { 
 "love","αγαπη","laughter","γέλιο", "hurt", "πόνος","στριφνός", "grumpy", "chair", "cry" , "μέλλον", "future",  
 "βαλβίδα", "valve", "καρέκλα", "κλάμα", "καταιγίδα","storm", "κύμα", "wave", "κενό", "gap", "train", "τρένο", 
 "τρυφερότητα", "tenderness", "στοργή", "affectionate", "fuck this shit", "αι στο διάολο", "mucus", "βλέννα",
 "διάρροια", "diarrhea", "good luck", "καλή τύχη", "vitality", "ζωτικότητα", "σαράβαλο", "crock", "φως", "light",
 "black", "μαύρο", "φρούτα", "fruits", "vibration", "δόνηση", "απίστευτο", "unbelievable", "reliable", "αξιόπιστη",
 "σώμα", "body", "cunt", "μουνί", "όμορφο", "beautiful", "μνήμη", "memory", "αφοσίωση", "dedication","λαγνεία", "lust",
 "λησμονιά", "forgetfulness", "στασιμοτητα", "stagnation", "detached", "απόμακρος", "impulsive", "παρορμητική", 
 "inflexible", "άκαμπτη", "vague", "ασαφής", "irony", "ειρωνεία", "truth", "αλήθεια", "stupid", "ηλίθιο", "creative", 
 "δημιουργικές", "emotional", "συναισθηματικός", "powerful", "ισχυρό", "self-confidence", "αυτοπεποίθηση", "sympathetic",
 "συμπονετικός","sweet"

 
  };

int index = int(random(words.length));  

int time;
int timeDelay;


void setup() {
  size(800,800);
  f = createFont("Arial",30,true); // Create Font
  time = millis();
  timeDelay = 2000;

 
}

boolean keyWasPressed = true;

void draw() {
  background(51);
  int index = int(random(words.length)); 
  if (millis()>time+timeDelay && keyWasPressed == true){
    
    textFont(f,60);                 //  Specify font to be used
    fill(255, 204, 0);                        // Specify font color 
    textAlign(CENTER);
    text(words[index],width/2,height/2);
    
    println(words[index]);
    keyWasPressed = false;
    
  }
      

}

  




void keyPressed(){
      
    if (key == 'l'){
       println("positive+4");
       loop();
    }
    
    else if (key == 'k'){
       println("positive+3");
       loop();
    }
     else if (key == 'j'){
       println("positive+2");
       loop();
    }
     else if (key == 'h'){
       println("positive+1");
       loop();
    }
     
     else if (key== 'g'){
       println("neutral");
       loop();
     }
     
    else if (key== 'f'){
       println("negative-1");
       loop();
     }
    
     else if (key== 'd'){
       println("negative-2");
       loop();
     }
     
      else if (key== 's'){
       println("negative-3");
       loop();
     }
     
     else if (key== 'a'){
       println("negative-4");
       loop();
     }
     time = millis();
     keyWasPressed = true;
}


  
/*Class results{
  //Global variabes
  float x = 0;
  float y= 0;
  
  
  
  
  //Constructor - how do you build the class
  results(){
  
  }
  
  // functions
  
  void display(){
    ellipse(200,200,20,20);
  
  
  
}
 */


