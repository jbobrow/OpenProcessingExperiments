

String sentence = "hej med dig hej med dig";
String[] splitSentence = sentence.split(" ");
println(splitSentence);

int sidstePlads = splitSentence.length - 1;
String temp = splitSentence[0];
splitSentence[0] = splitSentence[sidstePlads];
splitSentence[sidstePlads] = temp;

println(splitSentence);
 
for(int i = 0; i < splitSentence.length; i = i+ 2){
  splitSentence[i] = "Facebook"; 
  println(splitSentence);
}
