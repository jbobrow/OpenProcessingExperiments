
//129011 words
//drawing constant
int header = 90;

Trie tree;
String qry="oy";
int editDist=1;

void setup() {
  size(500,500);
  fill(200,200,200);
  noStroke();
  rect(0,0,width,height);
  //background(255,255,255);
  tree = new Trie();
  addAllWords(tree);
  text("Yo",110,110); //force to make a font
}


public void draw() {
  fill(200,200,200);
  rect(389,0,width-389,header);
  
  fill(0,0,0);
  rect(0,header,width,3);
  textSize(20);
  text("Max Edit Distance:",210,30);
  text("Enter a word:",35,30);
  
  
  
  //if (!newQry.equals(qry) || editDist!=newEditDist) {
   //  editDist=newEditDist;
   //  qry = newQry;
   if (true) {
     long startTime = System.nanoTime();
     HashMap<String,Boolean> recs = tree.findAll(qry, editDist);
     long endTime = System.nanoTime();
     float duration = (endTime - startTime)/1000000.0;
     textSize(12);
     
     fill(200,200,200);
     rect(0,0,width,height);
     
     fill(0,0,0);
     text("Searched about 130,000 words in ", 190, header-30);
     text(duration + " milliseconds", 220, header-10);
     int y=header+25;
     int x=20;
     for (String rec : recs.keySet()) {
        
        if (y>height-5) {y=header+25; x+=115;}
        if (x>width-100) break;
        text(rec, x, y);
        y+=25;
     }
  }
  
}


void addAllWords(Trie tree){
  String[] letters = new String[]{"A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z"};
  for (int i=0; i<letters.length; i++) {
    addWords("Words/"+letters[i]+" Words.txt", tree);
  }
}

void addWords(String filepath, Trie tree) {
  BufferedReader reader = createReader(filepath);
  String line;
  while (true) {
    try {
      line = reader.readLine();
    } catch (IOException e) {
      e.printStackTrace();
      line = null;
    }
    if (line == null) {
      return;
    } else {
      tree.insert(line);
    }
 }
  
}

//Dictionary Trie as described above
//ACTIONS



final int REMOVE=-1;
final int ADDITION=1;
final int SAME=0;
final int CHANGE=2;
final int START=3;

class Trie {
    LetterNode root;
    public Trie(){
        String emptyStr = ""; 
        root = new LetterNode(emptyStr);
    }

    //Add a word && its freuquency to dictionary
    public void insert(String str){
       root.insert(str.toLowerCase(), str, 0);
    }

    //Returns a sorted unique list of all words in the dictionary with a distance to query <= maxDistance
    public HashMap<String,Boolean> findAll(String query, int maxDistance){
        HashMap<String,Boolean> suggestions = new HashMap<String,Boolean>();
        root.recommend(query.toLowerCase(), maxDistance, START, suggestions); 
        return suggestions;
    }
    
  //A node in a dictionary tree is a letter
  //Leaf nodes && some intermediary nodes represent Words
  //For speed, all letters are lowercased when inserting a word into a tree
  class LetterNode {
      String letter;
      Word word;
      ArrayList<LetterNode> pointers;
      public LetterNode (String c){
          pointers=new ArrayList<LetterNode>(); //the list of children nodes (the next chars in a word from the frequency data)
          letter=c;
          word=null;
      }
  
      public boolean charIs(String c){
          return letter.equals(c);
      }
  
      public void insert(String str, String strUpper, int depth){
          if (depth<str.length()) {
              //we need to continue down the tree
              String c = str.substring(depth,depth+1);
              for (LetterNode next : pointers){
                  if (next.charIs(c)){
                      next.insert(str, strUpper, depth+1);
                      return;
                  }
              }
              //we havent found the pointer, start a new branch in dictionary tree
              LetterNode nextNode = new LetterNode(c);
              pointers.add(nextNode);
              nextNode.insert(str, strUpper, depth+1);
              return;
          }
          //we've made it to our end node
          else {
              word= new Word(strUpper);
          }
      }
  
      // As we decend the Trie, we edit the query as needed to match the path of the Trie we are decending.
      // Each traversal keeps track of the how many edits have been used so far
      //     If a traversal has used too many edits, that traversal ends
      //     If we arrive at word && we have matched or edited ALL of the characters in the query, we suggest the word in the Trie.
      // Due to the fact that some combinations of actions are equivalent, this function will lead to few repeated recommendations (which are removed later on)
      public void recommend(String query, int movesLeft, int lastAction, HashMap<String,Boolean> suggestions) {
          int length = query.length();
  
          //BASE CASE (includes pruning tail-end of query)
          if (length>=0 && movesLeft-length>=0 && word!=null){
              suggestions.put(word.word,true);
          }
  
          //NO MOVES LEFT (just follow trie until no longer possible)
          if (movesLeft==0 && length>0){
              for ( LetterNode next : pointers) {
                  if (next.charIs(query.substring(0,1)) ) {
                      next.recommend(query.substring(1), movesLeft, SAME, suggestions);
                      break;
                  }
              }
          }
  
          //CONTINUE TRAVERSAL
          //To eliminate most commutative pairs of moves:
             //we will not REMOVE after (ADDITION | CHANGE)
             //we will not ADDITION after (REMOVE | CHANGE)
          else if (movesLeft>0){
              for ( LetterNode next : pointers) {
  
                  if (length>0){
                  //some moves (change, remove, or none) can only be completed if not at end of word
  
                      if (next.charIs(query.substring(0,1)) ){
                      //no action used
                          next.recommend(query.substring(1), movesLeft, SAME, suggestions);
                      }
                      else{
                      //the next node is achievable through VARIOUS actions
                          //CHANGE next char to match next node is always an option
                          next.recommend(query.substring(1), movesLeft-1, CHANGE, suggestions);
                          //ADDITION the missing char to the query if possible
                          if (lastAction!=CHANGE && lastAction!=REMOVE) {
                              next.recommend(query, movesLeft-1, ADDITION, suggestions);
                          }
                          //REMOVE the unmatched char to the query if possible
                          if (lastAction!=ADDITION && lastAction!=CHANGE){
                              if (length>1 && next.charIs(query.substring(1,2))){
                                  next.recommend(query.substring(2), movesLeft-1, REMOVE, suggestions); //removed 1 char
                              }
                              else if (length>2 && next.charIs(query.substring(2,3)) && movesLeft==2){
                                  next.recommend(query.substring(3), movesLeft-2, REMOVE, suggestions); //removed 2 chars
                              }
                          }
                      }
                  }
                  else {
                    // we have reached the end of the query, but we can still add chars to reach the end of the word
                    if (lastAction!=CHANGE && lastAction!=REMOVE){
                        next.recommend(query, movesLeft-1, ADDITION, suggestions);
                    }
                  }
              }
          }
      }
  }
  
    //A word suggestion (with real capitalization) to be held by a node in the dictionary
  class Word{
      String word;
      public Word(String w){
          word=w;
      }
  }
}




