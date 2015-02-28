
//Bad Dreams...

void setup() {
  size(1000, 500);
  background(#CE8383);
  PFont font1= loadFont("Impact-48.vlw");
  frameRate(10);
  noStroke();
}
String[] subject() {
  String[] subj=new String[2];
  String[] plural= {
    "monsters","cows","lions","mustards","dressings","snakes","you","we","they","i","internal organs",
    "lovers","cats","hats","organisms","mice",};
  String[] singular= {"your mother","your father","your father\'s father",
    "your mother\'s mother","your aunt","grandpa","the Man","the pope","jesus","the speghetti", "your girlfriend", 
    "your ex", "a boy friend", "no one"};
  int plurality= int(random(0,1.99));
  if (plurality==0){
    subj[1]="plural";
    subj[0]=plural[int(random(0,plural.length-1))];
  }
  else{
    subj[1]="singular";
    subj[0]=singular[int(random(0,singular.length-1))];
  }
  return subj; 
}

String verb(String[] subject) {
  
  String[] verb={"hates","doesn't love", "dislikes", "eats", "fucks", "penatrates", "doesn't look at", "forgets", "fears",
  "kills", "burns", "longs for", "will not wait for"};
  String[] verbs={"hate","don't love", "dislike", "eat", "fuck", "penatrate", "don't look at", "forget", "fear",
  "kill", "burn", "long for", "will not wait for"};
  if(subject[1]=="plural"){
    return verbs[int(random(0,verbs.length-1))];
  }
  else{
    return verb[int(random(0,verbs.length-1))];
  }
}

String objects() {
  String[] noun={"your mother","your father","your father\'s father",
    "your mother\'s mother","your aunt","grandpa","the Man","the pope","jesus","the speghetti", "your girlfriend", 
    "your ex","you","us","them","me","lovers"};
  return noun[int(random(0,noun.length-1))];
}

String sentance(){
  String[] subj= subject();
  String v=verb(subj);
  String obj= objects();
  String sent= subj[0]+" "+v+" "+obj+".";
  return sent; 
}

boolean go=false;
void mousePressed(){
  go=true;
}
void mouseReleased(){
  go=false;
}

void draw() {
  fill(#CE8383, 10);
  rect(0,0,1000,500);
  if(go==true){
  float c=(random(100,255));
  float s=(random(8,48));
  fill(c,c-20,c-20);
  textSize(s);
  text(sentance(), random(0, 490), random(2, 499));
  }
}




