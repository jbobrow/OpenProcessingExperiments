
/*
Coded by Kof @ 
Thu Jan 23 05:11:48 CET 2014



   ,dPYb,                  ,dPYb,
   IP'`Yb                  IP'`Yb
   I8  8I                  I8  8I
   I8  8bgg,               I8  8'
   I8 dP" "8    ,ggggg,    I8 dP
   I8d8bggP"   dP"  "Y8ggg I8dP
   I8P' "Yb,  i8'    ,8I   I8P
  ,d8    `Yb,,d8,   ,d8'  ,d8b,_
  88P      Y8P"Y8888P"    PI8"8888
                           I8 `8,
                           I8  `8,
                           I8   8I
                           I8   8I
                           I8, ,8'
                            "Y8P'

                            
*/

String FILENAME = "speeches.txt";
String SPLIT_TOKENS = " ?.,;:[]<>()\"";
boolean DEBUG = false;

float VOICE_WPM = 140.0; 

String text[];
String raw;
ArrayList words;
ArrayList nodes;

Node walker;
String result = "";
ArrayList output;

int pause = 100;
int speed = 2;

int first = 0;

void setup(){

  size(512,512);
  textFont(loadFont("SempliceRegular-8.vlw"));

  nodes = new ArrayList();

  background(0);
  textAlign(CENTER);
  text("Generating database, please wait ...",width/2,height/2);
  textAlign(LEFT);

  setUp();

  walker = (Node)nodes.get((int)random(nodes.size()));
  output = new ArrayList();
  output.add(walker.word);
}

void setUp(){
  getWords();
  castNodes();
  makeConnections();
}


void draw(){

  background(0);
  int x = 10, y = 20;
  int c = 0;

  
  

  fill(255);
  first = 0;

  for(Object a: output){
    String curr = (String)a;
    text(curr,x,y);

    float off = textWidth(curr+" ");
    x += (int)off;

    if(x>width&&y==20)  
    first = c;

    if(x>=width-40-off){

      x=10;
      y+=10;

    }
    c++;


  }


  fill(255,0,0);
  c = 0;
  for(Object o: walker.next){
    Node n = (Node)o;
    boolean sel = false;
/*
    if(mouseX>x&&mouseX<textWidth(n.word)+x&&mouseY>y-8+c*8&&mouseY<y+c*8)
    sel = true;
   if(mousePressed && sel)
      next(c);

*/
    if(c==next_id)
      sel = true;
    
       

    fill(sel?#ffcc00:#ff0000);
    text(n.word,x,y+c*8);


    c++; 
  }

  if(frameCount%3==0){
      next_id++;
        next_id = next_id%walker.next.size();
   
  }
}

void mousePressed(){
        next(next_id);
        next_id = 0;
 
}

void keyPressed(){

    if(keyCode==ENTER){
        next(next_id);
        next_id = 0;
      }else if(keyCode==DOWN){
        next_id++;
        next_id = next_id%walker.next.size();
      }else if(keyCode==UP){
        next_id--;
       if(next_id<0)
         next_id = walker.next.size()-1;
      }
}

int next_id = 0;

void next(int _id){

  walker = walker.pickNext(_id);
  result += walker.word+" ";
  output.add(walker.word);


}

class Node{
  ArrayList next;
  ArrayList positions;
  ArrayList choices;
  int id;
  float weights[];
  String word;

  Node(String _word){
    choices = new ArrayList();
    next = new ArrayList();
    word = _word;

  }

  Node pickNext(){
    try{
      Node tmp = (Node)next.get((int)random(next.size()));

      while(tmp==null||tmp==this){
        tmp = (Node)next.get((int)random(next.size()));
      }

      return tmp;
    }catch(Exception e){

      Node tmp = (Node)next.get((int)random(next.size()));
      while(tmp==null||tmp==this){
        tmp = (Node)next.get((int)random(next.size()));
      }


      return tmp;
    }
  }

  Node pickNext(int _id){
      return (Node)next.get(_id);
  }

  void addConnection(Node _n){
    if(DEBUG)
      println(word+ " is searching for: "+_n.word);
   
    next.add(_n);
  }




  void addConnection(String _in){
    if(DEBUG)
      println(word+ " is searching for: "+_in);
    int test = 0;
search:
    for(Object tmp: nodes){
      Node n = (Node)tmp; 
      if(n.word.equals(_in)){
        test = nodes.indexOf(n);
        Node newNode = (Node)nodes.get(test);
        next.add(newNode);
        break search;
      }
    }
  }

  void printConnections(){
    if(DEBUG)
      print(word+" -> ");
    for(Object tmp: next){
      Node n = (Node)tmp;
      if(DEBUG)
        print(n.word+", ");

    }
    if(DEBUG)
      println(next.size());
  }
}

void printAllConnections(){

  for(Object tmp: nodes){
    Node n = (Node)tmp;
    n.printConnections();
  }
}


void castNodes(){
  nodes = new ArrayList();
  for(Object w: words){
    String wtmp = (String)w;
    boolean has = false;

check:
    for(Object n: nodes){
      Node ntmp = (Node)n;
      if(wtmp.equals(ntmp.word)){
        has=true;
        break check;
      }
    }

    if(!has)
      nodes.add(new Node(wtmp));
  }

}

void makeConnections(){
  for(int i = 0 ; i < words.size()-1;i++){
    String tcurrent = (String)words.get(i);
    String tnext = (String)words.get(i+1);

    Node curr = getNode(tcurrent);
    Node nxt = getNode(tnext);
    boolean has = false;
check:
    for(Object o:curr.next){
      Node n = (Node)o;
      if(n.word==nxt.word){
        has = true;
        break check;
      }
    }
    
    if(!has)
    curr.addConnection(nxt);

  }
}

Node getNode(String _in){
  Node out = null;
  for(Object n: nodes){
    Node tmp = (Node)n;  
    if(tmp.word.equals(_in)){
      out = tmp;
    }
  }
  return out;

}

void getWords(){


  text = loadStrings(FILENAME);
  words = new ArrayList();
  raw = "";

  for(int i = 0 ;i < text.length;i++){
    String tmp[] = splitTokens(text[i],SPLIT_TOKENS);
    for(int ii = 0 ; ii < tmp.length;ii++){
      raw += tmp[ii]+" ";
      words.add(tmp[ii]+"");

    }
  }
}

