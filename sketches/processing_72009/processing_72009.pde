
int count = 0;

String lines[] = loadStrings("exportResults.txt");

void setup() {
  String lines[] = loadStrings("exportResults.txt");
String phrase[] = new String[lines.length];
String book[] = new String[lines.length];
String counter[] = new String[lines.length];


for (int i=0; i < lines.length - 1; i++) {


  String[] tmpStr = split(lines[i], ','); 
  println(i + " " + tmpStr[0]);
  if (int(tmpStr[2]) > 0) {
    phrase[count] = tmpStr[0];
    book[count] = tmpStr[1];
    counter[count] = tmpStr[2];
    count++;
  }
}

for (int i=0; i < phrase.length; i++) {

  if (phrase[i] != null) {
    println(phrase[i] + " " + book[i] + " " + counter[i]);
  }
    
    // VISUALS
  }
}
void draw(){
  
}
