
import com.getflourish.stt.*;
STT stt;
String intro;
String global_txt;
int counter;

//an array list of all the "uttered phrases" can only hold type Utter
ArrayList<Utter> utterances;


//"Uttered Phrases" object
//Utter iUtter;

void setup () {
  size(800, 400);

  // Init STT with default manual record mode
  stt = new STT(this);
  stt.enableDebug();
  stt.setLanguage("en");

  //create/initialize an empty array list
  utterances=new ArrayList<Utter>();
  //iUtter=new Utter("Hold down any key and speak.");
  //utterances.add(iUtter);

  //println(utterances.size()); 
  //iUtter.display();
  //utterances.get(i)iUtter.display;
}

void draw() {
  background(0);
  displayAllUtterances();
  counter = counter + 1;  // increment the counter
  //if counter mod 4 is equal to 0, it is divisible by 4 
  if ((counter%4)==0) {
    fadeAllUtterances();
  } 
  //display one object
}

//method is called if transciption is successful, Also add to array
void transcribe (String txt, float confidence) {
  global_txt=txt;
  Utter newUtterance = new Utter(txt);
  //println(txt);


  String[] words= txt.split(" ");
  boolean isRed = false;
  //println(words.length);
  for (int i=0;i<words.length;i++) {
    //print(words[i]);
    if ((words[i].equals("like"))||(words[i].equals("um"))) {
      
      isRed=true;
  //we're done, exit the array
      i=words.length;
    }
  }
  if (isRed==true) {
    println("red");
    //fill value applied to particular new utterance object...
    //fill in new values (default in constructor)
  newUtterance.b=0;
  newUtterance.g=0;
  }
  //adding new (modified) utterance to the list array
  utterances.add(newUtterance);
}


//display all utterances
void displayAllUtterances() {
  for (int i=0;i<utterances.size(); i++) { 
    //cast the object coming out of the array
    //  println(i);
    //displays each word in array list
    utterances.get(i).display();
  }
}

//display all utterances
void fadeAllUtterances() {
  for (int i=0;i<utterances.size(); i++) { 
    //cast the object coming out of the array
    //  println(i);
    //displays each word in array list
    Utter thisUtterance = utterances.get(i);
    float thisLife = thisUtterance.life;
    //if it's still alive, fade. If its' not still alive, remove.
    if (thisLife > 0) {
      thisUtterance.life = thisUtterance.life - 1;
    }
    else {
      utterances.remove(i);
    }
  }
}


// Use any key to begin and end a record
void keyPressed () {
  stt.begin();
}
void keyReleased () {
  stt.end();
}


